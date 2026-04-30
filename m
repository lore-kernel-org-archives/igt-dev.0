Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD832FF8875
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 12:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE1A10E431;
	Thu, 30 Apr 2026 12:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCXq42CV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B8610E431
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 12:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777552835; x=1809088835;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=04aYNmEwKu1WEDc4l9fA0ldafScI9mk/idR2zDq1MYY=;
 b=gCXq42CVxp6nDUKdlcG9XRUpRsV7dtL00NnVCXNS6IUPLPuSNVizJBRH
 y7W1JymxlJD9GzFVyXvnoKntW8AmPrFgMyM5Q/4I/xWsvDiEmYYNXnIh+
 rKCmQUReMCFV4uAKtItLWhe5tIq2LIR9m2sefWa985fQlorYW6ck33Fnl
 FSv1F66cMzKOFkcS0j8xqL5ATgLZPXr3q3YxKN+sh0L1cyDX66n+1b5NM
 GE7MB1FRsh/GDQpelrIYqhuFvVT3cBpyFVj1sqbMPBsgwbSmy+4I13gAZ
 BoCJie5Scd5Xzjz4QNUh6MDzR1iA0SOywUAkdhQ3SbY/spe2IjJ3g4ODn A==;
X-CSE-ConnectionGUID: 6CS9IiEUTfykEZwSvH5nWQ==
X-CSE-MsgGUID: b/qTPg0TQo+P7rCLj0X7hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78423276"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="78423276"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 05:40:35 -0700
X-CSE-ConnectionGUID: BXXN5/63SKSdg+HECAh6ow==
X-CSE-MsgGUID: 1zcOfi3ARPGwncWJtoHZvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="258150499"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 05:40:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 05:40:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 05:40:33 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.46)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 05:40:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0knrTj5GhP8bOtD4hYtX8EQj+rHF4R1JuNB8AFX3vD4tSmz1I8gMJH00e+QTxCvxSlEAMQyDtXWlWiUyba9dgbcDigFluWEbf+vbwKphTlX+fqqPunYwIuKhP1sg6Qz2Tb45g/ddjMxRMzmpIF3YKPCLd+nB105q93ATqWg9GfRzsaJEMM2GLPUwTfleYE8JJ7DZxqDdt1C3AgzM+DBdU3FLA7oHR1nu9rANpbZ8GP9zR3KDniTC5CtNHxnlaFbTYzKCj7YExeoGdHLlHdVboXyCH2ynBtgqaK2L1stzfU7zBTb0FCkJfUoU/TIpeyU+obPulgJ3YIQ3VvQnQN8Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1fvLJ5GkZJ9Sz8wiF/bfcZqxkWo0f+hXmUMHaxN2k8=;
 b=dzv/01V+36T6eFc2/vU/cK3uLuFqwKXrNZ+B4zLEg4hl1AGTHkcHfcNlPRRUjEEq3Q5NYB9oJY4yJzUQmCx1qqLWcqL0pyCu7NUkX0NXgg+liegu/3fy+GMtl4MNpk1DfZeYp82Rr0vX0nT4pS9RE3xqixT2dk4jsFtbrLe6kbQjHFDQdRf0eKFlmpG26owy+Ki7keykO4o2bU02hf1ZYdgtd14nFrYbt/Pv746v8NRWEdcd3Au6FOGYrTOxVXZk4jcrMqEpAlNCLNP/ZzIa4W63AGDQdrCPxfWZSt9d7QU+E2CdTcb/74SCH5j5TQYaoN+ttOPBem2f6cwHy9pQUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by SA1PR11MB6805.namprd11.prod.outlook.com (2603:10b6:806:24c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 12:40:29 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%6]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 12:40:29 +0000
