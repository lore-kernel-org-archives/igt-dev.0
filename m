Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1976F10E68F
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Nov 2022 21:35:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------NbdiHqaPLBR1040Mx0px05Yj"
Message-ID: <f605162c-f374-9268-3cc9-579dd68363c2@amd.com>
Date: Thu, 17 Nov 2022 14:35:17 -0700
From: Alex Hung <alex.hung@amd.com>
To: aemad <aemad@igalia.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <cover.1668154709.git.aemad@igalia.com>
 <35b8b7adb1e5671c2c1ae43ba7ce4774@igalia.com>
Content-Language: en-US
In-Reply-To: <35b8b7adb1e5671c2c1ae43ba7ce4774@igalia.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH RFC i-g-t 0/8] tests/kms_universal_plane:
 divide `functional_test_pipe` to mini-subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "petri.latvala@intel.com" <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--------------NbdiHqaPLBR1040Mx0px05Yj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Aemad,

Thanks for breaking the test into smaller subtests.

Some GPU drivers, including amdgpu, do not allow primary plane off 
without turning crtc off 
(https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c#L385), 
but kms_universal_plane has many the below code which was guarded with 
is_amdgpu_device()

         igt_plane_set_fb(primary, NULL);
         igt_display_commit2(&data->display, COMMIT_UNIVERSAL);

Many of the is_amdgpu_device() are not present in your patches and 
kms_universal fails. I needed to add is_amdgpu_device() to patch 2~3 and 
5~7 (I didn't check 8).


------------------------------------------------------------------------
*From:* aemad <aemad@igalia.com>
*Sent:* 11 November 2022 01:31
*To:* igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
*Cc:* petri.latvala@intel.com <petri.latvala@intel.com>; 
bhanuprakash.modem@intel.com <bhanuprakash.modem@intel.com>; 
ville.syrjala@linux.intel.com <ville.syrjala@linux.intel.com>; Siqueira, 
Rodrigo <Rodrigo.Siqueira@amd.com>; Hung, Alex <Alex.Hung@amd.com>; 
markyacoub@chromium.org <markyacoub@chromium.org>; mwen@igalia.com 
<mwen@igalia.com>; andrealmeid@igalia.com <andrealmeid@igalia.com>
*Subject:* Re: [PATCH RFC i-g-t 0/8] tests/kms_universal_plane: divide 
`functional_test_pipe` to mini-subtests
Please, let me know your thoughts.

On 2022-11-11 09:29, Alaa Emad wrote:
 > Divide the `functional_test_pipe` test into seven subtests based on CRC
 > comparisons because this will make it easier to debug the test and help
 > in detecting the failure.
 >
 > First 7 patches decouple each subtest and run it individually keeping
 > `functional_test_pipe' test as it is. After making sure that each
 > subtest can run individually with the expected result on both vkms 
and i915
 > drivers, improve the test by creating `run_functional_test_pipe` and
 > call all subtests from it and call `run_functional_test_pipe` in
 > `igt_main`.
 >
 >
 > Alaa Emad (8):
 >   tests/kms_universal_plane: decouple verification of legacy and atomic
 >     api
 >   tests/kms_universal_plane: decouple verification of disabling primary
 >     plane
 >   tests/kms_universal_plane: decouple verification of re-enabling
 >     primary plane
 >   tests/kms_universal_plane: decouple verification of setup plane FB's
 >     while CRTC is disabled
 >   tests/kms_universal_plane: decouple verification of ablity to modeset
 >     with the primary plane off
 >   tests/kms_universal_plane: decouple verification of ablity to move the
 >     primary plane completely offscreen
 >   tests/kms_universal_plane: decouple verification of ablity to
 >     explicitly disable an already implicitly-disabled primary plane
 >   tests/kms_universal_plane: create the run_functional_test_pipe and
 >     call all tests from it
 >
 >  tests/kms_universal_plane.c | 416 ++++++++++++++++++++++--------------
 >  1 file changed, 261 insertions(+), 155 deletions(-)
--------------NbdiHqaPLBR1040Mx0px05Yj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Aemad,<br>
    <br>
    Thanks for breaking the test into smaller subtests.<br>
    <br>
    <p>Some GPU drivers, including amdgpu, do not allow primary plane
      off without turning crtc off
(<a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c#L385">https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c#L385</a>),
      but kms_universal_plane has many the below code which was guarded
      with is_amdgpu_device()<br>
    </p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(primary, NULL);<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit2(&amp;data-&gt;display,
      COMMIT_UNIVERSAL);<br>
    </p>
    <p>Many of the is_amdgpu_device() are not present in your patches
      and kms_universal fails. I needed to add is_amdgpu_device() to
      patch 2~3 and 5~7 (I didn't check 8).<br>
    </p>
    <div style="font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web
      (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0);">
      <br>
    </div>
    <hr style="display:inline-block;width:98%" tabindex="-1">
    <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b> aemad
        <a class="moz-txt-link-rfc2396E" href="mailto:aemad@igalia.com">&lt;aemad@igalia.com&gt;</a><br>
        <b>Sent:</b> 11 November 2022 01:31<br>
        <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
        <a class="moz-txt-link-rfc2396E" href="mailto:igt-dev@lists.freedesktop.org">&lt;igt-dev@lists.freedesktop.org&gt;</a><br>
        <b>Cc:</b> <a class="moz-txt-link-abbreviated" href="mailto:petri.latvala@intel.com">petri.latvala@intel.com</a>
        <a class="moz-txt-link-rfc2396E" href="mailto:petri.latvala@intel.com">&lt;petri.latvala@intel.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:bhanuprakash.modem@intel.com">bhanuprakash.modem@intel.com</a>
        <a class="moz-txt-link-rfc2396E" href="mailto:bhanuprakash.modem@intel.com">&lt;bhanuprakash.modem@intel.com&gt;</a>;
        <a class="moz-txt-link-abbreviated" href="mailto:ville.syrjala@linux.intel.com">ville.syrjala@linux.intel.com</a>
        <a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@linux.intel.com">&lt;ville.syrjala@linux.intel.com&gt;</a>; Siqueira, Rodrigo
        <a class="moz-txt-link-rfc2396E" href="mailto:Rodrigo.Siqueira@amd.com">&lt;Rodrigo.Siqueira@amd.com&gt;</a>; Hung, Alex
        <a class="moz-txt-link-rfc2396E" href="mailto:Alex.Hung@amd.com">&lt;Alex.Hung@amd.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:markyacoub@chromium.org">markyacoub@chromium.org</a>
        <a class="moz-txt-link-rfc2396E" href="mailto:markyacoub@chromium.org">&lt;markyacoub@chromium.org&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:mwen@igalia.com">mwen@igalia.com</a>
        <a class="moz-txt-link-rfc2396E" href="mailto:mwen@igalia.com">&lt;mwen@igalia.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:andrealmeid@igalia.com">andrealmeid@igalia.com</a>
        <a class="moz-txt-link-rfc2396E" href="mailto:andrealmeid@igalia.com">&lt;andrealmeid@igalia.com&gt;</a><br>
        <b>Subject:</b> Re: [PATCH RFC i-g-t 0/8]
        tests/kms_universal_plane: divide `functional_test_pipe` to
        mini-subtests</font>
      <div>&nbsp;</div>
    </div>
    <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
          <div class="PlainText">Please, let me know your thoughts.<br>
            <br>
            On 2022-11-11 09:29, Alaa Emad wrote:<br>
            &gt; Divide the `functional_test_pipe` test into seven
            subtests based on CRC<br>
            &gt; comparisons because this will make it easier to debug
            the test and help<br>
            &gt; in detecting the failure.<br>
            &gt; <br>
            &gt; First 7 patches decouple each subtest and run it
            individually keeping<br>
            &gt; `functional_test_pipe' test as it is. After making sure
            that each<br>
            &gt; subtest can run individually with the expected result
            on both vkms and i915<br>
            &gt; drivers, improve the test by creating
            `run_functional_test_pipe` and<br>
            &gt; call all subtests from it and call
            `run_functional_test_pipe` in<br>
            &gt; `igt_main`.<br>
            &gt; <br>
            &gt; <br>
            &gt; Alaa Emad (8):<br>
            &gt;&nbsp;&nbsp; tests/kms_universal_plane: decouple verification of
            legacy and atomic<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp; api<br>
            &gt;&nbsp;&nbsp; tests/kms_universal_plane: decouple verification of
            disabling primary<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp; plane<br>
            &gt;&nbsp;&nbsp; tests/kms_universal_plane: decouple verification of
            re-enabling<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp; primary plane<br>
            &gt;&nbsp;&nbsp; tests/kms_universal_plane: decouple verification of
            setup plane FB's<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp; while CRTC is disabled<br>
            &gt;&nbsp;&nbsp; tests/kms_universal_plane: decouple verification of
            ablity to modeset<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp; with the primary plane off<br>
            &gt;&nbsp;&nbsp; tests/kms_universal_plane: decouple verification of
            ablity to move the<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp; primary plane completely offscreen<br>
            &gt;&nbsp;&nbsp; tests/kms_universal_plane: decouple verification of
            ablity to<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp; explicitly disable an already implicitly-disabled
            primary plane<br>
            &gt;&nbsp;&nbsp; tests/kms_universal_plane: create the
            run_functional_test_pipe and<br>
            &gt;&nbsp;&nbsp;&nbsp;&nbsp; call all tests from it<br>
            &gt; <br>
            &gt;&nbsp; tests/kms_universal_plane.c | 416
            ++++++++++++++++++++++--------------<br>
            &gt;&nbsp; 1 file changed, 261 insertions(+), 155 deletions(-)<br>
          </div>
        </span></font></div>
  </body>
</html>

--------------NbdiHqaPLBR1040Mx0px05Yj--
