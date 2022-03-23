Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE30B10E044
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Mar 2022 19:01:51 +0000 (UTC)
Message-ID: <44be3ec9-2a1c-d4d4-b951-9140a73a2eca@quicinc.com>
Date: Wed, 23 Mar 2022 12:01:49 -0700
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <1647991289-19891-1-git-send-email-quic_abhinavk@quicinc.com>
 <YjsmDuhyfj4l/C7s@intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <YjsmDuhyfj4l/C7s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_kms: commit only the primary
 plane which is prepared
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, swboyd@chromium.org, igt-dev@lists.freedesktop.org,
 nganji@codeaurora.org, seanpaul@chromium.org, quic_aravindh@quicinc.com,
 quic_khsieh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ville

On 3/23/2022 6:52 AM, Ville Syrjälä wrote:
> On Tue, Mar 22, 2022 at 04:21:29PM -0700, Abhinav Kumar wrote:
>> kms_atomic's test-only sub-test prepares only one primary plane
>> but igt_plane_commit() tries to commit all the primary planes.
>>
>> For drivers having only one primary plane per display still
>> work fine but when there is more than one primary plane, since
>> FB_ID is not assigned for the second one, the API
>> igt_primary_plane_commit_legacy() ends up calling the CRTC
>> disable path incorrectly and hence failing the test.
>>
>> Since only one primary plane has been prepared, commit only
>> that one by matching the index correctly.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   lib/igt_kms.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 34a2aa0..98a6e1b 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -3189,6 +3189,8 @@ static int igt_plane_commit(igt_plane_t *plane,
>>   			    enum igt_commit_style s,
>>   			    bool fail_on_error)
>>   {
>> +	igt_plane_t *plane_primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> +
>>   	if (pipe->display->first_commit || (s == COMMIT_UNIVERSAL &&
>>   	     igt_plane_is_prop_changed(plane, IGT_PLANE_ROTATION))) {
>>   		int ret;
>> @@ -3199,7 +3201,8 @@ static int igt_plane_commit(igt_plane_t *plane,
>>   
>>   	if (plane->type == DRM_PLANE_TYPE_CURSOR && s == COMMIT_LEGACY) {
>>   		return igt_cursor_commit_legacy(plane, pipe, fail_on_error);
>> -	} else if (plane->type == DRM_PLANE_TYPE_PRIMARY && s == COMMIT_LEGACY) {
>> +	} else if (plane->type == DRM_PLANE_TYPE_PRIMARY && s == COMMIT_LEGACY &&
>> +			(plane->index == plane_primary->index)) {
> 
> I think you should be able to simplify that to just
> 'plane == plane_primary && s == COMMIT_LEGACY'

Yes that works too. I have fixed this and posted a v2.

Thanks

Abhinav
> 
>>   		return igt_primary_plane_commit_legacy(plane, pipe,
>>   						       fail_on_error);
>>   	} else {
>> -- 
>> 2.7.4
> 
