Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A85EFCD9A
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 11:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0209010E4DB;
	Mon,  9 Mar 2026 11:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aS+XELvx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B179B10E4DB
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 11:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773054866; x=1804590866;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=/vZ+nyR/JXv6vNoF2g9UVT7LD2eBA2GDjuHYEM6cWHU=;
 b=aS+XELvxZDmr9FnzOo6ZxsKRfHby40sbNLG51+mOjz3uWBPE4rhe0/Qu
 JWP9QcDaqAmJkn2Q2F9Je68oFjAB53iogVg9pOkRP2JPK+AbksTTmM+xl
 QSGQt1h3PSryeQCEP1v25gBrWu0oU+OjAfFXvxkVMOc1VI93m2lyTGM3d
 UCTyJXkLAsRuWDqk8yyrFmfcXAcF06R1xMnI0vi4LDpTMo6lQkUBIsIVF
 dCSTQoHdv8XVkCj2C0x5lfSCKgG0gZzcVnJ9WAF5d3uIa+RkJvl2ZZK8V
 4+OQSGwtWL/SDI8TsbaSPN3qoo1RE2Bg8MVFR0N/MrY11XRMzbviYJwNz A==;
X-CSE-ConnectionGUID: Fh7/nnEJT8ySrQe2ufaMXg==
X-CSE-MsgGUID: NKDkUscxRRi21GXahMn+Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="99544134"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208,217";a="99544134"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 04:14:25 -0700
X-CSE-ConnectionGUID: VlXJMj4BQ76B3EPUGranAA==
X-CSE-MsgGUID: 3IBjajYATr2xe77rf57E/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
 d="scan'208,217";a="224167585"
Received: from rvinayku-mobl1.gar.corp.intel.com (HELO [10.247.170.133])
 ([10.247.170.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 04:14:25 -0700
Content-Type: multipart/alternative;
 boundary="------------YCj0NjtIHwK2oNGb10jwASpY"
Message-ID: <d250bf1f-2d0e-493c-9000-b344d2a6371f@intel.com>
Date: Mon, 9 Mar 2026 16:44:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,6/6] tests/intel/kms_usb4_switch: Add USB4 switch test
 suite
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, igt-dev@lists.freedesktop.org
References: <20260225212859.876713-7-kunal1.joshi@intel.com>
 <d5d123a9-5559-4d08-a696-c499a656607e@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <d5d123a9-5559-4d08-a696-c499a656607e@intel.com>
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
--------------YCj0NjtIHwK2oNGb10jwASpY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Arun,

On 09-03-2026 15:33, Murthy, Arun R wrote:
>> +static void test_switch_sr(data_t *data,
>> +               const struct usb4switch_port *port_cfg_a,
>> +               const struct usb4switch_port *port_cfg_b)
>> +{
>> +    igt_crc_t ref_crcs[MAX_DISPLAYS_PER_PORT];
>> +    int iterations = usb4switch_get_iterations(data->sw);
>> +    int timeout = USB4_SWITCH_TIMEOUT_S;
> Why not have it as a const or use the macro directly?
Kept it as a local alias since this pattern is used widely in IGT for
function-local knobs such as timeout/iterations/count, and it makes call
sites a bit easier to read when reused multiple times.

That said, since this one is not modified, I can make it const to 
express that more clearly.
--------------YCj0NjtIHwK2oNGb10jwASpY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Arun,</p>
    <div class="moz-cite-prefix">On 09-03-2026 15:33, Murthy, Arun R
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d5d123a9-5559-4d08-a696-c499a656607e@intel.com">
      <blockquote type="cite" style="color: #007cff;">+static void
        test_switch_sr(data_t *data,
        <br>
        +               const struct usb4switch_port *port_cfg_a,
        <br>
        +               const struct usb4switch_port *port_cfg_b)
        <br>
        +{
        <br>
        +    igt_crc_t ref_crcs[MAX_DISPLAYS_PER_PORT];
        <br>
        +    int iterations = usb4switch_get_iterations(data-&gt;sw);
        <br>
        +    int timeout = USB4_SWITCH_TIMEOUT_S;
        <br>
      </blockquote>
      Why not have it as a const or use the macro directly?</blockquote>
    Kept it as a local alias since this pattern is used widely in IGT
    for<br>
    function-local knobs such as timeout/iterations/count, and it makes
    call<br>
    sites a bit easier to read when reused multiple times.<br>
    <br>
    That said, since this one is not modified, I can make it const to
    express that more clearly.
  </body>
</html>

--------------YCj0NjtIHwK2oNGb10jwASpY--
