Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7260C10E0F1
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 00:14:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------bAWtbp2qS70BLPz1euSP5EE2"
Message-ID: <fd7d8c65-d943-c7ca-2f4d-fc5a9ac7bbd9@amd.com>
Date: Wed, 14 Jun 2023 20:14:35 -0400
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 janga.rahul.kumar@intel.com, David Zhang <dingchen.zhang@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
 <20230516165058.4047595-6-bhanuprakash.modem@intel.com>
 <20230614123933.5aqzgq2f4y4hrn47@kamilkon-desk1>
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20230614123933.5aqzgq2f4y4hrn47@kamilkon-desk1>
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 05/20] tests/amdgpu: Close the fd before exit
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

--------------bAWtbp2qS70BLPz1euSP5EE2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kamil,

Thanks for letting us know about new(?) function
/drm_close_driver/.

Is there a pending change, I could not find this function in the DRM or IGT.

We open the driver with /drm_open_driver/, but then we use close vs /drm_close_driver/. I makes sense to have a symmetrical call:
/open/close/ and /drm_open_driver/drm_close_driver/


Thanks, Vitaly

On 2023-06-14 08:39, Kamil Konieczny wrote:
> Hi Bhanuprakash,
>
> +cc Vitaliy and Christian
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
>
> Regards,
> Kamil
>
> On 2023-05-16 at 22:20:43 +0530, Bhanuprakash Modem wrote:
>> Close the file descriptor before exiting the test.
>>
>> Cc: David Zhang <dingchen.zhang@amd.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>  tests/amdgpu/amd_abm.c                 | 1 +
>>  tests/amdgpu/amd_assr.c                | 1 +
>>  tests/amdgpu/amd_freesync_video_mode.c | 1 +
>>  tests/amdgpu/amd_mem_leak.c            | 1 +
>>  tests/amdgpu/amd_psr.c                 | 3 ++-
>>  tests/amdgpu/amd_vrr_range.c           | 1 +
>>  6 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
>> index 9400ed806..082da7ed6 100644
>> --- a/tests/amdgpu/amd_abm.c
>> +++ b/tests/amdgpu/amd_abm.c
>> @@ -378,5 +378,6 @@ igt_main
>>  
>>  	igt_fixture {
>>  		igt_display_fini(&data.display);
>> +		drm_close_driver(data.drm_fd);
>>  	}
>>  }
>> diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
>> index 80cbbe8e9..fc2367f99 100644
>> --- a/tests/amdgpu/amd_assr.c
>> +++ b/tests/amdgpu/amd_assr.c
>> @@ -299,5 +299,6 @@ igt_main
>>  	igt_fixture
>>  	{
>>  		igt_display_fini(&data.display);
>> +		drm_close_driver(data.fd);
>>  	}
>>  }
>> diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
>> index 579d24436..62d42a06c 100644
>> --- a/tests/amdgpu/amd_freesync_video_mode.c
>> +++ b/tests/amdgpu/amd_freesync_video_mode.c
>> @@ -868,5 +868,6 @@ igt_main
>>  
>>  	igt_fixture {
>>  		igt_display_fini(&data.display);
>> +		drm_close_driver(data.drm_fd);
>>  	}
>>  }
>> diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
>> index dee563cbe..e4a4b5c47 100644
>> --- a/tests/amdgpu/amd_mem_leak.c
>> +++ b/tests/amdgpu/amd_mem_leak.c
>> @@ -232,5 +232,6 @@ igt_main
>>  	igt_fixture
>>  	{
>>  		igt_display_fini(&data.display);
>> +		drm_close_driver(data.fd);
>>  	}
>>  }
>> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
>> index 966a0dccf..3932e143a 100644
>> --- a/tests/amdgpu/amd_psr.c
>> +++ b/tests/amdgpu/amd_psr.c
>> @@ -640,7 +640,7 @@ static void run_check_psr_su_cursor(data_t *data, bool test_mpo)
>>  	 * panning the primary plane at the top-left of screen
>>  	 * set alpha region in overlay plane and set alpha to 0.0 to show primary plane
>>  	 * set cursor plane and starting from position of (0, 0)
>> -	 */ 
>> +	 */
>>  	draw_color_alpha(&data->ov_fb[0], 0, 0, data->pfb_w, data->pfb_h, 1.0, 1.0, 1.0, .0);
>>  	igt_plane_set_fb(data->primary, &data->pm_fb[0]);
>>  	igt_plane_set_fb(data->overlay, &data->ov_fb[0]);
>> @@ -763,5 +763,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>>  		}
>>  		close(data.debugfs_fd);
>>  		igt_display_fini(&data.display);
>> +		drm_close_driver(data.fd);
>>  	}
>>  }
>> diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
>> index 2f27296dd..cacd668cd 100644
>> --- a/tests/amdgpu/amd_vrr_range.c
>> +++ b/tests/amdgpu/amd_vrr_range.c
>> @@ -338,5 +338,6 @@ igt_main
>>  	igt_fixture
>>  	{
>>  		igt_display_fini(&data.display);
>> +		drm_close_driver(data.fd);
>>  	}
>>  }
>> -- 
>> 2.40.0
>>
--------------bAWtbp2qS70BLPz1euSP5EE2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Kamil,</p>
    <p>Thanks for letting us know about new(?) function<br>
      <i>drm_close_driver</i>.</p>
    <p>Is there a pending change, I could not find this function in the
      DRM or IGT.<br>
      <br>
      We open the driver with <i>drm_open_driver</i>, but then we use
      close vs <i>drm_close_driver</i>. I makes sense to have a
      symmetrical call:<br>
      <i>open/close</i> and <i>drm_open_driver/drm_close_driver</i></p>
    <p><br>
    </p>
    <p>Thanks, Vitaly<br>
    </p>
    <div class="moz-cite-prefix">On 2023-06-14 08:39, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230614123933.5aqzgq2f4y4hrn47@kamilkon-desk1">
      <pre class="moz-quote-pre" wrap="">Hi Bhanuprakash,

