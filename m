Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60227C5AD49
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 12:56:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C5210E22F;
	Mon, 26 May 2025 12:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UkKC4BOs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5C610E22F
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 12:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748264166; x=1779800166;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mfNmRrAW4s6xuObmiNKj/51QRlOMWmXSI1HTrBJZjz4=;
 b=UkKC4BOsTGlLm2gbabWz1ZVagbwqqVjtigvGo40esUOVDdGR8GIuuTjM
 OEc2z/yPWBEK3bthQHxl1yPZ4p1JiQJ1reldToaXuVDv3LGYHW/wDDrw+
 QtJvXdaYLKBJcimxLxyDTK34qU4SpyZPNMMI55QGh96xIWM2DlQdm6HAY
 6o/8luVlgeJQ5bqAwhSenD07jv1z4ZCxeUmEOkhbfOGIfvnxdJcLVMHNp
 f8e2pUUxABEd1JdE336ezZP5lS2giuSZsy8jQD9YZNThPJU8KfL0Q/QqQ
 DVcsOgOFmyyFtVqqHBEOHIJAM7o4VSThOm5aMrsS+q1AfcRotMJ5NgRzM w==;
X-CSE-ConnectionGUID: ORaBTw2kQq68kHwViCMaRQ==
X-CSE-MsgGUID: 06P8kj5UT76ghVu0VKKoqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="52863108"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="52863108"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:56:04 -0700
X-CSE-ConnectionGUID: fy8rUfp9R5ShiJ5IWis0Dw==
X-CSE-MsgGUID: rdHwB8nvSH+ezoC2h9Vzrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="147601721"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:56:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 05:56:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 05:56:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.80)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 05:56:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8OgJPajFXYDAnP5Oj4YDdvL87ZQ6PkUE5nkEXPHHEX9WnYP5CGgGhWDTOqsAq05KeI/TWvj7i+G1HoToDw9CXA50S2hay02gaKLRFOjpLd8WZDX/eIuBUe1pImnlrBD54qCEzqax1ZlE1KM7IBqgO06G5DFNG+UR4SISu6X9/WsfByI1y4XE2UPctcXFNiuz/emcn0yUQRAICQR6H2YAGekSpbiKzTg0YPOVQF3QbJ9qa0ubEXTcbZkCMlSspCLZN1UeLHbi/jv12MkaJnb5/kiJ41VrR0Fzdxzmi0+sXw6zm0LJZQ0ByLKjHP76vnudmNST9ur2pfgAmFNOfa11A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfNmRrAW4s6xuObmiNKj/51QRlOMWmXSI1HTrBJZjz4=;
 b=iYv6/bty4TBt76WXjVWfJ5E5lepZhLaGEJepM0YlMiMirpQ5lP1Z3AlGXnLw6Y+MNaie+t9h8LjA9B8RUFeUetClJrnyDjeUl3iHvZwLAyOgyV0QSDtJ3wbIhctiK0Vxxl1eYzr3Q9a/XKTtUzr+zkVAwVL43fr8b1t+UB7yksl2uaecjC+WN46rnAKf/wJ/5wv0g+FD9zxRNffg5Cwbd08ISW1vZ7W3lslwb8zPObdNeSHi6ChBRcn/36k8UHW0qR3iQZU45dkOW9kddPfPkjKryoOzs5IVvOJCZMYFGZGBJzNPLDw5y3fxVB9kA/fiCj/hiwea0+bqmIg+2bKZvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.31; Mon, 26 May 2025 12:55:18 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8769.019; Mon, 26 May 2025
 12:55:18 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v2 1/1] lib/igt_panel: Skip hdcp tests on
 unsupported panels
Thread-Topic: [PATCH i-g-t v2 1/1] lib/igt_panel: Skip hdcp tests on
 unsupported panels
Thread-Index: AQHbzjsnWNqoTTScckiApngu/WF37bPk3DXg
Date: Mon, 26 May 2025 12:55:18 +0000
Message-ID: <SN7PR11MB6750DC6FEE691EADBAB3EE99E365A@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250526123822.16068-1-santhosh.reddy.guddati@intel.com>
 <20250526123822.16068-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250526123822.16068-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|DM4PR11MB6019:EE_
