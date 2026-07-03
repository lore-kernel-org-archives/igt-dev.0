Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3987C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A0A10F935;
	Fri,  3 Jul 2026 21:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGHpGMQQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8924610F929
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112672; x=1814648672;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=czUxO0NvdPNhxMGCh3rx3wM4jVpT4wn0lnseTRsA9mY=;
 b=SGHpGMQQmc28VJ1FRUZbhwr6UXT2tHA1nQ7z9BvnCV4PHFPy3rkNF282
 sI7Vsyb1X7vwnzHEMWLZ49ydB7lGSDsq9fh7MEU2/HMmao5U/Y3eHxwSu
 OfW65C23GY5gDGGdTj1baW1v+HoVoa2lJooeQU3A8oG8xjcg66ILtpQ5u
 m8QS78pkMsrzg3okctelbwxSuhP2ZR+Z/u+C/Nqm3jxbFcS8UkqSmPsH4
 zEcWcoeFNWbO81a9HkiNj4EH30+DfjbR9X5i92RW2ZIQrd67oUfVjEhIY
 KOWYmUzwt7f1LFibYdFIW8SAxOPwZD5+Wh4p2s8C387DQAsFVN64r1FPi g==;
X-CSE-ConnectionGUID: jGWXGoUvQryux0g+rtSDDQ==
X-CSE-MsgGUID: dZXv1My8SX2Y8iIZND8QBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83894280"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83894280"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:04:32 -0700
X-CSE-ConnectionGUID: SoenZHDPTJiIzs7GtnM4sQ==
X-CSE-MsgGUID: 64UDjhqiSj+n3I4O6szfZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="253328336"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:04:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:04:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:04:30 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:04:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbCpA5IXn93n0i+hUkE5rmA5jrMOQo/0FSofJLlp3KkM7A+BTcX+x8jz68UbNPu07v9KKIQ656aa6JiyyxsZQN1gNep8dbT9X+X44JCx4nzUf6wgygkTefc/VO5RCVXrkTvkLPevYMdg8ihzRZIMWvgVofoNplaamXB3c2wSqOzgxj7uPriksJ/TlyIt4l2bA63x6sIyll4f90+noQLoap3gY+lTM4O7ATSRSJ326URFA9JfJpsiSih95ffZpUrltruuJg8iA6HE6IAkQPLxcZ/bKea1UVNJ0ZFseqpVF8wrltE2t66hPlopbqQZ1CWVF3ToyUDgLlGkRWpH5KiQ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmUBISwZQWxfyaTjT/0uokRPxsYC7UuOFT26KxWossI=;
 b=tG6SlqgGYq/13A5GfCUaAndGfWNlYBeKAC6V1SBrUs5delJjBfc47Y1Z9wmLFdLQhhs518qI2+mHeMcktXwBg725PrqDnxCYv3v/zTm6Am6tu1a/pD98Lw+7DQ5d0JIbMdQfTIBwmAdKnyJ8SQq+v/nbDi0gVrwxit5tY4lT6vLlojk8F4D2cgMlWerLWXNCC6rSotmeCTG7pUo1D/xQgVyHekGAX0xywDtPMtBEAijwYE61b5Y+B1wk1BGRCq8JkQos4C5rpTq6Bt/cZW7k3FkfyCP+YgfVlXQVXRVYZv0sLAQdDualYX/ar7cOIifWS0d3DCQ3y5lt6LaF+Tq3Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 21:04:28 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:04:28 +0000
Date: Fri, 3 Jul 2026 23:04:22 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 16/31] tools/intel_dump_decode: link with
 minimal sub-libraries
