Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D83DFED2E4
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 08:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3075D10E993;
	Thu, 12 Mar 2026 08:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSubZ2Vr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071D710E993
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 08:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773302810; x=1804838810;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=poEh/gnK87n6PyY8edsKSa5rylwC4Xa0MGYJSasgfx0=;
 b=OSubZ2Vr7jnDcZgivugHJJkaQuL4Wnc7OAa+cfQ+xc3lipIagYAqU/VO
 FAGAQGSY2X5wgBIYP9jXhcgdgJlFhCploZNW2BE63dMcUhquPP37SDa19
 9ywlRoJSIUoLDuDA6KiM3pKWzSvYQ09zmGfhT6uP5ktbExNk47LbEJkT8
 tLbninwzfIhtUFZOGaFPg5hDbVV70BEqmyJLGsusuG8cIW3CPr4pWlu73
 Uy4tJMRYCWfKQJaPTRQtlIJLg9Da9n26LSRf5VN0VQVYhKzuoWj87Gf27
 1muoEoAtHIHQtSuRey0fiGnmlpPsJ5H4rZyNYjkRhCh5QdLyrUSruWckr w==;
X-CSE-ConnectionGUID: rVNy6vktRxan+M/gFlU5Rw==
X-CSE-MsgGUID: /dK+gZV6Sse1ZI0Ain9qKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74085508"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="74085508"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:06:50 -0700
X-CSE-ConnectionGUID: zIpZvKwJQ8mbENM3Vzm/bw==
X-CSE-MsgGUID: JmNwudLiTjWHnQ1gruIBKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="220798473"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:06:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 01:06:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 01:06:48 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 01:06:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSInE1gWKIc1cz5lQdj3OohGuZPFd8snioYVCZUh4634nNMYK6A50qZ+JseSNq6/bbZ1T62qqJc0oYoZAcjq0WItebu1eTjR3AMKKMkK4TC+caMcJTRejG/ji4O+iDY6XWwyzUklo5QriTj1v0Oy82Wlel6DME9Qp8DLxRjgJ0bUkqNQ4S4c26T4v6K2leu2UoiPO5ExKufiKlVMvpDqdZvvC45x9ngS54akEkKbljm/K1AZTKJTcMFuWlGDctt7OTEIkVBck3oLw9ko6e5sRCyx5heAYDDxUoBWq5BM/NeEVFssQ2wuonr73Pplppzk5+y9dxOG3YJKCAelUiV8rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcLYdW+2ePfMdwHwxBiwiMWdbwaj+/GBgZBnM2PYlzg=;
 b=L/4LuA9TIRL6VHzU3VB0wDRJ1qd42aRY0FU3KhC2rzhtfWas5ya1Wgp9AIS0e2caYJZuuFU7HqxN1o0IswzqJrhoF3fHGUESe/kDjgpLgJenvp8TaaIs9x64Qe7D6zp7cVH9I4i4cFZ3pjzXINRsaxco3w5Zfbrtx1j7EExkox1/0TEJU7Wq4pBnHKxuAl0SAAy8KGP48fQjlnJ1y1boE6S4WalcaV+gGGWLD5jJRszaW3va768eHIy8rZ4oX1XES0eb3IWs/ILa+gkwQTpqW3M5pkG2fPLILkX6MsWHir+CUUkFy1tMkA7ScIKfqBhyIBtp8yeSP+kCBMUDB0C9Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA1PR11MB7368.namprd11.prod.outlook.com (2603:10b6:208:420::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 08:06:46 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 08:06:46 +0000
Message-ID: <96811402-0574-458a-a53f-2324f85d199a@intel.com>
Date: Thu, 12 Mar 2026 13:36:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 1/2] tests/intel-ci: Add NVL core blocklist
To: Aditya Chauhan <aditya.chauhan@intel.com>, <ramadevi.gandi@intel.com>,
 <himanshu.girotra@intel.com>, <igt-dev@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>
