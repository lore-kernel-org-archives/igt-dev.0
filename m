Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1DFD2ECF7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 10:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB5B10E5A8;
	Tue, 20 Jan 2026 10:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVrLTc7l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1765E10E5A8
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 10:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768905172; x=1800441172;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Oo/lWvFwisfmqZr6zOTr7hpQU4sYnyDD5YxYF5YEPZo=;
 b=FVrLTc7l2sSmkn7boqSg9CKv+fsdFcek8Dy185TynefKQkPbunAw3CtF
 BOksKmcTZDf0YAsKr8Yv9XYPCxqkI4Py+MV21r0/xmWJWiGI7dlcJPDbr
 gB7RNgNCL6PbKhKQ0NGfvYA3+1Er0qEKY2knvKWAn0NIIhZO9Sk2967dr
 ytcEhpBwV4wmRibCm/R/7dWEWUujUA1wOhabIkdb2VKi2nqoAD0A/shHK
 VDuYxxegJJWbV2qGlkmBKUiTU4Ph8yIUxkn0d4Y2wbpSKKIyiDViXTQVu
 bSHLLQlsH+edhdT/83TWJD1Gu+1vWe30wM05YmXpru/oVdU3KnUPj5mhk Q==;
X-CSE-ConnectionGUID: D2ixD4chT3CfdncU5muyog==
X-CSE-MsgGUID: +R9RblQ/RaSG9scBnQxkMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="57667035"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="57667035"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 02:32:51 -0800
X-CSE-ConnectionGUID: 4nAMm4C2SbC/jZnNY/Ge7A==
X-CSE-MsgGUID: yO4myP7QQze+RqwqFUNdgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="206116629"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 02:32:52 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 02:32:50 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 02:32:50 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 02:32:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHUZbu2E6ae2vEeQbedYhRcPlSmYlEbE6rqlN1z+0iwlSGLdebiFU4uJZGcgTxXuQcolVaAUelEICUW/DJFz8wmX7ia7x7UpUaxghTWRAfhKJfYnaIk4395Sd2c71snoXvOet6h781ngXdh5MDxKr+ByJZQRujtYEip0dWxeoL24Aus0RJwxDAhL3niWbr3EL/8BSgayQcQGHYFaZLO1KUPs4FjIHhdvr6Yl0qv4rr2VZCqoMUZGu+D//iQC2UEbrYVgX1QTny4iYHisYED/fRnhWNRFfeLpnkYzwNeONXWQrl6CSfLf3oBFCg2h1dla8NxWUHBS7NqXVembLwB/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IP6G8AgfzwGBmDeyA79X2Du29B/6bgmcd2YV63Oebo8=;
 b=irq3Jq4DBpjok+otkclGwlvobREbxXsn47WXNqTd8J4l+D1oU/Goa/UDXYnJHhA5jOTeKRNO7JoPq2DdTDVgueJSoAnjC3rZanwnj2FBggrB20BZPAfpHACnTJU+yvhOAofgpCsbytBRrPe4I1q7Y8DPjFCyGCYgZZQF/75fSS6K6Kg/xjH9PQMDMpKVZq9MeF3Sb4asKE6uwoUPDQNBeQN0r8JfoWKPRB9fdobX9be0nprQTq+CX4tiLVCiJunmfFDQGHE7xtiBOlOcE2FrgTiz8uZx/OkovedfdZx8TXdg/GkPsk2M8J5cZ3UNfHr3U9BgybPRaIWwliSMTdz65Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH0PR11MB4968.namprd11.prod.outlook.com (2603:10b6:510:39::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 10:32:48 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 10:32:48 +0000
Date: Tue, 20 Jan 2026 11:32:44 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Shuicheng Lin <shuicheng.lin@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v5 5/5] lib/intel_compute: Add loop_kernel_duration
 support for xe3p
Message-ID: <aW9ZzHBK24jdDfBB@fdugast-desk>
References: <20260119171013.442579-7-zbigniew.kempczynski@intel.com>
 <20260119171013.442579-12-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260119171013.442579-12-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB9PR06CA0021.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::26) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH0PR11MB4968:EE_
