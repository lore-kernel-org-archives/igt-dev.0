Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631536E08B
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Oct 2018 05:49:29 +0000 (UTC)
References: <1540227940-3064-1-git-send-email-ramalingam.c@intel.com>
 <20181022224526.28550.36416@emeril.freedesktop.org>
From: "C, Ramalingam" <ramalingam.c@intel.com>
Message-ID: <b2e236ed-a01d-159e-0042-6ec2184cbea6@intel.com>
Date: Tue, 23 Oct 2018 11:19:26 +0530
MIME-Version: 1.0
In-Reply-To: <20181022224526.28550.36416@emeril.freedesktop.org>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv5=2C1/2=5D_lib/debugfs=3A_function_t?=
 =?utf-8?q?o_open_connector_debugfs_dir?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0170087887=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0170087887==
Content-Type: multipart/alternative;
 boundary="------------88F5AA092F1A2816D13CA727"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------88F5AA092F1A2816D13CA727
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/23/2018 4:15 AM, Patchwork wrote:
> == Series Details ==
>
> Series: series starting with [i-g-t,v5,1/2] lib/debugfs: function to open connector debugfs dir
> URL   : https://patchwork.freedesktop.org/series/51338/
> State : failure
>
> == Summary ==
>
> = CI Bug Log - changes from CI_DRM_5013 -> IGTPW_1974 =
>
> == Summary - FAILURE ==
>
>    Serious unknown changes coming with IGTPW_1974 absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_1974, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in CI.
>
>    External URL: https://patchwork.freedesktop.org/api/1.0/series/51338/revisions/1/mbox/
>
> == Possible new issues ==
>
>    Here are the unknown changes that may have been introduced in IGTPW_1974:
>
>    === IGT changes ===
>
>      ==== Possible regressions ====
>
>      igt@drv_selftest@live_coherency:
>        fi-byt-j1900:       PASS -> DMESG-WARN

Daniel,

__unclaimed_reg_debug warning is not related to these changes.

--Ram