Message-ID: <25yhjotvw36qaslglhffnjy4mbxgsnn5q7c2znlyae26lbkx7p@qm7btgnullwc>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <71a8f67badf79b70dc76d4cb7e0d9133993670d1.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <71a8f67badf79b70dc76d4cb7e0d9133993670d1.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU2PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::23) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: 1386bff5-2548-4b49-038f-08ded946aba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: LUhNid1RSELI1OHHb/dzG9PFIo6kN0AZocjsnF/so0DjlEOBzdAos5oLZA5R3bNxyVLyeuLxzI5BsBCiumMlAbX4AGJCf93QnhuYSRRPFCmvB+TVxCtLmk2ksRo4c5DoRLiZR9tmOHqas2fa99Saydxzl1FhoTH3NMbalAXwfXGXavOJOY2SnOKT2vDWb20AnS772EMOHzGbCbVqw6WpatvSCJFPAb7VauKwijmI3fXIowgJOSFesP4j/wbabpbEIaAl9wEjIAN1p8MNMZ9Qb25PRcEI0l23hySSLmErg/IsqQDm7xrEC3wLNzU5PbQJx4pPxCAcskxYev3on6LAZPs1RtVLy5w3gzcPL8VlsAWmrF9aDGtit1lXgJnLf+1Q5wthcXBoj25MxudPEWWPG08aCX7bC7lUGpXW+E5m4k7iP2RdR4sJQqhXQ5yvdL61sIDE8S30eNE/cgG6bfAFf+wlpoBhwXYsldUA6BqyW8d5rVbyg78R/kQiU3mAZvuTyzb1wfrZv9x/BidyU/TvwthNXc5FuU8U4IUI5YjX5l2zbPssrKKMgTA5MgFokLVqOU4I3T1VDa8a/CajO6yjs6q0sLI04wXgpqWMevpH8U+NP7gKLyfwsBqeISrbUjVytPwVd/p9b/ImLJHi8dI5P+k/2/XHAfpnnKBjB9OZ+KA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWxsM2NRenIzNWMwdWNCeXM1VENUNmZOa1N3dmxQZUVnVTErb2xzRktjMDRr?=
 =?utf-8?B?NEFlNGpyeGFpL1Vld0tYQUw0UWhzNmMxNGIxc28rQytud3FVVmVGLzZGVDlh?=
 =?utf-8?B?dmNzTmtqWE5Bc1o0NS9oZ0hiYk5nTjZnTXNrSzNwZ3BCNmYvRTlWRGJDR0xk?=
 =?utf-8?B?Q2FuaTQ0aGVtbHdZK0dKV0hjRkFMQW05L21yL3YvSDFjVWtOeUFxb0tMQUdE?=
 =?utf-8?B?UlRhL0dPREZ2ajQ0clhDS3VOTUphdVNIeWt4UE5Rd1ZQQXdSNXpVdU1yS1RW?=
 =?utf-8?B?Y3pFY2hPSzJVK0hJblhrZklCd3Z6RDRHZ0JCSCtnRVN2Z1QwQTBNa2NDZVlR?=
 =?utf-8?B?SnF0aHF5SFkzODhxK2xyN3JWdDN2c2xFTFh4WXNoOHJDb3FsNWxETElwdWRP?=
 =?utf-8?B?NFI5RlhSVG1RbmZuNzJwMFRkZ2c0UXF3QmYyZFlxOStuL0ZpWUZmNlRGbXRO?=
 =?utf-8?B?QnlaTDEweFZSV3VXS2hSaGlYYjY4bmd6QmsveURTQ3A4Qk4xeDhJS0FGQXlT?=
 =?utf-8?B?UjdUUnJ2RSs3bDVrOFpkdzlxamZrMSt1V0xHSjRtaWl6RkJCRzFtdTgrQU5I?=
 =?utf-8?B?VWhvdUwxOTA4M1Q0NVNrQklBc3ZETU5qd3VFTDFpY1VoWjhVcER5V1NMZjRt?=
 =?utf-8?B?MitBQndvQ2hIcTZkR0hGNE1BS2MrcjNEOEtweVA5Skt0QzZwVnV6dWxkdXFD?=
 =?utf-8?B?aUFhbDNnZnQyRVRaV2pxMHFvYlVlcnM4cytaZ3lKVy9pQmpPS2I2cXZtZXY3?=
 =?utf-8?B?clZnK1pvcUNmOE9hZ1hQSkdmVG9BRFdCMnJhT3pQSXFxa0Y4b1BRSm5zWi90?=
 =?utf-8?B?ZFE0dVdZUXUvSXVleWYyUzhBaWNXUE9wTkhTV3ZRQml1SFVyUWhFZ1c0b2NM?=
 =?utf-8?B?M1BKRXV1WG9mR0VsL2FOV01RV3cvWlpKeEc5blQwbmxhUFFiZW5HckZqMnF0?=
 =?utf-8?B?Y3k4b2tPS3h5QUV2Qm40U0R4aXYvbzB6Uzl0QU4rT2Z1RFRTQml3dFZLTkM2?=
 =?utf-8?B?K1hsTDVqa0EvNGcrZ1pxbkZiampUZzcxMzZPK04vU0hnL0R0aUdlbjZlRFUv?=
 =?utf-8?B?TjYvblVlT0ZFRk1ycjJkU3JyUkFMb05kUGlpNDRXdS9KZzhsUjFQUEU4aVMx?=
 =?utf-8?B?K1l2VVRHeEU2OUFsMDhiTktDdmZtamJGYjhHRXZwS2VpaUtkOGx4dm5sTUVR?=
 =?utf-8?B?QlR3Uk41YzlQSi9wVVBtT0QvWDVpVysvQWFRYStSZ1VnWlRrZGNBdFpSNGVu?=
 =?utf-8?B?MHdOWEFqTWdNSkVidDlpNCtqN2lxbXVpTVdlNlV0VUxvajRNSHEyZ1l0Nkk4?=
 =?utf-8?B?b0NWdDhneW9TWTVxL1pLQk8rU3J4TWdKVEo0aDdvYkhkZlhOV2NsenpNbGcw?=
 =?utf-8?B?aU1FdzBDQ3RnY3ZmbWtBVnR6ZEdaTlR3UVg4SHFLa1VNUy9HN2MzUUpnb0JJ?=
 =?utf-8?B?V0VoZlJ2YkJhNVZScWVBMFRNd0lURG9CaHdiaEVCcVBRbTdieVZhNXNoUmVa?=
 =?utf-8?B?NjFFREx5aVBnUnNjT2JvUlVrUGFmaS9tQ0RyUXZyaGIrSHFibnR0QWVINE5w?=
 =?utf-8?B?OVJsYm9LSG96UXZmaFM1ZEhDT0FqdzZiRTR6dHM4TEpCR3Z2c1c2YmZrWlhs?=
 =?utf-8?B?RHNkWVN3VXl6aEYzYTBYN2xpK053T24rQ25zUS9TUm1STHNKeDNydG4yKzFp?=
 =?utf-8?B?bzAweU41WThvVzRuMWRUeUllNzVEcWJPMUlxOEdDL1lQMitzcldRZitKL1FP?=
 =?utf-8?B?WWNuRUZsVmRnRWEyMGE5d0krQTg1QnJNUGtSZlVJbUl6ZzhPbFB6NHV4Vmph?=
 =?utf-8?B?ODZJNW5CNmZmT3BpOStIYmNySjFBNk40SHVTK3BxQWRzMTVUbW40MEJWd3pX?=
 =?utf-8?B?d0dWczNJYXByM3B5c0RaNC9QdW04a0ZGczhySERGSkc1cXBWR2pDbGNIYlRG?=
 =?utf-8?B?RnFHbHhidXdPWkJGb2pkWjZFV2Z1SDQ5WElQeGxNMnd5YTlpRGZxNGNrZ2I5?=
 =?utf-8?B?b3ZUK09rM0s4ZXg1MmZDdzJxTit0Y2JnY1ozdjdGYjNqaThrOUxqYUFxc1Yr?=
 =?utf-8?B?SFdDTG9uenphOUdic1lOUXp1anBxZWh5ck9sR25MUVpJRGJQYlFMK2cwNUgy?=
 =?utf-8?B?azhVWmZkN3FtM1BINW01eHVScXBvMStVTUhXdlFOWXZrVmhKOTA5ckdhNFBE?=
 =?utf-8?B?RmFDZ3RZVDAyUmlRVDNGc3prN2pQU2dRalJHKyttVmVWdURmUzQwclJtTEIr?=
 =?utf-8?B?aUJmT21WZmVBRG5jZjBKcmtmV0U2WExUcUdQWHVWQlVxc0hJaGF6eVRnMjM1?=
 =?utf-8?B?Mk15bUxjMkFYSmRrNWlPWTVlRGlUSmVGL24zK1BMRWtrVmZOY1lqcWVRc3F4?=
 =?utf-8?Q?xzMuoX2U2UwwrJhh0Pq3rTk0GaQiVFqiTgLBSeNdy1Anj?=
