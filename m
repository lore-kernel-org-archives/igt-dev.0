Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A45210E2D3
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Nov 2023 11:56:00 +0000 (UTC)
Message-ID: <3e414bbd-78bf-420e-8217-778db7105c69@intel.com>
Date: Mon, 6 Nov 2023 12:55:56 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
References: <20231103204719.690769-1-jagmeet.randhawa@intel.com>
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
In-Reply-To: <20231103204719.690769-1-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH v3] lib/gpgpu_fill: Add support for Xe2
 platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jagmeet,

On 3.11.2023 21:47, Jagmeet Randhawa wrote:
> Addressing Christoph Manszewskis comments: Added brackets to remaining else if
> statements, and fixed the XE2 format issue. I ran checkpatch and
> everything seems good, there was trailing white space errors but those I

$ curl -s 
https://patchwork.freedesktop.org/api/1.0/series/125979/revisions/1/mbox/ 
 > a.patch
$ ./scripts/checkpatch.pl a.patch
WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit 
description?)
#21:
iga64 -p=2 -Wall -Xprint-ldst -Xauto-deps --assemble xe2lpg_gpgpu_kernel.asm

ERROR: space required before the open brace '{'
#99: FILE: lib/gpu_cmds.c:331:
+	if (intel_graphics_ver(devid) >= IP_VER(20, 0)){

WARNING: Block comments should align the * on each line
#101: FILE: lib/gpu_cmds.c:333:
+		/*
+		* Up until now, SURFACEFORMAT_R8_UNROM was used regardless of the 
'bpp' value.

ERROR: space required before the open brace '{'
#122: FILE: lib/gpu_cmds.c:354:
+	else if (intel_graphics_ver(devid) >= IP_VER(12, 50)){

ERROR: else should follow close brace '}'
#122: FILE: lib/gpu_cmds.c:354:
+	}
+	else if (intel_graphics_ver(devid) >= IP_VER(12, 50)){

ERROR: space required before the open brace '{'
#127: FILE: lib/gpu_cmds.c:358:
+	else if (intel_graphics_ver(devid) >= IP_VER(9, 0)){

ERROR: else should follow close brace '}'
#127: FILE: lib/gpu_cmds.c:358:
+	}
+	else if (intel_graphics_ver(devid) >= IP_VER(9, 0)){

ERROR: space required before the open brace '{'
#132: FILE: lib/gpu_cmds.c:362:
+	else if (intel_graphics_ver(devid) >= IP_VER(8, 0)){

ERROR: else should follow close brace '}'
#132: FILE: lib/gpu_cmds.c:362:
+	}
+	else if (intel_graphics_ver(devid) >= IP_VER(8, 0)){

ERROR: else should follow close brace '}'
#137: FILE: lib/gpu_cmds.c:366:
+	}
+	else {

WARNING: Missing a blank line after declarations
#150: FILE: lib/gpu_cmds.c:990:
+	uint32_t dword_length = intel_graphics_ver(ibb->devid) >= IP_VER(20, 0);
+	intel_bb_out(ibb, XEHP_STATE_COMPUTE_MODE | dword_length);

ERROR: trailing whitespace
#212: FILE: lib/gpu_cmds.c:1131:
+^I$

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#223:
new file mode 100644

ERROR: code indent should use tabs where possible
#251: FILE: lib/intel_batchbuffer.c:759:
+                fill = xe2lpg_gpgpu_fillfunc;$

WARNING: please, no spaces at the start of a line
#251: FILE: lib/intel_batchbuffer.c:759:
+                fill = xe2lpg_gpgpu_fillfunc;$

Apart from the 'MAINTAINERS' file warning and maybe commit msg line 
lenght, all other warnings *and especially errors* are easily fixable 
and have to be fixed.

Thanks,
Christoph

> believe are false positives and are inconsistent with the rest of the
> code styling therefore I ignored them
> 
> Addresing Kamil Koniecznys comments: I fixed the header, and added
> Dominiks r-b
> 
> Jagmeet Randhawa (1):
>    lib/gpgpu_fill: Add support for Xe2 platforms
> 
>   lib/gpgpu_fill.c                              | 23 +++++++
>   lib/gpgpu_fill.h                              |  6 ++
>   lib/gpu_cmds.c                                | 61 ++++++++++++++++---
>   .../shaders/gpgpu/xe2lpg_gpgpu_kernel.asm     | 13 ++++
>   lib/intel_batchbuffer.c                       |  4 +-
>   5 files changed, 96 insertions(+), 11 deletions(-)
>   create mode 100644 lib/i915/shaders/gpgpu/xe2lpg_gpgpu_kernel.asm
> 