Message-ID: <312e0a8a-309d-4409-99c2-1ce31792344a@intel.com>
Date: Thu, 30 Apr 2026 14:40:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_sriov_flr: Restore xe_vfio_pci
 module state
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>
References: <20260418102621.467394-1-marcin.bernatowicz@linux.intel.com>
 <20260418102621.467394-3-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260418102621.467394-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI5PEPF00000937.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::828) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|SA1PR11MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: c66e0f55-36a4-4e74-9b77-08dea6b5a8c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 6X7j9lGj8RZXa34faqkhYyGbA8QuHkX3R66UmatjsAwxuXSjV/Qd70FrNNs03kh1zDPD+BityQntVhAT48ZuM4EsM9zjIy+5ldq3J+ymGD9CDzmoxVXFGtia1CLv+2Gz1/+xh6n/0C4ULH1MxdVUkF+jDOHih7x/sqtfvxgvE8eIB8HE/C0K40hPtB0diR2AvmUw4Qdq5aoekGocfldd8ru0Tb1w7YJNQOg58wyB1akk51jNC56Xz7myg7/Bquq0pHBx8i++zFX3qLZd05j147I1y2dF1nnvBRGWWHVvh4L2sjy7zuIImKVRQ299L3tzpn87usPmT91yPhSF+BR9ybqVYS4uNi6FZ74/V9FdB/ukSeKJdPvJwPOsJpxHKGwkn1r3ulTAhIwoSewdwFDdVULGlVSjgFh/qNJkKzN1e7oJbq9mSZPLlyHpl57rbFFFUQXytmsDy0FugFmAZNeVjL2KvUZSzJGFwtccDpX/vA71MHjRjddtHxSBjkTSmFcB3SQUp4wUQVkNF77dTVOl234WUq3SyiDT46Cbco70PF6SHyhlwfGByU6T3+4+O7hSYAH1EKyMmVivhi301pElwErblFuGpPbGw7/3ltWR9ausdcnWjZ728XyezIVUmWkaWSn8UECXH0FiUb6oyw056VjmKB3rRXstaq+KSHpgJaq0e2erBxUrh1JdFBxJmiN1mGmIHpM+iqyBzGnViNs7VSSiSW44wTETCPgIoeeMj6I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1pLVDdOcCtRblVBWlV6dkI0NEdyMC9yY252eGRNNURJN1h3aEJQdGhIeVBl?=
 =?utf-8?B?UlRmOVJGcHdqbUQ1V3VndysxUmpRTmFjamRBOFhHaWc4b2dqbmxuNlRFRkh5?=
 =?utf-8?B?T1JwY2M2ZjVEdjFqRHZld09hRktuSFdCWVZtQVQ5V1NYYkVLdG14c1YvNUtv?=
 =?utf-8?B?RUlXYnFrYXZ6Umd1VllCaWlyRDQyaG91d05kN28yVzFHK1psbjhFTGtqNUN3?=
 =?utf-8?B?QlZvUExmSFlVN01NL0VITElaSjB4bkE5UGFERG5DV1dSbkY5RnllNTVlblZp?=
 =?utf-8?B?d3c3dkUzdEd2eGZrVVpqYUpEdkErZWJxN3RHclY3dEZsMHl5T3UzZ1pOVFBk?=
 =?utf-8?B?b01icTJWNVJuRmk0WEVieTJuTWRxbDBSYWlWLzhEWXJ2K2Q3WDFhbVhjL252?=
 =?utf-8?B?WGRIcE1vK1lmVFBLSWZGVmdSdThDVkRvRmZvdS9lUDE2MVZRZUppYjhjQ0FI?=
 =?utf-8?B?YjlISEFMQ0VheDZCRzhKRnlLRkx1QTdHNEhaZmFGNGx1bkU3MHZSS2JuZGJy?=
 =?utf-8?B?MW5qc3hmL2xoQ1kwbEREOWp5UFVNQUZMei9UMzJTMS9nSW9MOE9LOG9Jazdr?=
 =?utf-8?B?bjZHUGVUNzV1QUhjM01sN1RqZ2ZwQTRtOXArZkJhT3N3TkJROEk0OEZhTlVs?=
 =?utf-8?B?ekFxK2l5Tk96VGpTdjFjUmRnZ2VGTWlxVlJ0a1RyQ0lWL3k0UTN2RDh4K3ZH?=
 =?utf-8?B?aUQrbXVnaXFrVnZiZzVIR0F1L014bEE0eGo0ejg5d3YzSE9NUmFQRFd6c0FE?=
 =?utf-8?B?SnVjanFHWFdUY1JvMzEwbHRSV1VONE11ekxMbGZLV3crYXU3VnlhVzV4MjlQ?=
 =?utf-8?B?ZWVyWDR5TVpHc0Q1am1xZ2JQSWQzd2s4Vjg2aEJzYnhpTW9FN0kvbnM0Wlhj?=
 =?utf-8?B?RW5WN21hTDlQelhqb1VPQzRxcld4MlJ3UjJzMlpzdE5pckJ5NUFzeEFDNVJ6?=
 =?utf-8?B?eE8wQ2FBOGNmKzlEL3luYU9pQ3pWMjNBVURFRDEyQTJHNWFNMzZsUnB2UnlO?=
 =?utf-8?B?cHFENFZUY1Fxd2tEdmJlaUgzaSsvS1o3dW1XRU4xLytPUzdadnFpOHloSmZ2?=
 =?utf-8?B?bEhpS1pUbG9zc2xMOHdjSnZOVmZoMEVrNnNJbmNQTURmMml4NFJMdG9TazBs?=
 =?utf-8?B?RkhtY2ZzcVZadUZWRUU2SzlhT2FZMTZkWWZyMDJmYk5iUmpNYVYrTjRDbS83?=
 =?utf-8?B?czVJSjBmalE0NjlJRmVQZEV3bUlNekJVd2gxbVVDRmNyK29FRWo3WTM5WEkx?=
 =?utf-8?B?VXMyRFJrd09FTEhUZ1ZhTFF1aW4zeXRnZlIxNHZMc1NycGRNdngyUFFWQU5P?=
 =?utf-8?B?QW9CTWd1TnBlMUFLeEhUbGRoQmxJZDVFeFZ0U0N6N0lxa2RmZEFyR1l6MGtS?=
 =?utf-8?B?SHVndjdXWlltazRGRHlJRkoxcEVVSGIyYW1TSkh4Qk9CeUQ4RXFVZy83M3VR?=
 =?utf-8?B?eXpjcEkzQ2h5NHRDRzBITlR3VmF2UkhaaW5aWmtGMnZFTnZOSWR2bER5eHdR?=
 =?utf-8?B?MVQ1YnVDbTBIYzExWGlabE1meklwUFNKOEVLV0cyMmNpUXJhQW9vZ09LUkFT?=
 =?utf-8?B?WEhJaUN2VmpINXlsWUptTXRoRldKWCtTWVdvT1V3ZGJheGR0SU50K010NmF3?=
 =?utf-8?B?dGYzZ1BZdmM1WHJpK0hta3d2Uk1lQkI1Q090M0lidmZVWDM3UUlDOGFYQlU4?=
 =?utf-8?B?cDFhaUFFMUhUVWdXNnFnbEhkWGIyeUFuWDdJOTJCbW1DVzJOOGtUUHg5T3Rz?=
 =?utf-8?B?M0hHeVNWdkl3QXZmdjY3bnBUeW9BbVgxODVDNlZ3ejJIaTExZTZQdHFjVk5o?=
 =?utf-8?B?TWZTS3Rnd3dQUWV1cHJHN2xJSjcyeVJ6M1pWQURZcFN6NENJREZHYUtGNmJ5?=
 =?utf-8?B?cCtKekI5RFA2RG5HbzF6TDFOdWdmWGpLS3c5NGNMS0R3K1R4OGRyaElDUS9H?=
 =?utf-8?B?VlNleFY5N1dsVVMvdkhqYXo3VHJTbk1FNzBMa1BWaUhtU3RRTWVHd1ZLQ09R?=
 =?utf-8?B?RXcvcGZOTDdmR1JXV2VMUWZscFlqRmhzeTQyN1dEOG4xRm41cVpBMWN1U1Av?=
 =?utf-8?B?R2psUHQzVE9TNDhZNE5xWnlPcWtXRkJ4blhkTzdyRjlZZG5WcTFDZ0F0UkhK?=
 =?utf-8?B?b05OSzFXTXNZcWVYdFE4UDk2RitUcDRSYmluNTlGK2M0ZnFqdnkyT3A4blhZ?=
 =?utf-8?B?aTVnb3pPaFIreFBTdW5KU2RwSXVUbmhObkExeURvSWp6KzllT05ZUHhnTnc0?=
 =?utf-8?B?QnYvTnBxSmVrODhxNXJXM2MwNXlienRkUXVxNlgvbnc2dlQzWTlWaldIL2lF?=
 =?utf-8?B?WEUxbUxDMXpNaUxROW9NUXMwTHdITTk2enMydVY0RWhxZFdvREQ5UT09?=
