Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A452E10E4A0
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 09:21:58 +0000 (UTC)
Message-ID: <b867884c-dd80-e996-784f-49ea48ed1d82@intel.com>
Date: Wed, 31 May 2023 14:51:52 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230331071426.8568-1-swati2.sharma@intel.com>
 <20230406090403.577rbyr3c5zgbdot@kamilkon-desk1>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230406090403.577rbyr3c5zgbdot@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] i915/kms_fbcon_fbt: Add crct_id to
 struct
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Thanks for the review. Floated v2:
https://patchwork.freedesktop.org/series/118537/

On 06-Apr-23 2:34 PM, Kamil Konieczny wrote:
> Hi Swati,
> 
> On 2023-03-31 at 12:44:26 +0530, Swati Sharma wrote:
> 
> may you change patch description from subject ? I would like
> to see there something like you wrote below, for example:
> 
> i915/kms_fbcon_fbt: remove hard-coding of PIPE_A for CRC calc
> 
>> Remove hard-coding of PIPE_A while computing CRC.
> 
> You can write here how you did it (added crtc_id to drm_info
> struct) but imho it is not needed.
> 
> Please also test it again as CI didn't tested it.
> 
> Regards,
> Kamil
> 
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/i915/kms_fbcon_fbt.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/i915/kms_fbcon_fbt.c b/tests/i915/kms_fbcon_fbt.c
>> index 831ec867a..6c557dca7 100644
>> --- a/tests/i915/kms_fbcon_fbt.c
>> +++ b/tests/i915/kms_fbcon_fbt.c
>> @@ -39,7 +39,7 @@ IGT_TEST_DESCRIPTION("Test the relationship between fbcon and the frontbuffer "
>>   #define MAX_CONNECTORS 32
>>   
>>   struct drm_info {
>> -	int fd, debugfs_fd;
>> +	int fd, debugfs_fd, crtc_id;
>>   	struct igt_fb fb;
>>   	drmModeResPtr res;
>>   	drmModeConnectorPtr connectors[MAX_CONNECTORS];
>> @@ -117,9 +117,10 @@ static bool fbc_check_cursor_blinking(struct drm_info *drm)
>>   	igt_pipe_crc_t *pipe_crc;
>>   	igt_crc_t crc[2];
>>   	bool ret;
>> -	int i;
>> +	int i, pipe;
>>   
>> -	pipe_crc = igt_pipe_crc_new(drm->fd, PIPE_A, IGT_PIPE_CRC_SOURCE_AUTO);
>> +	pipe = kmstest_get_pipe_from_crtc_id(drm->fd, drm->crtc_id);
>> +	pipe_crc = igt_pipe_crc_new(drm->fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
>>   
>>   	igt_pipe_crc_start(pipe_crc);
>>   	igt_pipe_crc_drain(pipe_crc);
>> @@ -165,7 +166,6 @@ static void set_mode_for_one_screen(struct drm_info *drm,
>>   				    connector_possible_fn connector_possible)
>>   {
>>   	int i, rc;
>> -	uint32_t crtc_id;
>>   	drmModeModeInfoPtr mode;
>>   	uint32_t buffer_id;
>>   	drmModeConnectorPtr c = NULL;
>> @@ -182,7 +182,7 @@ static void set_mode_for_one_screen(struct drm_info *drm,
>>   	igt_require_f(i < drm->res->count_connectors,
>>   		      "No connector available\n");
>>   
>> -	crtc_id = kmstest_find_crtc_for_connector(drm->fd, drm->res, c, 0);
>> +	drm->crtc_id = kmstest_find_crtc_for_connector(drm->fd, drm->res, c, 0);
>>   
>>   	buffer_id = igt_create_fb(drm->fd, mode->hdisplay, mode->vdisplay,
>>   				  DRM_FORMAT_XRGB8888,
>> @@ -193,7 +193,7 @@ static void set_mode_for_one_screen(struct drm_info *drm,
>>   		 mode->hdisplay, mode->vdisplay,
>>   		 kmstest_connector_type_str(c->connector_type));
>>   
>> -	rc = drmModeSetCrtc(drm->fd, crtc_id, buffer_id, 0, 0,
>> +	rc = drmModeSetCrtc(drm->fd, drm->crtc_id, buffer_id, 0, 0,
>>   			    &c->connector_id, 1, mode);
>>   	igt_assert_eq(rc, 0);
>>   }
>> -- 
>> 2.25.1
>>