x-ms-office365-filtering-correlation-id: 8f57ac87-e8e7-4794-8654-08dd9c549163
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?T25zVEFGQWdrajgrLytJVzhuZ09PbWUwTUxFOUFJZHAvcmE4Z3huNXcwLzlF?=
 =?utf-8?B?Y2J2dkFlSDdHUEFFdEtEVzM3RmVPWjZ1LzhHTHFtSFkzdG5obm9wQ3NSUUlQ?=
 =?utf-8?B?UmFMNkcxL3FUM01JU1lkekdhWVhmQlI3cUVuRzg2dVJZWU9IOHlBalliRnla?=
 =?utf-8?B?OHJlc2J4RFNxR2YxZmFEOW5HTE9JNHhjOHo2Szd2TWJCdGE1VEFNMCtrMXY1?=
 =?utf-8?B?Z2xlOU1GMUNITHBmQkcwSVF0am9PY1MzMUVoanJMTEkzOE83SnlwNU9DeDJJ?=
 =?utf-8?B?dkU3b0dYSWdIMzlWbGo2aTJDcjRsMXA2bStRcytxbTNMOStRYTBpVmFKN0RG?=
 =?utf-8?B?VzBsTy9Gb1c0RmltcWoxR1gzbDl0UnFGL1JkYUN3RDdZaFlER2d3SmY1ay8z?=
 =?utf-8?B?TGFXbGpKdTY0c3hENWExS3g5aUtVaDNpdmZVWGk4Q3JYQUdnQnFKZ2dMem1z?=
 =?utf-8?B?WXhKeDFzMUJLenJTUjY0dHp3UjJHRmV3YzU4d1dYeGNja0t6NVN2czdUSHNk?=
 =?utf-8?B?QzE2eWp1bXZ6VG1kVDBYS3ZVdjVRRHZIUW5qaHRrcVBQOVEvcWVEUjk0U3U1?=
 =?utf-8?B?VkgwVEt3cXN0U0FaWUpNNEVhdWxFcndrUnQrcUxaU3AvOFZRLzBrWnlsVENP?=
 =?utf-8?B?UVRHZ0RFV0xnNm9mYjd5VDZSSlRsTnlCMVAxYUNEUHo2MFNZejBBRjMzalY4?=
 =?utf-8?B?cVF2Y3JsY2RIUHZDdUVlV3FGUEVRT3o3N3o4RmE1NTBlVlFFcVM1dUFKcVVU?=
 =?utf-8?B?S2FxbTZ5SjdZQXZkSDRJMnY4Y3RkWHZEdzZHZkQrUENFckdXVHVqZjNLOTA3?=
 =?utf-8?B?MUsrckUwT2FoalRCWHV0YnpSbktFQkI2d1luK3hLdng2dTJIektDWGh3U0hB?=
 =?utf-8?B?bk94c0k2Uk5kZ3BoZi95dUhleHlNeFFkTTFSSVNQc0lHa3V5VU5ZRWkvYkRm?=
 =?utf-8?B?NmNJR1R2NEd2UXpFaVRucXRTTEFKc0Zka05SQ29ZZjhBMklKajFIUnhiWUs1?=
 =?utf-8?B?SFNhVG1EWG9hS3dLOCtOcmF0RGhOR0tGSmZlSkNSbnQ3MVdYOGprWVNtTHBn?=
 =?utf-8?B?akQ0ZUNOcE9lQjZWdGgzZ1JIdnlnbXRHRjkzaTUwNG1SVGpzMlF2OFFWaFhS?=
 =?utf-8?B?Z2h4eFc2bTRuUTBySVRWMVdYSHVJVHZidmVzMU9SQXBzK2pLeUlmR3Vpb09G?=
 =?utf-8?B?V2xwUnVwaitNWG9qcFZuQkdYajZOWFY4eUlLaTVVM2RMYnpqVlRlVGFjR0Vo?=
 =?utf-8?B?dVdKU3NyZlVSaTBPajBSd0NvWHZxakMyNjNtcGRvZXBYWEtnS3VvSWZ3SHB4?=
 =?utf-8?B?ZiticTJmMUlRZU5TV3pWbXlxN0JNNlc3Q2tEcmh6ekVDUUJYLzZnbjZTVXdB?=
 =?utf-8?B?NkVXM3QzVzdVWEpvZS9HZXNRY1BJcWlzK3U3WS9lbUJpSlhMRUxua3dYS0Rm?=
 =?utf-8?B?Vk1DZGpVWU5BY1dGeGp0b1IrTmU3RC9KMXNweWpCNHlYb2JCdmc3bDVsT1Zj?=
 =?utf-8?B?SjhZY09uQXFmWnEzN0srTndmODJXd2kvYi9EdmV3Zk9tZ0srRFJkbHJtQms1?=
 =?utf-8?B?RE9kK0F5dmxHT01xeUgxeXRydWdiVmlzQVk1MWo0dW14bkN4YjVhOVd4cm45?=
 =?utf-8?B?ZHJQMEltb1h3d0JLNHNnbjZpNEpueExEQVJXZnRkOW9OeHVtOG8raXN5cG41?=
 =?utf-8?B?WWszdjVaRExkOTVySER1Sm51Ry83dGM4WFVXc3VCcUp5eWN5ZituSklFMG1v?=
 =?utf-8?B?c3NPak5QUFJPdHkxKzdYYndsbVJ3R1c0c0hvN1p6QjEvbDNleXdnc1hyMGRD?=
 =?utf-8?B?WE9UejdDN0llWVNvK0ducEx4Wm1PNXdGdUVQZnB4UDdOaEtJcGdJSmZYWDQz?=
 =?utf-8?B?Z3pVK0NMRHZndUp3R1JRbHVybWwva2hmWU5xRG5leDU0RGJGaDRsaXA4UXdX?=
 =?utf-8?B?UGxiNmZqWFNjMmxzL2lpNTdSVThwbWlMT3d0Nm5NeXFBZGtWd0VPMlBFcGtO?=
 =?utf-8?B?eUVFWWpsNXRRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzZMbGR1clA4UEx6ajk3LzR4bHlackhNUjkzSXVIZ0ZYZWpkUy9hSnN0TUNJ?=
 =?utf-8?B?Y255bHJuWkt5c0ZXZzg0VG95RUZUd3lSTy96VmE0WWFweTVHeVJLT0RQcG0x?=
 =?utf-8?B?bkoyT2pidE5FbXNpcXo2WEt4SFJqWmgrQVc3cVBFdnY0eHVOZnFjeG4rWVQ1?=
 =?utf-8?B?N05jejRyNERNVmpGenhOTU9HdktZWU8vZmVhMHpIaDY4aWtaN3Y4eEJoaER4?=
 =?utf-8?B?ZzFoVUtFS2ZPNlFsbHVJckovbUY1aDNuRGU4NGtZeFFMU0xoWFJwRUo0K21X?=
 =?utf-8?B?TnExeHBkYUQwNkZBcElUY21OMUxwSFlxYzlGSkVSNHVsaG1CUUNUMm0yYXYx?=
 =?utf-8?B?eDVvV0twUy85Wk9XbktkYitwckt3dGduVm5HNit4WEFnOHR2OC8vK2p6Z0V1?=
 =?utf-8?B?QzFZZnFuck4xY3lDKzBnQzB0NGtFZ3N3V3QwVXh5N3dMdlY1OWVHMC85YTJH?=
 =?utf-8?B?cHprekdVbE96ZFg0blVJSENzNHJxUUtYWFVFb3IyRVJQTlZwMDV0UERENUE1?=
 =?utf-8?B?TkR4MnExb1VjMFkzUnNOV1VFRlJTN0N0RW9CdjQ1NjNOTTA1VVpnbk9JM1Bx?=
 =?utf-8?B?MUFCRFk5MUhWWThEblFVS055TU9vSU5GMzdrSkNoY3BYQlhBdVVpZGkxQi9s?=
 =?utf-8?B?SWtGSnZ4am5GVTBFRDJHTlpOU3Z1NFcrL3BJVFYzejcvZ2c0alRzQThEZU0w?=
 =?utf-8?B?ck1KbUhJT3NodWd4b0M4ckpaMlVhWjJ2azBrNUxUcEdMa0lxSGdCeVB6MENM?=
 =?utf-8?B?Z01pcE96VUFSeWRBVjBCTnJId2k4VnNteGhvY0lOOEpqRzVLWm1WT0xaaDVs?=
 =?utf-8?B?MjhsT1oxci9ZNTR3ZHFrVExoTisrQW9uMWwvR3BsVHJnbi9jTHN2YW1PUzdy?=
 =?utf-8?B?MWFSY05ERHF2dHNzZDNNQWpmV1dpbHhhRWR3dTUvSDFhRHlRMnZIZmpPV29j?=
 =?utf-8?B?UUZIQnpaQmlDcEkrVXpyVXU2TUN2QkpkL2JWZVFLS2wvUHlMZTkrSzF1S2Qr?=
 =?utf-8?B?di83b3dMV1hGS0UzVStTN3UzOGZFTGhOSWViWXRSNjhFMnBwMFVCSFFvWmsz?=
 =?utf-8?B?NG4wRlBWMXpMTVRNa0hpUWVBeDBIUmVJNEFBTnpVTktqQk9jc3R2SGVOVEZr?=
 =?utf-8?B?ZGJXRmhJUXFtQUg5UlVwc3IvekgwcmlrUDlrdWR0NTc3c1dBQnp6Q2NIYW15?=
 =?utf-8?B?NkNkc20vaVJ0RTI0TGJSOVFoeDJKZnVaSGplR2V4ZDBVVG1IbkJUeUowVWU2?=
 =?utf-8?B?L2c2clc0WTd2Q2hGTHB5UjJNOU4xTmhqY3I4UTgvRldVSmdya25saE5NL0JH?=
 =?utf-8?B?dDA3cFZPYkJUVEVyWDYzVHJLWmtaaFVMeDhESGJiMEcvWGhLUk92N2lNTFpX?=
 =?utf-8?B?ek5jTk5keE5xODNacjZNMmtUL2JqQm9wZ1ZnMTk3S08wYXd4MWxqVTRKME92?=
 =?utf-8?B?c21pRUdhUUFkK3B0ZndUWHdVZlRrdFpscDIxY1gyUWhVMlRPWEN6Umc3ZnZZ?=
 =?utf-8?B?RjBjN3VyTElLR0lnWW90bFNVOUNSZmpkeFZZMWU1MDd3SWx2SFp6Y2dIQ3N4?=
 =?utf-8?B?L3BQOE9YdXRrOWR0dUNWT1k2MXRPWTllK2pTcnJVQkhJdkErYVZydzl1WXI2?=
 =?utf-8?B?MlVwZ3dWNVdSZFQzTXBRcmZLWFZzOXZZeUREYnpsVm9qOURZamZMSmFrSGgv?=
 =?utf-8?B?SEViVjd1MDJtVFl1S1hFRFU1eXZ4VWZNc2lpb1Q3akZvZXBqaW5rbUFVNUlG?=
 =?utf-8?B?dm5LNXk0K0FneHhrbjUxek5vQm5SZU5UNUQxbW5NZlMvMTRLMUM3T3M1T21s?=
 =?utf-8?B?Z01SQ3hhQmFvanJ5RW82SXNMR2NKdGM4dnREaHNsbWJNS3dKSWJDNW1SaDAv?=
 =?utf-8?B?eW5WeXhUaDVRUGFvQjhOVEF1Y05PdXk3RThxV3NJOWgzU3VoZ0JjVFowVW5t?=
 =?utf-8?B?N2NoVXF2ZmdjMHpLTEJlQ3NQUHZwdnl0TVBwUkVRL3pFZXdpd3pUbUo2VFVJ?=
 =?utf-8?B?NVZRS3RQdWs4MXArWHQwVzliNEFZdW1NdlJSRGs1NDR0NjE1VTdCTWwrTE9Y?=
 =?utf-8?B?QzUwcUlrZC9IUFhrQTlMaTdOOFpoeU1GbWdaR2ZCWTBXZG9BdnpMWGE4Mnc3?=
 =?utf-8?Q?Q715/iKuD+tx8JfAqyov41cDZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f57ac87-e8e7-4794-8654-08dd9c549163
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 12:55:18.6457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vxbezRHkUvZSF/5x8MwZKbuRabFU57fnYMrvUeWi92We6U0gw7Ki/Zo/wbEvL0Dj5EAD9WOG0jvuCy2KmR1asA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6019
X-OriginatorOrg: intel.com
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

PiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgdjIgMS8xXSBsaWIvaWd0X3BhbmVsOiBTa2lwIGhkY3Ag
dGVzdHMgb24gdW5zdXBwb3J0ZWQNCj4gcGFuZWxzDQo+IA0KPiBUaGlzIGludHJvZHVjZXMgYSBt
ZWNoYW5pc20gdG8gaGFuZGxlIHNwZWNpZmljIHBhbmVscyBsaWtlDQo+IGVtdWxhdG9ycy9kdW1t
aWVzIHRoYXQgYXJlIGtub3duIHRvIGZhY2UgaXNzdWVzIHdpdGggY2VydGFpbiBmZWF0dXJlcyBs
aWtlDQo+IEhEQ1AuDQo+IA0KPiBUZXN0cyBhcmUgc2tpcHBlZCBmb3IgdGhvc2Ugb3V0cHV0cyBj
b25uZWN0ZWQgdG8gcHJldmVudCBmYWxzZSBuZWdhdGl2ZXMgYW5kDQo+IHVubmVjZXNzYXJ5IGRl
YnVnZ2luZw0KPiANCj4gVjI6IFJlZmFjdG9yIHZhcmlhYmxlICxmdW5jdGlvbiBuYW1lcyBhbmQg
Zml4IGNvZGluZyBzdHlsZSAoS2FtaWwpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTYW50aG9zaCBS
ZWRkeSBHdWRkYXRpIDxzYW50aG9zaC5yZWRkeS5ndWRkYXRpQGludGVsLmNvbT4NCj4gLS0tDQo+
ICBsaWIvaWd0X2VkaWQuYyAgfCAyNyArKysrKysrKysrKysrKysrKysrKysrICBsaWIvaWd0X2Vk
aWQuaCAgfCAgMSArDQo+IGxpYi9pZ3RfcGFuZWwuYyB8IDYxDQo+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIGxpYi9pZ3RfcGFuZWwuaCB8IDE1
ICsrKysrKysrKysrKw0KPiAgbGliL21lc29uLmJ1aWxkIHwgIDEgKw0KPiAgNSBmaWxlcyBjaGFu
Z2VkLCAxMDUgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9pZ3RfcGFu
ZWwuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9pZ3RfcGFuZWwuaA0KPiANCj4gZGlmZiAt
LWdpdCBhL2xpYi9pZ3RfZWRpZC5jIGIvbGliL2lndF9lZGlkLmMgaW5kZXggODBkY2VhMTEyLi42
MjcyMDFjMzQgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3RfZWRpZC5jDQo+ICsrKyBiL2xpYi9pZ3Rf
ZWRpZC5jDQo+IEBAIC0yMTAsNiArMjEwLDMzIEBAIHZvaWQgZWRpZF9nZXRfbWZnKGNvbnN0IHN0
cnVjdCBlZGlkICplZGlkLCBjaGFyDQo+IG91dFtzdGF0aWMgM10pDQo+ICAJb3V0WzJdID0gKGVk
aWQtPm1mZ19pZFsxXSAmIDB4MUYpICsgJ0AnOyAgfQ0KPiANCj4gK3ZvaWQgZWRpZF9nZXRfbW9u
aXRvcl9uYW1lKGNvbnN0IHN0cnVjdCBlZGlkICplZGlkLCBjaGFyICpuYW1lLCBzaXplX3QNCj4g
K25hbWVfc2l6ZSkgew0KPiArCWNvbnN0IHN0cnVjdCBkZXRhaWxlZF90aW1pbmcgKmR0Ow0KPiAr
CWNvbnN0IHN0cnVjdCBkZXRhaWxlZF9ub25fcGl4ZWwgKm5wOw0KPiArCWNvbnN0IHN0cnVjdCBk
ZXRhaWxlZF9kYXRhX3N0cmluZyAqZHM7DQo+ICsJc2l6ZV90IGk7DQo+ICsNCj4gKwlhc3NlcnQo
bmFtZV9zaXplID4gMCk7DQo+ICsJbmFtZVswXSA9ICdcMCc7DQo+ICsNCj4gKwlmb3IgKGkgPSAw
OyBpIDwgREVUQUlMRURfVElNSU5HU19MRU47IGkrKykgew0KPiArCQlkdCA9ICZlZGlkLT5kZXRh
aWxlZF90aW1pbmdzW2ldOw0KPiArCQlucCA9ICZkdC0+ZGF0YS5vdGhlcl9kYXRhOw0KPiArDQo+
ICsJCWlmIChucC0+dHlwZSAhPSBFRElEX0RFVEFJTF9NT05JVE9SX05BTUUpDQo+ICsJCQljb250
aW51ZTsNCj4gKw0KPiArCQlkcyA9ICZucC0+ZGF0YS5zdHJpbmc7DQo+ICsJCXN0cm5jcHkobmFt
ZSwgZHMtPnN0ciwgbmFtZV9zaXplIC0gMSk7DQo+ICsJCW5hbWVbbmFtZV9zaXplIC0gMV0gPSAn
XDAnOw0KPiArCQlpZ3RfZGVidWcoIk1vbml0b3IgbmFtZTogJXNcbiIsIG5hbWUpOw0KPiArCQly
ZXR1cm47DQo+ICsJfQ0KPiArCWlndF9kZWJ1ZygiTm8gbW9uaXRvciBuYW1lIGZvdW5kIGluIEVE
SURcbiIpOw0KPiArCW5hbWVbMF0gPSAnXDAnOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgdm9pZCBl
ZGlkX3NldF9tZmcoc3RydWN0IGVkaWQgKmVkaWQsIGNvbnN0IGNoYXIgbWZnW3N0YXRpYyAzXSkg
IHsNCj4gIAllZGlkLT5tZmdfaWRbMF0gPSAobWZnWzBdIC0gJ0AnKSA8PCAyIHwgKG1mZ1sxXSAt
ICdAJykgPj4gMzsgZGlmZiAtLWdpdA0KPiBhL2xpYi9pZ3RfZWRpZC5oIGIvbGliL2lndF9lZGlk
LmggaW5kZXggMDI2NDUzNDVmLi5iZTBjY2Y1MjkgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3RfZWRp
ZC5oDQo+ICsrKyBiL2xpYi9pZ3RfZWRpZC5oDQo+IEBAIC00NTYsNSArNDU2LDYgQEAgdm9pZCAq
ZGlzcGlkX2Jsb2NrX3RpbGVkKHZvaWQgKnB0ciwNCj4gIAkJCSBpbnQgaHRpbGUsIGludCB2dGls
ZSwNCj4gIAkJCSBpbnQgaHNpemUsIGludCB2c2l6ZSwNCj4gIAkJCSBjb25zdCBjaGFyICp0b3Bv
bG9neV9pZCk7DQo+ICt2b2lkIGVkaWRfZ2V0X21vbml0b3JfbmFtZShjb25zdCBzdHJ1Y3QgZWRp
ZCAqZWRpZCwgY2hhciAqbmFtZSwgc2l6ZV90DQo+ICtuYW1lX3NpemUpOw0KPiANCj4gICNlbmRp
Zg0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wYW5lbC5jIGIvbGliL2lndF9wYW5lbC5jIG5ldyBm
aWxlIG1vZGUgMTAwNjQ0IGluZGV4DQo+IDAwMDAwMDAwMC4uZmZlMDhmNDllDQo+IC0tLSAvZGV2
L251bGwNCj4gKysrIGIvbGliL2lndF9wYW5lbC5jDQo+IEBAIC0wLDAgKzEsNjEgQEANCj4gKy8q
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8NCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQg
wqkgMjAyNSBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlIDxzdGRi
b29sLmg+DQo+ICsjaW5jbHVkZSA8c3RyaW5nLmg+DQo+ICsNCj4gKyNpbmNsdWRlICJkcm10ZXN0
LmgiDQo+ICsjaW5jbHVkZSAiaWd0X3BhbmVsLmgiDQo+ICsNCj4gKy8qKg0KPiArICogTGlzdCBv
ZiBQYW5lbHMgdGhhdCBzaG91bGQgYmUgZXhjbHVkZWQgZnJvbSBoZGNwIHRlc3RzDQo+ICsgKg0K
PiArICogVGhpcyBhcnJheSBpcyB1c2VkIHRvIGlkZW50aWZ5IGFuZCBoYW5kbGUgc2NlbmFyaW9z
IHdoZXJlIHRoZSB0ZXN0DQo+ICtpcw0KPiArICogZXhlY3V0ZWQgb24gZHVtbXkgbW9uaXRvcnMs
IHN1Y2ggYXMgdGhvc2UgZm91bmQgb24gc2hhcmQgbWFjaGluZXMuDQo+ICsgKiBTaW5jZSB0aGVz
ZSBkdW1teSBtb25pdG9ycyBhcmUgbm90IHJlYWwgYW5kIGFsd2F5cyB0aGUgdGVzdCBpcyBub3QN
Cj4gK2NvbnNpc3RlbnQsDQo+ICsgKiB0aGUgdGVzdCBpcyBza2lwcGVkIGluIHN1Y2ggY2FzZXMg
dG8gYXZvaWQgZmFsc2UgbmVnYXRpdmVzIG9yDQo+ICsgKiBpcnJlbGV2YW50IHRlc3QgcmVzdWx0
cy4NCj4gKyAqLw0KPiArc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IGhkY3BfYmxvY2tsaXN0W10g
PSB7DQo+ICsJIkRQRjkwNDM1IiwgLyogRXhhbXBsZSBtb25pdG9yIG5hbWUgKi8NCj4gKwkvKiBB
ZGQgbW9yZSBtb25pdG9yIG5hbWVzIGhlcmUgYXMgbmVlZGVkICovIH07DQo+ICsNCg0KSW4gbXkg
aG9uZXN0IG9waW5pb24gdGhpcyBsaXN0IGJlbG9uZ3MgaW4ga21zX2NvbnRlbnRfcHJvdGVjdGlv
biBub3QgaGVyZSB5b3UgYWxyZWFkeSBoYXZlDQp0aGUgZnVuY3Rpb24gaXNfcGFuZWxfYmxvY2tl
ZCBsZXQgZXZlcnkgdGVzdCBoYXMgaXRzIG93biBsaXN0IGFuZCBjYWxsIGlzX3BhbmVsX2Jsb2Nr
ZWQgb24gaXRzIG93bg0KDQo+ICsvKioNCj4gKyAqIGlndF9pc19wYW5lbF9ibG9ja2VkIC0gQ2hl
Y2tzIGlmIGEgZ2l2ZW4gdmVuZG9yIG5hbWUgaXMgcHJlc2VudCBpbiBhDQo+IGJsb2NrbGlzdC4N
Cj4gKyAqDQo+ICsgKiBAdmVuZG9yX25hbWU6IFRoZSBuYW1lIG9mIHRoZSB2ZW5kb3IgdG8gY2hl
Y2sgZm9yIGluIHRoZSBibG9ja2xpc3QuDQo+ICsgKiBAYmxvY2tsaXN0OiBBbiBhcnJheSBvZiBz
dHJpbmdzIHJlcHJlc2VudGluZyB0aGUgYmxvY2tsaXN0Lg0KPiArICogQGJsb2NrbGlzdF9zaXpl
OiBUaGUgbnVtYmVyIG9mIGVudHJpZXMgaW4gdGhlIGJsb2NrbGlzdCBhcnJheS4NCj4gKyAqDQo+
ICsgKiBSZXR1cm5zOg0KPiArICogdHJ1ZSBpZiB0aGUgdmVuZG9yIG5hbWUgaXMgZm91bmQgaW4g
dGhlIGJsb2NrbGlzdCwgZmFsc2Ugb3RoZXJ3aXNlLg0KPiArICovDQo+ICtzdGF0aWMgYm9vbCBp
Z3RfaXNfcGFuZWxfYmxvY2tlZChjb25zdCBjaGFyICp2ZW5kb3JfbmFtZSwNCj4gKwkJCSAgICBj
b25zdCBjaGFyICpjb25zdCBibG9ja2xpc3RbXSwNCj4gKwkJCSAgICBzaXplX3QgYmxvY2tsaXN0
X3NpemUpDQo+ICt7DQo+ICsJaW50IGk7DQo+ICsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgYmxvY2ts
aXN0X3NpemU7IGkrKykgew0KPiArCQlpZiAoc3Ryc3RyKGJsb2NrbGlzdFtpXSwgdmVuZG9yX25h
bWUpICE9IE5VTEwpDQo+ICsJCQlyZXR1cm4gdHJ1ZTsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4g
ZmFsc2U7DQo+ICt9DQo+ICsNCj4gKy8qKg0KPiArICogaWd0X2lzX3BhbmVsX2Jsb2NrZWRfaGRj
cCAtIENoZWNrcyBpZiBhIHBhbmVsIHZlbmRvciBpcyBibG9ja2xpc3RlZCBmb3INCj4gSERDUC4N
Cj4gKyAqIEB2ZW5kb3JfbmFtZTogVGhlIG5hbWUgb2YgdGhlIHBhbmVsIHZlbmRvciB0byBjaGVj
ay4NCj4gKyAqDQo+ICsgKiBSZXR1cm5zOg0KPiArICogdHJ1ZSBpZiB0aGUgdmVuZG9yIGlzIGJs
b2NrbGlzdGVkIGZvciBIRENQLCBmYWxzZSBvdGhlcndpc2UuDQo+ICsgKi8NCj4gK2Jvb2wgaWd0
X2lzX3BhbmVsX2Jsb2NrZWRfaGRjcChjb25zdCBjaGFyICp2ZW5kb3JfbmFtZSkgew0KPiArCXJl
dHVybiBpZ3RfaXNfcGFuZWxfYmxvY2tlZCh2ZW5kb3JfbmFtZSwgaGRjcF9ibG9ja2xpc3QsDQo+
ICsJCQkgICAgICAgQVJSQVlfU0laRShoZGNwX2Jsb2NrbGlzdCkpOw0KPiArfQ0KDQpTYW1lIGhl
cmUgdGhpcyBmdW5jdGlvbiBpcyBub3QgcmVxdWlyZWQgY2FsbCBpZ3RfaXNfcGFuZWxfYmxvY2tl
ZCBkaXJlY3RseSBmcm9tDQpLbXNfY29udGVudF9wcm90ZWN0aW9uLg0KDQpSZWdhcmRzLA0KU3Vy
YWogS2FuZHBhbA0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wYW5lbC5oIGIvbGliL2lndF9wYW5l
bC5oIG5ldyBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4DQo+IDAwMDAwMDAwMC4uNzljZGFmMTFjDQo+
IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbGliL2lndF9wYW5lbC5oDQo+IEBAIC0wLDAgKzEsMTUg
QEANCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8NCj4gKy8qDQo+ICsgKiBD
b3B5cmlnaHQgwqkgMjAyNSBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICovDQo+ICsNCj4gKyNpZm5k
ZWYgSUdUX1BBTkVMX0gNCj4gKyNkZWZpbmUgSUdUX1BBTkVMX0gNCj4gKw0KPiArI2luY2x1ZGUg
PHN0ZGJvb2wuaD4NCj4gKyNpbmNsdWRlIDxzdHJpbmcuaD4NCj4gKw0KPiArYm9vbCBpZ3RfaXNf
cGFuZWxfYmxvY2tlZF9oZGNwKGNvbnN0IGNoYXIgKnZlbmRvcl9uYW1lKTsNCj4gKw0KPiArI2Vu
ZGlmDQo+ICsNCj4gZGlmZiAtLWdpdCBhL2xpYi9tZXNvbi5idWlsZCBiL2xpYi9tZXNvbi5idWls
ZCBpbmRleCBmNTQxOTgwNTEuLjEzOTg1NWYyZQ0KPiAxMDA2NDQNCj4gLS0tIGEvbGliL21lc29u
LmJ1aWxkDQo+ICsrKyBiL2xpYi9tZXNvbi5idWlsZA0KPiBAQCAtOTQsNiArOTQsNyBAQCBsaWJf
c291cmNlcyA9IFsNCj4gIAknaWd0X2RyYXcuYycsDQo+ICAJJ2lndF9saXN0LmMnLA0KPiAgCSdp
Z3RfbWFwLmMnLA0KPiArCSdpZ3RfcGFuZWwuYycsDQo+ICAJJ2lndF9wbS5jJywNCj4gIAknaWd0
X2R1bW15bG9hZC5jJywNCj4gIAknaWd0X3N0b3JlLmMnLA0KPiAtLQ0KPiAyLjM0LjENCg0K