X-MS-Exchange-AntiSpam-MessageData-1: 5ZgIMtmqkfuoLMySjFMnwrXu9qPOGwKE71Q=
X-Exchange-RoutingPolicyChecked: X1o8jD1qGtq4LOiHLpA96MWmIXFRklgpBDLX7KgwKKc6qq7oE1oPWbj4VTYfKS2V5+fT+B3z9NpaNHdYpfhl67+/KeFb6GLbI+tUFHw3obQNPHcYExWAtdzNwvMd/EEw8/IDgmkRmt9XC7cAzuzKSss3/V0BGCtUuNWZmkJTZ4/1fmd2M4XbyzdgQlW6c4yNWLd2S3EtDth9nxfKf4QtCWYBxwg4VrxU15oJWBprxpOaza9VGc4fsROjr3kPZD8VxqQR63QrTLrZz1F/ia//UO3iZUXzDELF0FgBjBIiCJKRV2CPjyybY4jODw3dWKYDBqw2V5dhpdVunRgHoYkKkg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1386bff5-2548-4b49-038f-08ded946aba2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:04:28.4879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7sDgVrxudDaMQIQtq8xu0d3rYOZv7SB4Od4Pt5VSdo3IyN/GmWR82D0+j8PvKs/Cjl4Wa+Bm3Zrn8pdMcXEAKCh2FCb+l4vgjLN+4fhcuaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

On 2026-07-03 at 16:28:50 GMT, Sebastian Brzezinka wrote:
> intel_dump_decode only needs the i915 decoder. Link it against
> lib_i915_decode instead of the full libigt.so stack.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   4  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index a3fef87a9..467b8eea1 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -20,7 +20,6 @@ tools_progs = [
>  	'intel_display_bandwidth',
>  	'intel_display_crc',
>  	'intel_display_poller',
> -	'intel_dump_decode',
>  	'intel_error_decode',
>  	'intel_forcewaked',
>  	'intel_framebuffer_dump',
> @@ -80,6 +79,11 @@ executable('intel_gtt', 'intel_gtt.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_dump_decode', 'intel_dump_decode.c',
> +	   dependencies : [lib_i915_decode],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