References: <20260312074832.51575-1-aditya.chauhan@intel.com>
 <20260312074832.51575-2-aditya.chauhan@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260312074832.51575-2-aditya.chauhan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::26) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA1PR11MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1ee12c-c0a1-45da-1c8f-08de800e4e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: Cz6CPPAV2fN+6Lmv4sZvDxIbsha9fLAm8057H3Sd7FrXVPLDt3k+7JchSOqW1OJ3Wo6S0FXGOtTOyR79fnxdHRm3EFKoTnyrLlMTukTN7OaFdeTe2gJYPIkrnvnSunCWBzpxYg7tgHPJIY9IigE89nCiOLPADTYSZWJfwlO/gkDx8z+nxuafep0KBnDXbr44wesgBW6ambwhnf10LbgPC+lRSJKEj+N9/gqwcnGfM2lTZixxdbEB2zMnzBewi9bz4FWqPtYZrc/koqT+i2aEksQdPnPt8q2MAuzBbNBQD6XsLALZJi0k9oo2mI/0jq6cSlJokHuZ0CBY4HheYM8u1nRrz8k6I7rURbq3KxTZKxz27lpSuyc/3cHcKf08w69fD+yULzpEY84gJHABdmJjVGkEHh43vitDifBtMqu7Mv3gTShWdizmc9l8xvmmV3/5rMzYi4Q9Wksa6TmFW0mRT66cCbiDo6DCzqa61vQQNa0zTARSaYXIryXpxe4m8VsHR44BMnicvOE9MuUVNJWg1uUK6g/SMd/pDahzMmafEr23wjiz7k6Ok1VccMhs5veRa6XpdXSfzynLh1VxiCR7w+SIp9mjWDxE673B6ZAnTWgSj21gUT+ng2sU2u8RA6Uxb5RwcIdfjIi9TYtGJGX09WmxyEXkiA29AneTz64G+QvHvBYkAYO584aHag9y3VzE1kWMqNspQIWPMNgUE52gh8Cv7PkUXm8h4q1I0oy1Qk4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2NoYmVoZEdWZk5DRUhUaUdxU0c0SEwyWm9UV3cvUC9lbmdOQTZaMDA3dEhR?=
 =?utf-8?B?SU5sdDhHOFUvOWRtb1Fuako4YWtCN0ZhR0ZSUmpvQWgrT0lxNHdQSk9KRDl1?=
 =?utf-8?B?bnJkNDNjaGQ4bnVQYUcrbnl2WGhnSFJOZDlhRTV0RFlJL3JRTkN2cjN6bDl2?=
 =?utf-8?B?S2g1Z1pjWU52QlhsQUdDZm5xZElLZXZQZyttS3BxVER0U2lUUkJBclBFZTdj?=
 =?utf-8?B?NFVoQkg4MkRLbzZrV1V3YWI4ZTVHb0ZPcnFLc2g0aG1adzVmdXkwNVUyR0cz?=
 =?utf-8?B?UG5oT2RSK0pCc3U0Rk9xOG83M3N4VWlVd3F0Ry9qMDlvbHNMYWVtWGhISkhK?=
 =?utf-8?B?WVpQbXZDWHJSazRBTjRqcFJUU1RTZzM3bDN4NzdBOE1HZlpoNVdsODNmQnIx?=
 =?utf-8?B?aUwwWEJGaTJncVppRjRYbzJXMXB5UFVCM1BtUS9iQVZNcXZxUkZXdUpPR3dL?=
 =?utf-8?B?azk3WkJKbTlrS2pOREZ0eGF1QWRzWDN0Wk1YbDE1dFQra2FGYWpVZVNHR1da?=
 =?utf-8?B?OHdMSytsRmJIY25Pc3JsRVErcFpiUjB6VlRzVFVabGdUcDNkVjVEOHlIT2N6?=
 =?utf-8?B?VXhndjZzUE1VWlZ2djd4MkluUTlKdis3RWJEcDY1LzVDbWVjMDRDVGVoMUFk?=
 =?utf-8?B?MlZOMkoveVh4T2tvdWQ1VnpDVXd5YzhlVTVIUTJrS3dmR2R5S2JORW9aUnZH?=
 =?utf-8?B?VGVoVlc1TGFHN2xncUFjVG5kUnlBdVdPc083WXp4YllzRjZBaHJNUTJDc0kw?=
 =?utf-8?B?V3RFQ0xBMk44WXlxVnhJeks1TlloeGpMTTdtd3JNdlB6aUZtb05reUtuWnVl?=
 =?utf-8?B?RWk5NlhDNTIvRTZxbmNLNWZJQVlaTFAvTUdJUEZsRzNZTUJPSkswSW9sZjdF?=
 =?utf-8?B?dkdwUFY2L2N5S0RHVWtWZ2lGams5YXdmRTBrRFJWWXRXWlQ5eVVCU1k2N2FR?=
 =?utf-8?B?T3k3cXVHZUhCYlFYSGFnUnR0cUZRTGljZVNDMGNZelh3aG55WjFUYmxjQXNT?=
 =?utf-8?B?T1B6LzRuZ2tqRkI5OWNhSjNPQTNlc05IVUN0VjZoTjllL29sVlZybVdEWmYw?=
 =?utf-8?B?bnBPMytOOTlHSkNaZlM0MlJMY1hGMGNtOWFsalQyZWpXc2RWMVZtS2ZySmdj?=
 =?utf-8?B?aHFuaFd0dzJsdkxOWnRFZGhuWXltTi9NZElMc0w3VDgzbllld1Bla1h4K1Fh?=
 =?utf-8?B?OCtETW9ha1dSUXhqQ0syNW81Si9ibFZOUWV2VjErSndIQWl1cUxFVkRWU0t2?=
 =?utf-8?B?UkwrSUNYZUQzWGo4aEc2aVN1Z2U5MG5FWTdDSzVKcnJ4VG1hMVdNa2hEN2Ra?=
 =?utf-8?B?TzZYbkthVVB1TGNUQThsSDJMK0dFaHM3ZzNVYXlFZVRxalA2UXJuNVpZS1Jm?=
 =?utf-8?B?aDZaSDlLU1RxSkFhWnJxa0JrRm5jNGQ5eE1VZlQ4SGsyK2w0eExndVRCNkZ1?=
 =?utf-8?B?emR6ejh0WjdVM2xmVVhjZlN2RWsrcTRDbnNNZ201VTJ6UEhZRjRvdTA4VTZx?=
 =?utf-8?B?aTNIcG9yN1c3cHhFU1EwZ2ViT294SU5ta1lkSUlqS3pHMXNnbHByWm5uVE5S?=
 =?utf-8?B?RmQwTXZJT1k5Y2tnZ2dNd1U5NkcyV1RnOWcvY2xxb0tZZmJublRFaDRQazZh?=
 =?utf-8?B?VnRWcEFla1MvVy9BaW96SnB2SU1oWmxJUEhBdVhUKzFnV2RIU0VZb2x5SHVx?=
 =?utf-8?B?ZE11cW1UMUl0emhXY0E3YVg0T241NkVlbU5KaUJ5OENEOUNyQnRKdEMwdzMw?=
 =?utf-8?B?MHFFcG5BTWUwUDkramdxaUFNU2x4TWJ4dFkwdTJOb0w0d0xoMmtWbjNXRzFM?=
 =?utf-8?B?cE5NS0thaUtFYlo3ZzQ2TWZmK0U4dkJhdlJqM1hPdjVhay9PWGZ6VHp6UnJD?=
 =?utf-8?B?T1lCUDdMeVQxMHRHdVBvR1QxK0s5QlVHbWx0c1ZRZzV6WFkrTXVKb0duWmRr?=
 =?utf-8?B?VDRKQWNLL1dGL1hrNUczZTA3VzFqQUM4N2NFcE1TOW1ndmczbzhDQVd6UTVV?=
 =?utf-8?B?bUdRakI2VVBsU1FEYUlrRjNlbzh2N2w0VlA4T0ZHUzlFWUJFbzhIOVJIVUtq?=
 =?utf-8?B?aVNHdkdnUndRSWRMVXRlRDRWa0ZpUXZ1SVdiZE5CZVZxaXNheUpoc1l3cXhS?=
 =?utf-8?B?YzVRQ0s4VHVGS1BNVWQrTm1FRStFaHloUWdQV3U3MkFHc3JhQWE5eWZXdGxx?=
 =?utf-8?B?Z2NyT1lFRUZHdTZERDVkRTRxYWsweHBhYlU2YWM3Q1FJTCs1cG14YldJU1pC?=
 =?utf-8?B?eFlkVFFwb3FyRWhldzFiNGh5V0VWWHRSaGpXVlJvazlYd1psVWZ4YmZqSk9O?=
 =?utf-8?B?MFRPY2hYdnkwdlhKbFlUVm1kYVNNTzIxa1orU3ZUdkQvZU4xNU01Zz09?=
