Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACF910ED97
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 19:56:40 +0000 (UTC)
Message-ID: <6e5671ce-90e1-edbf-de48-8e6f5f64dbbc@quicinc.com>
Date: Mon, 28 Mar 2022 12:56:37 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Mark Yacoub <markyacoub@chromium.org>
References: <1648062054-3729-1-git-send-email-quic_abhinavk@quicinc.com>
 <CAJUqKUpc+3+zYvH0HktxB0BcGWVZ=tDh+twkS2H+E9aaNAa0jA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAJUqKUpc+3+zYvH0HktxB0BcGWVZ=tDh+twkS2H+E9aaNAa0jA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib/igt_kms: commit only the primary
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

Applied.

Thanks

Abhinav

On 3/24/2022 1:54 PM, Mark Yacoub wrote:
> looking at ville's comment being addressed, lgtm.
> 
> On Wed, Mar 23, 2022 at 3:01 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
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
>> that one by matching the primary_plane handle with the plane
>> which has been passed.
>>
>> changes in v2:
>>          - compare the primary_plane and current plane's handle
>>            to determine whether the current plane is the primary
>>            plane instead of comparing the index
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Mark Yacoub <markyacoub@chromium.org>
>> ---
>>   lib/igt_kms.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 34a2aa0..7838ff2 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -3189,6 +3189,8 @@ static int igt_plane_commit(igt_plane_t *plane,
>>                              enum igt_commit_style s,
>>                              bool fail_on_error)
>>   {
>> +       igt_plane_t *plane_primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> +
>>          if (pipe->display->first_commit || (s == COMMIT_UNIVERSAL &&
>>               igt_plane_is_prop_changed(plane, IGT_PLANE_ROTATION))) {
>>                  int ret;
>> @@ -3199,7 +3201,7 @@ static int igt_plane_commit(igt_plane_t *plane,
>>
>>          if (plane->type == DRM_PLANE_TYPE_CURSOR && s == COMMIT_LEGACY) {
>>                  return igt_cursor_commit_legacy(plane, pipe, fail_on_error);
>> -       } else if (plane->type == DRM_PLANE_TYPE_PRIMARY && s == COMMIT_LEGACY) {
>> +       } else if (plane == plane_primary && s == COMMIT_LEGACY) {
>>                  return igt_primary_plane_commit_legacy(plane, pipe,
>>                                                         fail_on_error);
>>          } else {
>> --
>> 2.7.4
>>