X-Exchange-RoutingPolicyChecked: DWUU+IV2DAufJyCca5eTGnVuLBVEhNtkdfQsj0nBk+Vbh0fdH0jc6sNJdAhKpMzau41toKx/PC0ocryYVlcJynq1xP///17C/wn0zA8z9mUKW7TTPFv0VlMeuX2LH41ChZiRrfLxpHB8a80Ab1YXMmHS/uwqxPjAxHgiLGScv0lHD3MzK0whxOGQ+DLkW1CB1dRJMorNbwzDdfda0hkwvUIIGkINssSlG8syAqs9Aq2HXGhxC2iGPwr3Nw+RNMlLDVjN2AT+3SVSVqlp13Ps3lctLrBipY0qfrfipgNO8B1YRm9eERWpKdc9Z/fvwcVFxVCh2xx4890qc3IBK1jO9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: c66e0f55-36a4-4e74-9b77-08dea6b5a8c3
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 12:40:28.6961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkTJSh0UpJIqo/qqA6MTiY2Cvcdvq43c8HMapAQiHceqgx4kJvAzQJVcDRGxOJm84PDm7FGVPlhjT8GBrZViDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6805
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


On 4/18/2026 12:26, Marcin Bernatowicz wrote:
> Record the initial xe_vfio_pci module state in the test fixture and
> restore it during cleanup.
> This ensures xe_sriov_flr leaves xe_vfio_pci loaded or unloaded exactly
> as it was before test execution.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   tests/intel/xe_sriov_flr.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 370cb8e1b..d4a7a7498 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -81,6 +81,7 @@ enum vf_driver_mode {
>   static int g_wait_flr_ms = 200;
>   static enum vf_driver_mode g_vf_driver = VF_DRIVER_XE_VFIO_PCI;
>   static bool g_extended_scope;
> +static bool g_xe_vfio_loaded_initially;
>   
>   static struct g_mmio {
>   	struct xe_mmio *mmio;
> @@ -460,6 +461,29 @@ static void cleanup_vf_driver(int pf_fd, int num_vfs,
>   	free(binding->vf_bound);
>   }
>   
> +static void restore_xe_vfio_module(void)
> +{
> +	bool loaded = igt_kmod_is_loaded(XE_VFIO_PCI_MODULE);
> +	int ret;
> +
> +	if (loaded == g_xe_vfio_loaded_initially)
> +		return;
> +
> +	ret = g_xe_vfio_loaded_initially ?
> +		igt_kmod_load(XE_VFIO_PCI_MODULE, NULL) :
> +		igt_kmod_unload(XE_VFIO_PCI_MODULE);
> +	igt_abort_on_f(ret,
> +		       "Failed to %s %s during cleanup\n",
> +		       g_xe_vfio_loaded_initially ? "load" : "unload",
> +		       XE_VFIO_PCI_MODULE);
> +
> +	loaded = igt_kmod_is_loaded(XE_VFIO_PCI_MODULE);
> +	igt_abort_on_f(loaded != g_xe_vfio_loaded_initially,
> +		       "%s should be %s after cleanup\n",
> +		       XE_VFIO_PCI_MODULE,
> +		       g_xe_vfio_loaded_initially ? "loaded" : "unloaded");
> +}
> +
>   /**
>    * flr_exec_strategy - Function pointer for FLR execution strategy
>    * @pf_fd: File descriptor for the Physical Function (PF).
> @@ -1339,6 +1363,7 @@ int igt_main_args("ed:w:", long_options, help_str, opt_handler, NULL)
>   		igt_require(igt_sriov_is_pf(pf_fd));
>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>   		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +		g_xe_vfio_loaded_initially = igt_kmod_is_loaded(XE_VFIO_PCI_MODULE);
>   	}
>   
>   	igt_describe("Initiate FLR without any additional state checks.");
> @@ -1390,6 +1415,7 @@ int igt_main_args("ed:w:", long_options, help_str, opt_handler, NULL)
>   			    igt_sriov_disable_driver_autoprobe(pf_fd);
>   		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
>   			       "Failed to restore sriov_drivers_autoprobe value\n");
> +		restore_xe_vfio_module();
>   		close(pf_fd);
>   	}
>   }