>      
> == Known issues ==
>
>    Here are the changes found in IGTPW_1974 that come from known issues:
>
>    === IGT changes ===
>
>      ==== Issues hit ====
>
>      igt@gem_exec_store@basic-all:
>        fi-icl-u:           NOTRUN -> DMESG-WARN (fdo#107724) +25
>
>      igt@gem_exec_store@basic-bsd:
>        fi-icl-u:           NOTRUN -> DMESG-WARN (fdo#107732) +7
>
>      igt@gem_exec_suspend@basic-s3:
>        fi-icl-u:           NOTRUN -> DMESG-WARN (fdo#108512)
>
>      igt@kms_flip@basic-flip-vs-dpms:
>        fi-skl-6700hq:      PASS -> DMESG-WARN (fdo#105998)
>
>      igt@kms_frontbuffer_tracking@basic:
>        fi-byt-clapper:     PASS -> FAIL (fdo#103167)
>
>      igt@prime_vgem@basic-fence-flip:
>        fi-cfl-8700k:       PASS -> FAIL (fdo#104008)
>
>      
>      ==== Possible fixes ====
>
>      igt@gem_exec_suspend@basic-s4-devices:
>        fi-blb-e6850:       INCOMPLETE (fdo#107718) -> PASS
>
>      igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b:
>        fi-byt-clapper:     FAIL (fdo#107362) -> PASS
>
>      
>    fdo#103167 https://bugs.freedesktop.org/show_bug.cgi?id=103167
>    fdo#104008 https://bugs.freedesktop.org/show_bug.cgi?id=104008
>    fdo#105998 https://bugs.freedesktop.org/show_bug.cgi?id=105998
>    fdo#107362 https://bugs.freedesktop.org/show_bug.cgi?id=107362
>    fdo#107718 https://bugs.freedesktop.org/show_bug.cgi?id=107718
>    fdo#107724 https://bugs.freedesktop.org/show_bug.cgi?id=107724
>    fdo#107732 https://bugs.freedesktop.org/show_bug.cgi?id=107732
>    fdo#108512 https://bugs.freedesktop.org/show_bug.cgi?id=108512
>
>
> == Participating hosts (41 -> 46) ==
>
>    Additional (10): fi-icl-u fi-skl-guc fi-bdw-gvtdvm fi-glk-dsi fi-gdg-551 fi-pnv-d510 fi-ivb-3520m fi-kbl-7560u fi-byt-n2820 fi-snb-2600
>    Missing    (5): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-icl-u2 fi-ivb-3770
>
>
> == Build changes ==
>
>      * IGT: IGT_4684 -> IGTPW_1974
>
>    CI_DRM_5013: 0008b23799728680da3d6d871d46f746a3f69c35 @ git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_1974: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1974/
>    IGT_4684: 6f27fddc6dd79c0486181b64201c6773c5c42a24 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>
>
>
> == Testlist changes ==
>
> +igt@kms_content_protection@atomic
> +igt@kms_content_protection@legacy
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1974/issues.html

--------------88F5AA092F1A2816D13CA727
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/23/2018 4:15 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20181022224526.28550.36416@emeril.freedesktop.org">
      <pre class="moz-quote-pre" wrap="">== Series Details ==

Series: series starting with [i-g-t,v5,1/2] lib/debugfs: function to open connector debugfs dir
URL   : <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/51338/">https://patchwork.freedesktop.org/series/51338/</a>
State : failure

== Summary ==

= CI Bug Log - changes from CI_DRM_5013 -&gt; IGTPW_1974 =

== Summary - FAILURE ==

  Serious unknown changes coming with IGTPW_1974 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_1974, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/api/1.0/series/51338/revisions/1/mbox/">https://patchwork.freedesktop.org/api/1.0/series/51338/revisions/1/mbox/</a>

== Possible new issues ==

  Here are the unknown changes that may have been introduced in IGTPW_1974:

  === IGT changes ===

    ==== Possible regressions ====

    igt@drv_selftest@live_coherency:
      fi-byt-j1900:       PASS -&gt; DMESG-WARN</pre>
    </blockquote>
    <pre>Daniel,

__unclaimed_reg_debug warning is not related to these changes.

--Ram
</pre>
    <blockquote type="cite"
      cite="mid:20181022224526.28550.36416@emeril.freedesktop.org">
      <pre class="moz-quote-pre" wrap="">
    
== Known issues ==

  Here are the changes found in IGTPW_1974 that come from known issues:

  === IGT changes ===

    ==== Issues hit ====

    igt@gem_exec_store@basic-all:
      fi-icl-u:           NOTRUN -&gt; DMESG-WARN (fdo#107724) +25

    igt@gem_exec_store@basic-bsd:
      fi-icl-u:           NOTRUN -&gt; DMESG-WARN (fdo#107732) +7

    igt@gem_exec_suspend@basic-s3:
      fi-icl-u:           NOTRUN -&gt; DMESG-WARN (fdo#108512)

    igt@kms_flip@basic-flip-vs-dpms:
      fi-skl-6700hq:      PASS -&gt; DMESG-WARN (fdo#105998)

    igt@kms_frontbuffer_tracking@basic:
      fi-byt-clapper:     PASS -&gt; FAIL (fdo#103167)

    igt@prime_vgem@basic-fence-flip:
      fi-cfl-8700k:       PASS -&gt; FAIL (fdo#104008)

    
    ==== Possible fixes ====

    igt@gem_exec_suspend@basic-s4-devices:
      fi-blb-e6850:       INCOMPLETE (fdo#107718) -&gt; PASS

    igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b:
      fi-byt-clapper:     FAIL (fdo#107362) -&gt; PASS

    
  fdo#103167 <a class="moz-txt-link-freetext" href="https://bugs.freedesktop.org/show_bug.cgi?id=103167">https://bugs.freedesktop.org/show_bug.cgi?id=103167</a>
  fdo#104008 <a class="moz-txt-link-freetext" href="https://bugs.freedesktop.org/show_bug.cgi?id=104008">https://bugs.freedesktop.org/show_bug.cgi?id=104008</a>
  fdo#105998 <a class="moz-txt-link-freetext" href="https://bugs.freedesktop.org/show_bug.cgi?id=105998">https://bugs.freedesktop.org/show_bug.cgi?id=105998</a>
  fdo#107362 <a class="moz-txt-link-freetext" href="https://bugs.freedesktop.org/show_bug.cgi?id=107362">https://bugs.freedesktop.org/show_bug.cgi?id=107362</a>
  fdo#107718 <a class="moz-txt-link-freetext" href="https://bugs.freedesktop.org/show_bug.cgi?id=107718">https://bugs.freedesktop.org/show_bug.cgi?id=107718</a>
  fdo#107724 <a class="moz-txt-link-freetext" href="https://bugs.freedesktop.org/show_bug.cgi?id=107724">https://bugs.freedesktop.org/show_bug.cgi?id=107724</a>
  fdo#107732 <a class="moz-txt-link-freetext" href="https://bugs.freedesktop.org/show_bug.cgi?id=107732">https://bugs.freedesktop.org/show_bug.cgi?id=107732</a>
  fdo#108512 <a class="moz-txt-link-freetext" href="https://bugs.freedesktop.org/show_bug.cgi?id=108512">https://bugs.freedesktop.org/show_bug.cgi?id=108512</a>


== Participating hosts (41 -&gt; 46) ==

  Additional (10): fi-icl-u fi-skl-guc fi-bdw-gvtdvm fi-glk-dsi fi-gdg-551 fi-pnv-d510 fi-ivb-3520m fi-kbl-7560u fi-byt-n2820 fi-snb-2600 
  Missing    (5): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-icl-u2 fi-ivb-3770 


== Build changes ==

    * IGT: IGT_4684 -&gt; IGTPW_1974

  CI_DRM_5013: 0008b23799728680da3d6d871d46f746a3f69c35 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_1974: <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1974/">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1974/</a>
  IGT_4684: 6f27fddc6dd79c0486181b64201c6773c5c42a24 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_content_protection@atomic
+igt@kms_content_protection@legacy

== Logs ==

For more details see: <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1974/issues.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1974/issues.html</a>
</pre>
    </blockquote>
  </body>
</html>

--------------88F5AA092F1A2816D13CA727--

--===============0170087887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0170087887==--
