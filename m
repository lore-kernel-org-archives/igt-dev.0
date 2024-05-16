Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB4BC25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 12:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9256610ECC0;
	Thu, 16 May 2024 12:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qih7kZMS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E147410ECC0
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 12:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715862851; x=1747398851;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=BHpgc4ohT3gDy+ea5IXfcC/nE56BmYVuj7bmfZmJIsI=;
 b=Qih7kZMS1IxhjhdNFlMMNGUJhAOqExp6UrUrO8R8zMWCsOyq7SrSSFcB
 fHbNDIyi2PGLQ8YbvdfkEEV9gdsbZCfUkutMSv4BdcskBHhanV7i4CXrx
 HlxpilOrOyXQ12DGN0FnRDd6pqJFtiaGCYkirXJKW8Y6aub9pBDTgNsmN
 eWxk0BegF93YDWrnwbOCESFEeQXH5gRsL9PkQ1Mtfx4Kfutk2TNFsTqZ0
 KCvejtFwsLstWLdkFiFz/wYiHjoq2tJAgxTv9qMpYzCG7rLqBsfaU22yh
 P0g0UMxHGkDNv57LUfEWhFfxJ6BiE33UxoZ+XDaZUGayJ6qxy34jGhb1E Q==;
X-CSE-ConnectionGUID: DEXn55A+SQ6p8MnIBSDuFA==
X-CSE-MsgGUID: +ORmcQWxRZGxx5Ul9txVsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23374200"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208,217";a="23374200"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 05:34:10 -0700
X-CSE-ConnectionGUID: WDEML+/KQoOAJP+/7bU3Ew==
X-CSE-MsgGUID: OH45iMRcTWqEE2SAnYcWeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208,217";a="31515848"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.4.197])
 ([10.246.4.197])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 05:34:09 -0700
Content-Type: multipart/alternative;
 boundary="------------UYGLOGM35H0Is8KfpVbZ2O4Z"
Message-ID: <c21d2c72-4bc6-4d24-8640-b28d075d70f8@intel.com>
Date: Thu, 16 May 2024 14:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_GitLab=2EPipeline=3A_warning_for_lib/gpgp?=
 =?UTF-8?Q?u=3A_add_shader_support_=28rev2=29?=
To: igt-dev@lists.freedesktop.org
References: <20240515-iga64_inline_ups-v2-0-693743cb0985@intel.com>
 <171577034951.2117833.3616824896991262948@8e613ede5ea5>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <171577034951.2117833.3616824896991262948@8e613ede5ea5>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------UYGLOGM35H0Is8KfpVbZ2O4Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15.05.2024 12:52, Patchwork wrote:
> == Series Details ==
>
> Series: lib/gpgpu: add shader support (rev2)
> URL   :https://patchwork.freedesktop.org/series/133020/
> State : warning
>
> == Summary ==
>
> Pipeline status: FAILED.
>
> seehttps://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1178181  for the overview.
>
> build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58765598):

Apparently clang still (?) does not support raw string literals, shall I 
switch to old ugly c literals:

+ emit_iga64_code(shdr, eot, "\n\ +(W) mov (8|M0) r112.0<1>:ud 
r0.0<8;8,1>:ud \n\+#if GEN_VER < 1250\n\+(W) send.ts (16|M0) null r112 
null 0x10000000 0x02000010 {EOT,@1} // wr:1+0, rd:0; end of 
thread\n\+#else\n\+(W) send.gtwy (8|M0) null r112 src1_null 0 0x02000000 
{EOT}\n\+#endif\n\+ "); or since it is warning can we ignore it? :)

>    #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof(arr[0]))
>                                   ^~~~~
>    ../lib/gpgpu_shader.c:312:3: error: expected ';' after expression
>            )ASM", 2, y_offset, 3, value, value, value, value);
>             ^
>             ;
>    ../lib/gpgpu_shader.c:312:6: warning: missing terminating '"' character [-Winvalid-pp-token]
>            )ASM", 2, y_offset, 3, value, value, value, value);
>                ^
>    ../lib/gpgpu_shader.c:312:3: error: use of undeclared identifier 'ASM'
>            )ASM", 2, y_offset, 3, value, value, value, value);
>             ^
>    6 warnings and 12 errors generated.
>    ninja: build stopped: subcommand failed.
>    section_end:1715769978:step_script
>    section_start:1715769978:cleanup_file_variables
>    Cleaning up project directory and file based variables
>    section_end:1715769979:cleanup_file_variables
>    ERROR: Job failed: exit code 1
>    
>
> build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58765596):
>    Checking for function "outb" : YES
>    Checking if "cpuid.h" links: YES
>    Header <unistd.h> has symbol "gettid": YES
>    Checking whether type "struct sysinfo" has member "totalram" : YES
>    Checking for function "memfd_create" : YES
>    Configuring config.h using configuration
>    Program python3 found: YES (/usr/bin/python3)
>    lib/meson.build:236: WARNING: Identifier 'in' will become a reserved keyword in a future release. Please rename it.
>    
>    lib/meson.build:236:9: ERROR:  Expecting eol got id.
>        if f in iga64_assembly_sources
>             ^