+cc Vitaliy and Christian

Cc: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>

Regards,
Kamil

On 2023-05-16 at 22:20:43 +0530, Bhanuprakash Modem wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Close the file descriptor before exiting the test.

Cc: David Zhang <a class="moz-txt-link-rfc2396E" href="mailto:dingchen.zhang@amd.com">&lt;dingchen.zhang@amd.com&gt;</a>
Cc: Harry Wentland <a class="moz-txt-link-rfc2396E" href="mailto:harry.wentland@amd.com">&lt;harry.wentland@amd.com&gt;</a>
Signed-off-by: Bhanuprakash Modem <a class="moz-txt-link-rfc2396E" href="mailto:bhanuprakash.modem@intel.com">&lt;bhanuprakash.modem@intel.com&gt;</a>
---
 tests/amdgpu/amd_abm.c                 | 1 +
 tests/amdgpu/amd_assr.c                | 1 +
 tests/amdgpu/amd_freesync_video_mode.c | 1 +
 tests/amdgpu/amd_mem_leak.c            | 1 +
 tests/amdgpu/amd_psr.c                 | 3 ++-
 tests/amdgpu/amd_vrr_range.c           | 1 +
 6 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 9400ed806..082da7ed6 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -378,5 +378,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&amp;data.display);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
index 80cbbe8e9..fc2367f99 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -299,5 +299,6 @@ igt_main
 	igt_fixture
 	{
 		igt_display_fini(&amp;data.display);
+		drm_close_driver(data.fd);
 	}
 }
diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index 579d24436..62d42a06c 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -868,5 +868,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&amp;data.display);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
index dee563cbe..e4a4b5c47 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -232,5 +232,6 @@ igt_main
 	igt_fixture
 	{
 		igt_display_fini(&amp;data.display);
+		drm_close_driver(data.fd);
 	}
 }
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 966a0dccf..3932e143a 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -640,7 +640,7 @@ static void run_check_psr_su_cursor(data_t *data, bool test_mpo)
 	 * panning the primary plane at the top-left of screen
 	 * set alpha region in overlay plane and set alpha to 0.0 to show primary plane
 	 * set cursor plane and starting from position of (0, 0)
-	 */ 
+	 */
 	draw_color_alpha(&amp;data-&gt;ov_fb[0], 0, 0, data-&gt;pfb_w, data-&gt;pfb_h, 1.0, 1.0, 1.0, .0);
 	igt_plane_set_fb(data-&gt;primary, &amp;data-&gt;pm_fb[0]);
 	igt_plane_set_fb(data-&gt;overlay, &amp;data-&gt;ov_fb[0]);
@@ -763,5 +763,6 @@ igt_main_args(&quot;&quot;, long_options, help_str, opt_handler, NULL)
 		}
 		close(data.debugfs_fd);
 		igt_display_fini(&amp;data.display);
+		drm_close_driver(data.fd);
 	}
 }
diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
index 2f27296dd..cacd668cd 100644
--- a/tests/amdgpu/amd_vrr_range.c
+++ b/tests/amdgpu/amd_vrr_range.c
@@ -338,5 +338,6 @@ igt_main
 	igt_fixture
 	{
 		igt_display_fini(&amp;data.display);
+		drm_close_driver(data.fd);
 	}
 }
-- 
2.40.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------bAWtbp2qS70BLPz1euSP5EE2--
