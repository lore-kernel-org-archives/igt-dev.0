Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721C810E8A8
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jun 2022 07:23:12 +0000 (UTC)
Message-ID: <37d0d9bc-d56f-dfd5-9a48-42d2ab043c09@intel.com>
Date: Wed, 8 Jun 2022 12:52:49 +0530
Content-Language: en-US
To: "Navare, Manasi" <manasi.d.navare@intel.com>, <karthik.b.s@intel.com>
References: <20220502145114.3188493-1-bhanuprakash.modem@intel.com>
 <20220512200505.GA472559@mdnavare-mobl1.jf.intel.com>
 <4e1af539-7d38-daed-9799-db010cd61cb5@intel.com>
 <20220607223801.GA499397@mdnavare-mobl1.jf.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220607223801.GA499397@mdnavare-mobl1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] lib/igt_kms: Add a helper function to check
 Bigjoiner support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed-08-06-2022 04:08 am, Navare, Manasi wrote:
> On Fri, May 13, 2022 at 08:08:42AM +0530, Modem, Bhanuprakash wrote:
>> On Fri-13-05-2022 01:35 am, Navare, Manasi wrote:
>>> On Mon, May 02, 2022 at 08:21:14PM +0530, Bhanuprakash Modem wrote:
>>>> Create a helper function to check that the system supports the
>>>> given crtc/connector mode(s).
>>>>
>>>> Example: Pipe-D won't support Bigjoiner, hence we can't use the
>>>> connector modes greater than 5K on Pipe-D
>>>>
>>>> To use this helper, each individual subtest needs to set the
>>>> @pipe to a specific @output by igt_output_set_pipe() and call
>>>> this helper to check the validity of the combo.
>>>
>>> Thank you for taking a stab at cleaning this up and adding this check in
>>> IGT.
>>>
>>> In all cases, always the bigjoiner can only be supported on pipes 0 -
>>> total_pipes - 1
>>> So say the total pipes available in the platform are n, any mode > 5K
>>> can only be requested on pipes 0- n-1 and will be rejected on pipe n.
>>>
>>> Cant we just use this simple check in igt_check_bigjoiner_support() {
>>>
>>> total_pipes = n; (based on platform hardcode that say now for all
>>> platforms that support bigjoiner, total_pipes = 4)
>>> If mode > 5K and pipe = 4,
>>> skip test
>>> }
>>
>> Totally agreed in case of single display config. What about multidisplay
>> config?
>>
>> There are many scenarios that we need to consider.
>> Example:
>> 1) Assume we have a setup with two 8K monitors connected and 4 pipes
>> enabled, then the only possible combinations are:
>>
>> Pipe-A-Output-1, Pipe-C-Output-2
>> Pipe-C-Output-1, Pipe-A-Output-1
> 
>>
>> 2) Assume we have 2 monitors connected (one 8K, one 4K) and 4 pipes enabled,
>> then the possible combinations are:
>>
>> Pipe-A-4K, Pipe-B-8K
>> Pipe-A-4K, Pipe-C-8K
>> Pipe-A-8K, Pipe-C-4K
>> Pipe-A-8K, Pipe-D-4K
>> Pipe-B-4K, Pipe-C-8K
>> Pipe-B-8K, Pipe-D-4K
> 
> Okay yes in multi display configurations, we would need to make sure if
> 8K requested on a pipe then consecutive pipe is free.
> 
> Actually this kind of validatity is checked in the kernel and if the
> mode gets rejected that should be expected behaviour.
> 
> So here wehn we call this helper to check the validity of the combo, if
> we find a particular combo is not valid, do we then add a negative test
> for that combo and make sure kernel rejects the mode successfully?

Yes, I guess Karthik is already working on it.

> 
> In that case having this helper would make sense.
> Could you please clarify that in the commit message if that is the case.
> And in that case, you can use my R-B on this

Sure, I'll float a new rev by adding this info.

- Bhanu