Grepping internet suggests that meson should be updated :) I have not 
spotted better solution.
I guess it just matter to replace line in meson.build:
meson_version : '>=0.47.2'
with sth bigger.

Regards
Andrzej

>    
>    A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
>    section_end:1715769970:step_script
>    section_start:1715769970:cleanup_file_variables
>    Cleaning up project directory and file based variables
>    section_end:1715769971:cleanup_file_variables
>    ERROR: Job failed: exit code 1
>
> == Logs ==
>
> For more details see:https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1178181

--------------UYGLOGM35H0Is8KfpVbZ2O4Z
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 15.05.2024 12:52, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:171577034951.2117833.3616824896991262948@8e613ede5ea5">
      <pre class="moz-quote-pre" wrap="">== Series Details ==

Series: lib/gpgpu: add shader support (rev2)
URL   : <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/133020/">https://patchwork.freedesktop.org/series/133020/</a>
State : warning

== Summary ==

Pipeline status: FAILED.

see <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1178181">https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1178181</a> for the overview.

build:tests-fedora-clang has failed (<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58765598">https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58765598</a>):</pre>
    </blockquote>
    <br>
    Apparently clang still (?) does not support raw string literals,
    shall I switch to old ugly c literals:<br>
    <pre class="moz-quote-pre" wrap=""><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">+	emit_iga64_code(shdr, eot, "</span>\n\
<span class="hljs-addition">+(W)     mov (8|M0)               r112.0&lt;1&gt;:ud  r0.0&lt;8;8,1&gt;:ud</span> </span><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff">\n\</span><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff">
<span class="hljs-addition">+#if GEN_VER &lt; 1250</span></span><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff"> \n\</span><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition"></span>
<span class="hljs-addition">+(W)     send.ts (16|M0)          null r112 null 0x10000000 0x02000010 {EOT,@1} // wr:1+0, rd:0; end of thread</span></span><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff"> \n\</span><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff">
<span class="hljs-addition">+#else</span></span><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff"> \n\</span><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition"></span>
<span class="hljs-addition">+(W)     send.gtwy (8|M0)         null r112 src1_null     0 0x02000000 {EOT}</span></span><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff"> \n\</span><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff">
<span class="hljs-addition">+#endif</span></span><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff"> \n\</span><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff">
<span class="hljs-addition">+	");

or since it is warning can we ignore it? :)
</span></span></pre>
    <blockquote type="cite"
      cite="mid:171577034951.2117833.3616824896991262948@8e613ede5ea5">
      <pre class="moz-quote-pre" wrap="">
  #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof(arr[0]))
                                 ^~~~~
  ../lib/gpgpu_shader.c:312:3: error: expected ';' after expression
          )ASM", 2, y_offset, 3, value, value, value, value);
           ^
           ;
  ../lib/gpgpu_shader.c:312:6: warning: missing terminating '"' character [-Winvalid-pp-token]
          )ASM", 2, y_offset, 3, value, value, value, value);
              ^
  ../lib/gpgpu_shader.c:312:3: error: use of undeclared identifier 'ASM'
          )ASM", 2, y_offset, 3, value, value, value, value);
           ^
  6 warnings and 12 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1715769978:step_script
  section_start:1715769978:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1715769979:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58765596">https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58765596</a>):
  Checking for function "outb" : YES
  Checking if "cpuid.h" links: YES
  Header &lt;unistd.h&gt; has symbol "gettid": YES
  Checking whether type "struct sysinfo" has member "totalram" : YES
  Checking for function "memfd_create" : YES
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  lib/meson.build:236: WARNING: Identifier 'in' will become a reserved keyword in a future release. Please rename it.
  
  lib/meson.build:236:9: ERROR:  Expecting eol got id.
      if f in iga64_assembly_sources
           ^</pre>
    </blockquote>
    <br>
    Grepping internet suggests that meson should be updated :) I have
    not spotted better solution.<br>
    I guess it just matter to replace line in meson.build:<br>
    meson_version : '&gt;=0.47.2'<br>
    with sth bigger.<br>
    <br>
    Regards<br>
    Andrzej<br>
    <br>
    <blockquote type="cite"
      cite="mid:171577034951.2117833.3616824896991262948@8e613ede5ea5">
      <pre class="moz-quote-pre" wrap="">
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1715769970:step_script
  section_start:1715769970:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1715769971:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1178181">https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1178181</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------UYGLOGM35H0Is8KfpVbZ2O4Z--