X-MS-Office365-Filtering-Correlation-Id: de5d73b0-f5e4-463a-4ab8-08de580f41c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTJyUzBLUjJjeG1kWUw2QnRaLzJodURXbDBkNktIY09HMW95OFJ5dWoxNlJT?=
 =?utf-8?B?N25rc3M2OXd0VlZDbUZWbkcyZTJyVEFYNVlobmZqYXJ0N2l5dTl6WTIzdUFW?=
 =?utf-8?B?YTdxeEJkd1pLRXVMZ0dzbXBlVm1NZXlTOXhydHpENHlyTEpWYlhPSWJ0d1dk?=
 =?utf-8?B?U0FHVFVXY2RaTXNQVCtrSzFWL1BxdmpRVTZKRFNsQU8wVUFOenFIRE9kbkdm?=
 =?utf-8?B?ck5OaVBHQWNvZlNKT1lhbkpZZ2ZPWkNWMzYrOVgzRTJLZUUyVWkrdUFTWnph?=
 =?utf-8?B?SnZwdDF2ME1kMUF4NHYrckxTcXhGRnArZUpvZVFiZlZNb1dRZ2ExQnZQaExO?=
 =?utf-8?B?WDBRWXY1aU1oclczdHNJSjFvQ3lvTThNcnFpdjV2TTFGenBjaHg3d0ZyOGtj?=
 =?utf-8?B?a2dGYnkycnhycDRiUU5LV0JrQkJpZkJkZHp0dERjellQZHk5TURKbW90ZWpQ?=
 =?utf-8?B?MWo5ZURYTnFGSmhBbTkxWDVuSC83UW9VeTBaSmxXYzJQSG9CMSt3VVlWOGhB?=
 =?utf-8?B?S0NoK2tkWkZRS1F0Sk5jZ0dyakU1bzduQVp0UEJUNG9KNjRjOElxY2NKUWtn?=
 =?utf-8?B?Q1RyVzVyL3hkU1I5WkJzYXB4T2t6VVcwZHM0RUhKdWRZOEZUUUVvbGpWblN5?=
 =?utf-8?B?SE9PWFdsK1ZrOGxGR2w4MEFhZTRodkw5NEVUTFh1L1VrSUhuY3ovdzVQZUFN?=
 =?utf-8?B?b0ttK3VFbW4vbnprOG14Z1BCc0xmRFdWNXhHMndpSU1IaEZmT3lSTzlLRlV0?=
 =?utf-8?B?NkZ4eUkyMHNwSCtqQmlEMEJlNGZyTFA0ekVrU2FOc2kwTitrRmJYNnV4anRu?=
 =?utf-8?B?aFJ0TldwdjZEUU1DQ2hqa0ViYVRsbXZUdzYzaDRrOGxQQWpvaktZUmpPeWw3?=
 =?utf-8?B?MmJEOGpZZkZSUW1USGZKMWFIak9vWmFodG50eW82aTZMVE85N0svbGRLRGt4?=
 =?utf-8?B?dEFJUTlqWlhSSFdJYmxUSnFhYk5tOGlVNlVodXBXcDViUEVWOWVEL0pURmRY?=
 =?utf-8?B?Ui9OL1J0WW9sempja3g1Ry9EaWZFc0lEdzZhakI4QS9UREk3bjVVUCtDMXVa?=
 =?utf-8?B?K1JlU2NrSk4ycVMzTXFqb0ZNS25DUTNmQVVtMU5mUGpGNSt3ZmtwRm5RZ0Qr?=
 =?utf-8?B?RVRlcEpnTkhsbERiWTI4amVSQW81U0lvVWhuVjhoRWFSczZjckl4QjRudHhj?=
 =?utf-8?B?aUU1UkN5OE1SQ3NkbGttbFBHR1Eza3ZrdHFLc1ZyemQ2V2M2QktXOE1TMzV4?=
 =?utf-8?B?aVNKazM5ODhVVm9Jb3o5SVJ4WUdLN0hoSUdlVjZpWVh5NHA0bkU5Y0RyL1A4?=
 =?utf-8?B?NU9EUnQ3TmFTUHl5UE5YMmZFaDc2amkxSTNoOFg1akFITXRjMHo1bURielRK?=
 =?utf-8?B?a1ZIUzJucmpjSFQ0TCtLZk5ENEsrL1YvT3ZyUGlHMVJiK29yeXQzeEJxdE44?=
 =?utf-8?B?TWJQU3NRWkVHZWM0bFFMeE9zVWlibGFBRTM5d0lCMTBXMDVWQldFWDhYL0VF?=
 =?utf-8?B?R3VHc05xU2p6aHhCUGd0dHRsTzZNUnJqdmx2dS9MT0hMNFlUcEM1LzRXb3Ar?=
 =?utf-8?B?YlZ5ZEJhRHkvOHlLMklCL2lXNTNiSFMvRDhrRGVnYUNIQms5Y3VPaFVhdkJS?=
 =?utf-8?B?V2hodk82YUZjc3ovNGF3RjViR08yUTB2aW83RXl2aVd3aGEzWGFYdERtUFZY?=
 =?utf-8?B?MEFNVStWUXdQOUlBTUxZbi9qaWVVZWlKeHBZdWJKZmhvcmkrL2pzSjdzR0lL?=
 =?utf-8?B?WVBZMEFxNThHQlJXS3BjL2J6SGhNL2F0OUN2TEtGTitUNVVaUWw5QVdGVDNo?=
 =?utf-8?B?RHdXT3czWXFYeEZPQXBjV2E3QWNYUHo4QkNXUWZ4Qmw4Y01QR04zbHNRRGI1?=
 =?utf-8?B?c1oxdzJXVVdaS3ViK2pHZDNvWGl3bUdrejlmSW5JejBmcmtXdExDM2xSeXNx?=
 =?utf-8?B?MWtndytvR1J4UXd1YWplajdXZ2htdjJQdDBNM1lpM0ZxUy9pS2h1VlJpb2hU?=
 =?utf-8?B?V2lWcUZNbFlwdVJqTG55K2hidUdER1d0emJrKzI2Nm5tMWpsNm5KZENoOEtK?=
 =?utf-8?B?TFhaV0JHNVlGOG9oaHdqK2I4ZXoraGpUOThKYWlIWUdHbzExUUY0ZnpmREc2?=
 =?utf-8?Q?8eHA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGd2dEY3RnZLRE9tQmpIREZ6RlI1RmtFNnZtWTluenpBUEc5K2NxTWI3TEIv?=
 =?utf-8?B?Z21QWVBpdktDZGFYampEOHNPUVRuYmI0QmVJS2VxK2s4ZlBiMGZLd3NhWTE2?=
 =?utf-8?B?TTlrZ2tQb1ZUOUNNblAzcm0wVkhZQklFNHdESlU1bjZnYWJOQjIzTHg4KzRv?=
 =?utf-8?B?RFlYSXhleXF5N1JFK2EycS9CVE5vRFFyeHJvYzUxRldrMUgwWEFLTEk0dUtr?=
 =?utf-8?B?VkdhUlpYR29kTGlNYnRjNjNZemc1UzFBNTRlbmhjckZKOTlLSGo0ZTZISThk?=
 =?utf-8?B?a1JmTGdOeWtEMlpOeXZoTjA2RFovVVJzdnovbDNYZDYvQ040TmJGaENDc00y?=
 =?utf-8?B?eGlFb2V5WmRyV00zQTJrdDFuVWVmdG5MbmV1Q09rTk01cVhjQnhhWEd4VlhI?=
 =?utf-8?B?dU4rZWM3d0V2bW9TUXBqNzJRWU9qVXNGOVlYTE83bVlOL2thQ1RxaHFQRWF2?=
 =?utf-8?B?V1hTV2N2cWlnVUJxWEZ1N2ttcS9jK1FhaXZDYkk4VGZjZ3MxOUxsOGwzRWg4?=
 =?utf-8?B?NUIzcEJ3am5leFBhNFVZSllxalFHWUk5Y2NLeFd1NUNRdHVpOXBJdFcvVEdl?=
 =?utf-8?B?TCtxYjc1bEdZTGlxVUlLVjFJWGI0UHBZRTRyMU9aU3ZBdmFwamM2MUNkZFVH?=
 =?utf-8?B?NUp5L0hHem8vLzhiVUtTMHNnMEFpK3Q3dEppbWJSeGorZlJqMTNQeFFKOXlC?=
 =?utf-8?B?SmIzWlNFV0ZvMi9BeWNTaEdjQmpEc0p2VFhBdFRsVGJoT1l1ZEE4LzVBZEVq?=
 =?utf-8?B?WlhncHFsdkpIMWQ2UDEzZWVvalBVdEJkOXJQNU45QWkxREFDbVRFYlJIUVVS?=
 =?utf-8?B?VG91clI0cEMvc25vNURDQWoxMGlMQmJZUWhLS2JmTTh2bENiMmx2blZ4OEhH?=
 =?utf-8?B?azJ3Z0hKQ1loYVV2Vm1GMk9yVW1ONnIwT3drejlJVmtza0cwclhyNEtseGwv?=
 =?utf-8?B?THhJcFVtNHZVYmFvUGxrMUlONmNNNmRVSDFyb2FBbUhUeGZLSDF3UVJ1aTdS?=
 =?utf-8?B?TmxkQlJnTlNQOE51dHJtK2JYL1JqcDdCbGFkbXk1QkV0NFFqcm9DUmlhZ0dy?=
 =?utf-8?B?NWdiTXE0ZjgrbG85dXRsWlJEWVEyUXBtZkZLc1l5SEpySXJrOE41Y3FvVkZ4?=
 =?utf-8?B?YytFelpmQWwxVFV5SFg5MUJwOGsxUjRPLzhQOXZuWEMwNlF6VHI5OGlQbFZz?=
 =?utf-8?B?RGU3U2xELy9BUDhDT09PcGdrcHJuVzJhc1dDQis1eXdPZ1BDMTdodTNXUWIx?=
 =?utf-8?B?TnE1YTRWTWxRS0tSVGhXRU5JZmt2VHBhbXBzZTVUUk5EbEJKbnNlaXJDdy9U?=
 =?utf-8?B?YUpRa25DSWsyK3NsMmlVM21ja1BjR3ZkOUxPOHdNdzd6cXlac0VzYWo4YndZ?=
 =?utf-8?B?ZnZxRmVzNzRZZ1ZaekdyaUN0eEdZakx1S0QvMzBYWXJ6cnVCRk1FZi9KL1JE?=
 =?utf-8?B?WFd4RWZjcjZKNEJyazR0UGxnOXUyNUdEakIxazhTT2FiYjFoaHN6SUZtcjBO?=
 =?utf-8?B?ZGxLcjMxZlJOZU9DZzZIUWxSamVTdXZlT285dDZmMktJWXplcDI0OXpFZ05v?=
 =?utf-8?B?eUw4VUZqdWJpNUIrcWd4NDlGNDcrRWI2VTdPZlBQbHl1UCtnTk0yaVhUQytp?=
 =?utf-8?B?b0w5ckRvajdndTRXTEJRT3BYdDc1bjhnN2VwR0U3UmVtcHdzQnFSUkl6eEkr?=
 =?utf-8?B?NWZQVkhBMGtyTGxvZnZ3MTZDV2psK2VoNWJiSVh2WVE2aXNZU2x4WWk4RUFS?=
 =?utf-8?B?RnVyOFBLRVY0RlNxNWd0SjRMVGVhSlY1dHZKK0x4eGJ2THF2d3IydmtoMXh0?=
 =?utf-8?B?U1VtRUJDNHA5ekNMblhZbThnMlovdlg5TW9neEp0eEk2QlQ2bWZLQVh5eUJi?=
 =?utf-8?B?eU5QWk52L2RrL0JsRDNwNWJLSTlqSzNCWG1malZIWUQ2d2I5RVZBUS9mWnlM?=
 =?utf-8?B?ZWxjRzBmOTdIamErU2ZWUDYvbXVUVGtQQXFuTFZjMVBmeEJVcjBlWW1kTDAw?=
 =?utf-8?B?M0R4L3FEcGFDWUtBZ0MzVU1zNDlmSzA3ams1ZnRVbEcvY1Nqc3JSNjVqSjRB?=
 =?utf-8?B?RDNZM1lIUjVBNHI4dkJXaEQwZXQydzFRYlpua2h5UGpLMTBTMmFkeWQrSmlG?=
 =?utf-8?B?Y2FsK2t1TUVHSVVDVlBPeGp3RWhpcnMyNWEyUzhtNmkxc2hIOXNuZDdYWjdV?=
 =?utf-8?B?ZHFicStZUDZ5Rlk0TEZ2MVJ5enBnUHVqNjl1bElMVnUyc0hpR3BJR0x6SEhx?=
 =?utf-8?B?ZUFUZTVISGFwTk5IT29VaEQ2b0J3azNjbXdDRkZQdUtNdWdIUU1GKzZXWlJR?=
 =?utf-8?B?c2kyMnVXaGxUdjlUQXZwSHYwZzhCWkJYcWhDNytOaTltL1N2S2ExVXFRMGIv?=
 =?utf-8?Q?YMYwKgYvFcQAStlc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de5d73b0-f5e4-463a-4ab8-08de580f41c4
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 10:32:48.6184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZ5eLKMmotZz6UWHJytgwDTIj9LrDG76OVsMKFnxHa5rXqidwz7MTOGwHtL52ftwnFOEkYNhPagFog78F5ryWIT7c+kGQMJ+XbC/tlgzKZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4968
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