X-Exchange-RoutingPolicyChecked: qqjqtcnTdaG1tl9Ymt6vDJm9GpJHEOVCG2Gf3Z+ZeTEVMiG2tkDqBmJ6zVv4gZ2DeyFZ+Aa68/FcbQ6QXCIzbgCMLlVFSt/oepxDiPUpYWPMatj6C1QS1XEP+qMEMA3P1cv3xl91aGo9uunKrmiIn4D0Van9gIUw1yjIBE0MWkwzsnYxGTbxvRpWHQ1HxqRlhrHAUuuhU2wg28Xp+lDRhKg9Wdx3+CxtyIOMpuba4L64rYxpC4Iu/iRwyxSLsl0KULlG9XUAdOuhSpHGEGJZBs4MeRDT/ZUvHR2QkB1HcWb5+GJuKxB1EEw6z0kclvLOZdpOz2CIuJw8YIFIB5Nn8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1ee12c-c0a1-45da-1c8f-08de800e4e23
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 08:06:46.3609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7RapSuF2JRFBNTSdd81hUumK6mvXNu5usRQegyMAWDi92xt4mcbJ826TyiT0+/wAe6+Yk1zW008HGxGieMuhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7368
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

Hi Aditya,

instead of tests/intel-ci: use intel-ci: in subject.