> 
> Manasi
> 
>>
>> - Bhanu
>>
>>>
>>> Manasi
>>>
>>>>
>>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>> ---
>>>>    lib/igt_kms.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>    lib/igt_kms.h |  2 ++
>>>>    2 files changed, 68 insertions(+)
>>>>
>>>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>>>> index 7838ff28..e277193d 100644
>>>> --- a/lib/igt_kms.c
>>>> +++ b/lib/igt_kms.c
>>>> @@ -5379,3 +5379,69 @@ int igt_get_dsc_debugfs_fd(int drmfd, drmModeConnector *connector)
>>>>    	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
>>>>    }
>>>> +
>>>> +/*
>>>> + * igt_check_bigjoiner_support:
>>>> + * @display: a pointer to an #igt_display_t structure
>>>> + *
>>>> + * Get all active pipes from connected outputs (i.e. pending_pipe != PIPE_NONE)
>>>> + * and check those pipes supports the selected mode(s).
>>>> + *
>>>> + * Example: Pipe-D can't support mode > 5K
>>>> + *
>>>> + * Returns: true if a valid crtc/connector mode combo found, else false
>>>> + */
>>>> +bool igt_check_bigjoiner_support(igt_display_t *display)
>>>> +{
>>>> +	uint8_t i, total_pipes = 0, active_pipes = 0;
>>>> +	enum pipe p;
>>>> +	struct {
>>>> +		enum pipe idx;
>>>> +		drmModeModeInfo *mode;
>>>> +	} pipes[IGT_MAX_PIPES];
>>>> +
>>>> +	/* Get total enabled pipes. */
>>>> +	for_each_pipe(display, p)
>>>> +		total_pipes++;
>>>> +
>>>> +	/*
>>>> +	 * Get list of active pipes those were set by igt_output_set_pipe()
>>>> +	 * just before calling this function.
>>>> +	 */
>>>> +	for (i = 0 ; i < display->n_outputs; i++) {
>>>> +		igt_output_t *output = &display->outputs[i];
>>>> +
>>>> +		if (output->pending_pipe == PIPE_NONE)
>>>> +			continue;
>>>> +
>>>> +		pipes[active_pipes].idx = output->pending_pipe;
>>>> +		pipes[active_pipes].mode = igt_output_get_mode(output);
>>>> +		active_pipes++;
>>>> +	}
>>>> +
>>>> +	if (active_pipes)
>>>> +		return true;
>>>> +
>>>> +	/*
>>>> +	 * if mode.hdisplay > 5120, then ignore
>>>> +	 *  - last crtc in single/multi-connector config
>>>> +	 *  - consecutive crtcs in multi-connector config
>>>> +	 *
>>>> +	 * in multi-connector config ignore if
>>>> +	 *  - previous crtc mode.hdisplay > 5120 and
>>>> +	 *  - current & previous crtcs are consecutive
>>>> +	 */
>>>> +	for (i = 0; i < active_pipes; i++) {
>>>> +		if (((pipes[i].mode->hdisplay > MAX_HDISPLAY_PER_PIPE) &&
>>>> +		     ((pipes[i].idx >= (total_pipes - 1)) ||
>>>> +		      ((i < (active_pipes - 1)) && (abs(pipes[i + 1].idx - pipes[i].idx) <= 1)))) ||
>>>> +		    ((i > 0) && (pipes[i - 1].mode->hdisplay > MAX_HDISPLAY_PER_PIPE) &&
>>>> +		     (abs(pipes[i].idx - pipes[i - 1].idx) <= 1))) {
>>>> +			igt_debug("CRTC/Connector is not possible with selected mode(s).\n");
>>>> +
>>>> +			return false;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return true;
>>>> +}
>>>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>>>> index e9ecd21e..8a14bb3c 100644
>>>> --- a/lib/igt_kms.h
>>>> +++ b/lib/igt_kms.h
>>>> @@ -109,6 +109,7 @@ const char *kmstest_connector_status_str(int status);
>>>>    const char *kmstest_connector_type_str(int type);
>>>>    void kmstest_dump_mode(drmModeModeInfo *mode);
>>>> +#define MAX_HDISPLAY_PER_PIPE 5120
>>>>    int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id);
>>>>    void kmstest_set_vt_graphics_mode(void);
>>>> @@ -947,5 +948,6 @@ int igt_force_dsc_enable(int drmfd, drmModeConnector *connector);
>>>>    int igt_force_dsc_enable_bpp(int drmfd, drmModeConnector *connector,
>>>>    				int bpp);
>>>>    int igt_get_dsc_debugfs_fd(int drmfd, drmModeConnector *connector);
>>>> +bool igt_check_bigjoiner_support(igt_display_t *display);
>>>>    #endif /* __IGT_KMS_H__ */
>>>> -- 
>>>> 2.35.1
>>>>
>>