On Mon, Jan 19, 2026 at 06:10:19PM +0100, Zbigniew Kempczyński wrote:
> From: Shuicheng Lin <shuicheng.lin@intel.com>
> 
> Xe3p is missing loop_kernel_duration. Port the implementation from
> xe2lpg_compute_exec(). It stops failing "xe_compute@loop-duration-2s"
> for xe3p platform.
> 
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/intel_compute.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index f27344e717..3244d4fde5 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -2098,6 +2098,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
>  	float *input_data, *output_data;
>  	uint64_t indirect_addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START;
>  	int entries = ARRAY_SIZE(bo_dict);
> +	int64_t timeout_one_ns = 1;
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> @@ -2125,7 +2126,18 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
>  				  XE2_ADDR_STATE_CONTEXT_DATA_BASE, 0, false,
>  				  execenv.array_size);
>  
> -	bo_execenv_exec(&execenv, ADDR_BATCH);
> +	if (user && user->loop_kernel_duration) {
> +		bo_execenv_exec_async(&execenv, ADDR_BATCH);
> +		igt_measured_usleep(user->loop_kernel_duration);
> +		/* Check that the loop kernel has not completed yet */
> +		igt_assert_neq(0, __xe_wait_ufence(fd, &execenv.bo_sync->sync, USER_FENCE_VALUE,
> +						   execenv.exec_queue, &timeout_one_ns));
> +		((int *)bo_dict[2].data)[0] = MAGIC_LOOP_STOP;
> +		bo_execenv_sync(&execenv);
> +		user->skip_results_check = 1;
> +	} else {
> +		bo_execenv_exec(&execenv, ADDR_BATCH);
> +	}
>  
>  	if (!user || (user && !user->skip_results_check))
>  		bo_check_square(input_data, output_data, execenv.array_size);
> -- 
> 2.43.0
> 