On 12-03-2026 01:18 pm, Aditya Chauhan wrote:
> Introduce core blocklist for the NVL platform containing
> NVL-specific core test exclusions. Also add this blocklist file
> to meson.build so that this can be used in execution.
>
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>   tests/intel-ci/meson.build               |  1 +
>   tests/intel-ci/xe.nvl.core.blocklist.txt | 69 ++++++++++++++++++++++++
>   2 files changed, 70 insertions(+)
>   create mode 100644 tests/intel-ci/xe.nvl.core.blocklist.txt
>
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index cf0023c63..a1e9dff55 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -25,6 +25,7 @@ intelci_files = [
>     'xe.multigpu.blocklist.txt',
>     'xe.ptl.core.blocklist.txt',
>     'xe.ptl.display.blocklist.txt',
> +  'xe.nvl.core.blocklist.txt',
Also, file should be added in alphabetical order.
>     'xe.sriov-vf.blocklist.txt',
>     'xe-sriov-vf.blocklist.txt',
>     'xe.sriov-vm.blocklist.txt',
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> new file mode 100644
> index 000000000..297651d43
> --- /dev/null
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt

If possible, please add descriptive comments for blocklisted tests.

Cc: Kamil

> @@ -0,0 +1,69 @@
> +##################################################################
> +# Tests NA for Native
> +##################################################################
> +igt@.*iov.*
> +##################################################################
> +# KMS - Display related tests
> +# Other Display specific tests
> +##################################################################
Ex: You can simply add KMS tests
> +igt@.*kms.*
> +igt@testdisplay
> +igt@xe_pat@display-vs-wb-transient
> +igt@fbdev@.*
> +##################################################################
> +# Expected skip as iGPU has no vram

Add some tag like Valid skip: <reason>

and follow same format for all skips.

You can take reference from xe.nvl.display.blocklist.txt

> +##################################################################
> +igt@xe_mmap@vram$
> +igt@xe_mmap@small-bar
> +igt@xe_noexec_ping_pong
> +igt@xe_create@create-big-vram
> +igt@xe_evict.*
> +igt@xe_pm@d3hot-mmap-vram
> +igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
> +igt@xe_compute_preempt@.*vram.*
> +igt@xe_vm@out-of-memory
> +##################################################################
> +# Expected skips as the test are expected to run
> +# only on older platforms
> +##################################################################
> +igt@xe_pat@pat-index-xe3p-xpc
> +igt@xe_pat@pat-index-xehpc
> +igt@xe_pat@pat-index-xelp
> +igt@xe_pat@pat-index-xelpg
> +igt@xe_media_fill@media-fill
> +igt@xe_pat@pat-index-xe2
> +##################################################################
> +# Expected skip for the platform as the tests need more than
> +# one CCS engine
> +##################################################################
> +igt@xe_compute@ccs-mode-basic
> +igt@xe_compute@ccs-mode-compute-kernel
> +igt@xe_compute@eu-busy-10s
> +##################################################################
> +# Expected skip for the platform
> +##################################################################
> +igt@xe_huc_copy@huc_copy
> +igt@xe_exec_balancer@.*
> +igt@.*@.*tiles
> +igt@xe_oa@oa-tlb-invalidate
> +igt@xe_pxp@.*
> +igt@xe_exec_system_allocator@.*
> +##################################################################
> +#Expected skip for integrated platforms
> +##################################################################
> +igt@intel_hwmon@.*
> +igt@.*@.*multigpu.*
> +igt@xe_peer2peer@.*
> +igt@xe_mmap@pci-membarrier.*
> +igt@xe_pm@d3hot-i2c
> +igt@xe_configfs@survivability-mode
> +igt@xe_survivability@.*
> +##################################################################
> +# Kernel support not available
> +##################################################################
> +igt@xe_eudebug@.*
> +igt@xe_eudebug_online@.*
> +igt@xe_exec_sip@.*
> +igt@xe_exec_sip_eudebug@.*
> +igt@xe_live_ktest@xe_eudebug
> +##################################################################
