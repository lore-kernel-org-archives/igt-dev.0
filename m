Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9094EB48EC
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 09:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F11010E143;
	Thu, 12 Feb 2026 09:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WzBdhFbG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2772910E143
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 09:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770887664; x=1802423664;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=5I7uHI6FOoKTaFrz4TQQuQXkOsuwInVTSyvcgxHhz5I=;
 b=WzBdhFbG92YHJ7mhAx2AEd1TP/a7KstFAfFUD9riDRggvz6UMtP89TAy
 e/xLvzjCdqdK0vRWcTynyRrXeR2k0P9mT/FeMbRV9uv4YIKZ7uRYXt0U7
 udR26MhXCrpXEwd9AFp8CVCwWEWfKjWb/sCmfdo7tLQQBXM8RjmLUjoDK
 J7BywFHDmc8C90l5yDPDRqKUliy+pta1rOmByATmyFMqDJJpctKKmk8O4
 HIB4oxIMznNKfODA0tbq7qRkgmQ2+NK8SIKOWbxLQW9NGBWEwterQfEWJ
 IySDbHv38KXa0+CP4Rj6wxVeuGSyHDOJF6hRi8iiYaE0CDZU9GWxtpRLo w==;
X-CSE-ConnectionGUID: DY1h1fQ7SIKVdcYef8fJYA==
X-CSE-MsgGUID: 7jQPkH3FR9yvltutEqFxBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="74653811"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208,217";a="74653811"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:14:24 -0800
X-CSE-ConnectionGUID: 31r706H1R8CYb2a8LfbzDA==
X-CSE-MsgGUID: +ZNn1xrMRq6ZD5m1XZRzkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
 d="scan'208,217";a="217497610"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.33])
 ([172.28.182.33])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:14:22 -0800
Content-Type: multipart/alternative;
 boundary="------------bmWFWXumz5FVJcBOhIbPciMO"
Message-ID: <1d97a001-04de-400a-bd96-ad856442429b@linux.intel.com>
Date: Thu, 12 Feb 2026 10:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_PCI_driver_h?=
 =?UTF-8?Q?elpers_and_xe-vfio-pci_FLR_improvement_=28rev4=29?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20260211111834.1140287-1-marcin.bernatowicz@linux.intel.com>
 <177081577508.246141.4619122331377786001@a3b018990fe9>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <177081577508.246141.4619122331377786001@a3b018990fe9>
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
--------------bmWFWXumz5FVJcBOhIbPciMO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/11/2026 2:16 PM, Patchwork wrote:
> == Series Details ==
>
> Series: PCI driver helpers and xe-vfio-pci FLR improvement (rev4)
> URL   :https://patchwork.freedesktop.org/series/160140/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from XEIGT_8749_BAT -> XEIGTPW_14539_BAT
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with XEIGTPW_14539_BAT absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_14539_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
>
>    
>
> Participating hosts (9 -> 10)
> ------------------------------
>
>    Additional (1): bat-bmg-3
>
> Possible new issues
> -------------------
>
>    Here are the unknown changes that may have been introduced in XEIGTPW_14539_BAT:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@core_hotunplug@unbind-rebind:
>      - bat-bmg-2:          [PASS][1] -> [ABORT][2]
>     [1]:https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8749/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
>     [2]:https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
>
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
>      - bat-bmg-3:          NOTRUN -> [INCOMPLETE][3]
>     [3]:https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
>
>    * igt@xe_sriov_flr@flr-vf1-clear:
>      - bat-adlp-7:         [PASS][4] -> [WARN][5]
>     [4]:https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8749/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html
>     [5]:https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html

The ADLP platform does not officially support SR-IOV and the 
configuration is broken: *intel_iommu=igfx_off*

which results in expected warnings (IGT) / dmesg error (<3> [370.416518] 
xe-vfio-pci 0000:00:02.1: probe with driver xe-vfio-pci failed with 
error -22)

Despite execution without xe-vfio-pci bound the test passes.

---

marcin

>    
> Known issues
> ------------
>
>    Here are the changes found in XEIGTPW_14539_BAT that come from known issues:
>
> ### IGT changes ###
>
> #### Possible fixes ####
>
>    * igt@xe_waitfence@engine:
>      - bat-bmg-1:          [FAIL][6] ([Intel XE#6519]) -> [PASS][7]
>     [6]:https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8749/bat-bmg-1/igt@xe_waitfence@engine.html
>     [7]:https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/bat-bmg-1/igt@xe_waitfence@engine.html
>
>    
>    [Intel XE#6519]:https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
>
>
> Build changes
> -------------
>
>    * IGT: IGT_8749 -> IGTPW_14539
>
>    IGTPW_14539: b896e43034c432c4a69c2b8a0cfb0d878d2c763c @https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8749: 195f101f25a7984686f36f340aa88d44a1716ec6 @https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-4543-f37b96494b210e3ceec9c8c369dcd8f05fb30669: f37b96494b210e3ceec9c8c369dcd8f05fb30669
>
> == Logs ==
>
> For more details see:https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/index.html
>
--------------bmWFWXumz5FVJcBOhIbPciMO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/11/2026 2:16 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:177081577508.246141.4619122331377786001@a3b018990fe9">
      <pre wrap="" class="moz-quote-pre">== Series Details ==

Series: PCI driver helpers and xe-vfio-pci FLR improvement (rev4)
URL   : <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/160140/">https://patchwork.freedesktop.org/series/160140/</a>
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8749_BAT -&gt; XEIGTPW_14539_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14539_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14539_BAT, please notify your bug team (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -&gt; 10)
------------------------------

  Additional (1): bat-bmg-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14539_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -&gt; [ABORT][2]
   [1]: <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8749/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8749/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html</a>
   [2]: <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html</a>

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - bat-bmg-3:          NOTRUN -&gt; [INCOMPLETE][3]
   [3]: <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html</a>

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-adlp-7:         [PASS][4] -&gt; [WARN][5]
   [4]: <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8749/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8749/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html</a>
   [5]: <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html</a>
</pre>
    </blockquote>
    <p>The ADLP platform does not officially support SR-IOV and the
      configuration is broken: <span style="white-space: pre-wrap"><b>intel_iommu=igfx_off</b></span></p>
    <p>which results in expected warnings (IGT) / dmesg error (&lt;3&gt;
      [370.416518] xe-vfio-pci 0000:00:02.1: probe with driver
      xe-vfio-pci failed with error -22)</p>
    <p>Despite execution without xe-vfio-pci bound the test passes.</p>
    <p>---</p>
    <p>marcin</p>
    <blockquote type="cite"
      cite="mid:177081577508.246141.4619122331377786001@a3b018990fe9">
      <pre wrap="" class="moz-quote-pre">
  
Known issues
------------

  Here are the changes found in XEIGTPW_14539_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-bmg-1:          [FAIL][6] ([Intel XE#6519]) -&gt; [PASS][7]
   [6]: <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8749/bat-bmg-1/igt@xe_waitfence@engine.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8749/bat-bmg-1/igt@xe_waitfence@engine.html</a>
   [7]: <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/bat-bmg-1/igt@xe_waitfence@engine.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/bat-bmg-1/igt@xe_waitfence@engine.html</a>

  
  [Intel XE#6519]: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519</a>


Build changes
-------------

  * IGT: IGT_8749 -&gt; IGTPW_14539

  IGTPW_14539: b896e43034c432c4a69c2b8a0cfb0d878d2c763c @ <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a>
  IGT_8749: 195f101f25a7984686f36f340aa88d44a1716ec6 @ <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a>
  xe-4543-f37b96494b210e3ceec9c8c369dcd8f05fb30669: f37b96494b210e3ceec9c8c369dcd8f05fb30669

== Logs ==

For more details see: <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14539/index.html</a>

</pre>
    </blockquote>
  </body>
</html>

--------------bmWFWXumz5FVJcBOhIbPciMO--
