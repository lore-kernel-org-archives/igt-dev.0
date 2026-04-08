Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD257FD5F68
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 04:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176DE10E430;
	Wed,  8 Apr 2026 04:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LU9XMk14";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBCA10E430
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 04:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775622924; x=1807158924;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=dnYjpRpsXbv4fz2eP6dt6MRNni4GLZgtBwz8pTtFbJo=;
 b=LU9XMk14xeyJR2cBFM5BloUFVBcbWVfQqpgy7ovhA5ApIZZ4CY0Ee/Ng
 0FFxRqdHXokIiBoX1f4vfdl0Bd/+rf4wrzPIvUOoUKvd1edtANMNpZ123
 AtjVq9vFVQWyflhlslVJV/ESTIkFu5JCsF8+R/Ub6eBiXoprxzpQEddRx
 KJHX9yjHLo9rD8I/Sor75AaEV7meYitnDYjhqp7T8pjQWttEjdeCR417N
 NbUbyvCkoeKhX23NcPB1wiDmRSMdM7POoMWdk+toxgjArd82evN0ZAYm5
 xYx8LA2Bv6Ez/1Oa1IMwo/pNEN54ctz94kjjVXvur5EWsBL5SlIBvavPT g==;
X-CSE-ConnectionGUID: r+tbj0Z8SNOh6CekghCc6g==
X-CSE-MsgGUID: on2Zqv3QSuiDav11NDoMxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="88050164"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208,217";a="88050164"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 21:35:24 -0700
X-CSE-ConnectionGUID: HoSeA2anRA2PfWGR23m3Mw==
X-CSE-MsgGUID: O4xkl2xsTEGei8+ddAa5VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
 d="scan'208,217";a="233318607"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 21:35:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 21:35:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 21:35:22 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 21:35:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZXUTISyoMQ4RDvaJFKtzCxBUzx/yo9mb8Q6cLMbo3sJZMUJ55QW80yRHb219/fFYxVbzIn2W1Ft8AuojL7N8L/MSIdiifnuG0/rqGUXoii1uiLjlSBKnAAUTPFlqjGIVlGcy9urnF69NZ5lixjx2q7EDzl5cpQIQ+SARNw90LpgIzDhuUFoCh7ZPrVhqM7wwW89Fkfw4QDFBeC6fM7IE8YIF13NkLncaDWyXYqa3A8WMrZJX7meJlKG94qpvosSUTz5qAMLpX27lqW55O7p7wD7UmltW7NhE2MkWk/mIDqx7ByrDOndlv+dEDBkum2npLsznT7kRgXaehkDgWiJVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HA3VOjbr7D834SuJA84RWDmiRiruCZyGtdP0rRKE1M=;
 b=XvE6d35ShACMu4aHbSnVzjJ5JKsV/iobhhUf6ZAUTX3oJqmrAv3zOVVoIDjT15ar6W6JkbG9sxft1hQUxDur/H/PYmN1yDn1L7emlK5QETWyS3XYo0tIIhXpJfILy8DScXM0Ly0hF22Bu+G4ZWFhP5CRyab7jIXoRePp8i5vT/nD0CtSWAeySJIuKgyOWRVpXJT4IF1LtIC5psf5czvQalO+ph4w1Mw1BWLDVn7RKnSKJJxAhR5/mFfZDYhbvrED6xD/+OkBkcXPHyk6hAWIaj/NTB8Ha+2cMIzrHCMv+FeFprjG08rB3h8QwdG66hU+Gl/cxkUMfZiyaA6vDwke7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by SN7PR11MB7568.namprd11.prod.outlook.com (2603:10b6:806:34e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 04:35:20 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 04:35:20 +0000
Content-Type: multipart/alternative;
 boundary="------------GWeRSyD0iTdsuw80iab3CafI"
Message-ID: <a71fdad8-67a3-4283-981a-1de57c737e1e@intel.com>
Date: Wed, 8 Apr 2026 10:05:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_pm_backlight: Setup output
 before reading writing backlight
To: Karthik B S <karthik.b.s@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20260331073400.1316874-1-suraj.kandpal@intel.com>
 <20260407054302.1454584-1-suraj.kandpal@intel.com>
 <c8eb555a-e7b5-49c6-a42d-a1602a39380c@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <c8eb555a-e7b5-49c6-a42d-a1602a39380c@intel.com>
X-ClientProxiedBy: MA5P287CA0211.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::17) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|SN7PR11MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b388b3-44cb-48af-f9db-08de95283d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|20052099010|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0s4fypJVIYUaq3oVSWJESU1dZaKCQkm6iIxkjtn0nsQMIAEAYGQFb/xCLJjhUHc2wg4ptLCcSf5jaNF8dPCAMBznJYrcCUIouzBJ7MiSg+ERVdoOysvlbbGFN0d+t8J7h5FOSSBM0TUwCJm3A2vSm0MyOfsUGnxvJAjFYiKANd8SXVCIfCc3L9W7GOPhCZ+WWd8hIpCMhSaTL1JbySRaEEEnFk+Bj4HDil/Isi1+AuaQE9ad0elsxW0RdvNR8khHCCLkqtyEcOhs4yQVO5u1UurMrJMFz5YGUtSUVg3+53g9kvOwUFm4l9sX+UvJjoXcgw8rGYsQfchnsrfy5WOSWAiwQkl7cTxbn25zAbV2KrEW9pgCj7kyn+PJjl84oxi3DwC0eOQcbDV49Ub5wZP3JGfHw/JuUIpgSmxjYisY4LENmcn5/zP/aN4MhVWeFeab0nItk6lb9cquOOoABcbwLvOPAoYjw/KNyx2BZng20clMkMjCZ7+gtcGG+SIvez+sn8ZFQfbU5oNYtJcnSntYP80buHW+FNNtgG1bkFO26Y6UOCgVea8P69b8f92QMvNC/YUzADauHiLfyXHl94msepw/fr6B6SVMdUcO9gFiDYTBQ8tUASKYr8yNIUcG/9OOQm0FzPoIgGCtdyCVEviM++cTidyVirrg2/cdK05uNbU3pHuFv679LE/od/e/MZ2+vlxloT53N3Awk77UtNiX+7QIvNrukKymGfqsZrnnbXc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(20052099010)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG1oUGlhNE1JNnVaZFdDdnorRWdzVXFXTU1NSUpnaVRjRGcxbDBoblNML0tR?=
 =?utf-8?B?VnZBcU5ndC9DbTd4UlZmcVdMeDE4TjRtOFVab2R1a3Z0bWFQZUtLV1ZWaG55?=
 =?utf-8?B?b3hlbUJhSlJ6QW9CU05VaVljK2czZDVuVm9JMzdiQ1hhdWQ2bTVYcXVLaGxa?=
 =?utf-8?B?SnpJL05tTmc0SUpDNzJCWWlSWlNJdUkxTDdmTEd0bUEzTEh0b0NGN0FDMUFu?=
 =?utf-8?B?UmlDTjlWZHNEZHlKbkRWMkRMTjZuSFpMSGJ0OTdVbE9FV3ZJNnVRTHEzd01O?=
 =?utf-8?B?TjVzMSsyZmlVZFM0djNiSEIxemR5bE8xVFFHL3hlSGhYV21zQ01SQnlWN2V4?=
 =?utf-8?B?TnlUdHFVOUt3WWxQU3c0T09aZFdOZnVKNUMyZ1l3dXA3bGJ5UFlEdG1aNWYy?=
 =?utf-8?B?QU9rWUE1MlBhWVZxem1NVlRXVlYrMVFiYW04aG1jREwyL2xJU2llaWo5TzRk?=
 =?utf-8?B?ekJndXpxNmNtbm9VYTJOdFl4dEsyb2thWndpUVpHZmxyWXFhMXUzdXl5bVUx?=
 =?utf-8?B?OXhka0V2eWQvcnVDZ2lDUzgxOGtqV28yRHVnL2RXc0l5elBZVm54bzlPQUND?=
 =?utf-8?B?WGwvdG5QanRkZWFqdjlVdVc3MFBxTlR6Y1REdW9VaUhjTkpzYnhqYzc0RkI3?=
 =?utf-8?B?UG9rUWJhNlJScklwVDBGbllYYUl2cnJ2NlVIaFFxUnhJMHViU0wvWW1OZjQy?=
 =?utf-8?B?RlY5N0FGTW9xOUVmQklHLy9nRlRFM0VCb21WbWJSbkdFbjR4VUZjMC96em9r?=
 =?utf-8?B?QTAxbmt3WnNmVmJCbkRsK0ZWK2hIRmJ0WUszTFg2QWhOSExKT2ZrU3ZYbVlK?=
 =?utf-8?B?WCtqcEFHL3RWckFvSU13cy9BZEozS0V2ZjN5UHMvamFWUHdzcDc5LzdqSlFL?=
 =?utf-8?B?cnZkbkpqaVdoZCtXWTlBeUdPSTZWSmtyS3owM2IxR1lSNTR6dlFrL1U3b09U?=
 =?utf-8?B?cXhCcy9SOGZ0djM4KzFmS2I4c0tteHFqUkUvRFo1VmY2SzM3YTJoWEVhbmJv?=
 =?utf-8?B?eEM1L0JHZURzc2plMkYwQzgraCtROEpPQVMybEtKVXR2cmtQdU96bklzNlFU?=
 =?utf-8?B?RGw5UjMxVlFhMUhoUHhGSUlicVJ3M0dubEMybTBLaFh2TzNzOVpDVDg3eCtY?=
 =?utf-8?B?Y1VoTmpjNEIvVkxJaXNveXZrblhOb1Jac2NzbkpiZlJUSnhLNXg3czBkR1Mx?=
 =?utf-8?B?VmNhNVVWTEVVdEdXSXpOd3Z4V2NhcVdva1pGOHBaMjllSW9Vc2FuMXFOY1lu?=
 =?utf-8?B?TnVsQXg0c0lsejJYTjkxakNzS1l3dE1ick43d201NlJXbkIvc3lnUG45NnB1?=
 =?utf-8?B?ZEFPNHdZZTI0OVVOZmh5K3lnNnZqbFFScDhRT01UVGFmRmRKTXJIM3pSQkxi?=
 =?utf-8?B?aVJ0NmU3L3QvN09FVkxCSFo0Z0JtbEhxYjhsdTQ2WFFKUllqLzFuSTRTUFkx?=
 =?utf-8?B?ZWg4VnV0WkJxcXhQUWQ0T2drVlNSTmlOeXcvaVRFMVpidGxCRVh4SG81SWFI?=
 =?utf-8?B?WFRXaVd4UmliTlB6ajBtMmpYUTZIMkx1cDNzQnJkbWkrVWcyY2ZDaUVveGZE?=
 =?utf-8?B?dWJHbjZSUTRPR2NQV2FFbTM1RVhOc1QzWUdYZ3RBSGc2aHlqTU80YmYxQTVa?=
 =?utf-8?B?T2R6M24vb3N4bVBpZ3kzcTgwaDFaTUZHVXFTNHJ0S0c4eXpvWHlWYTdaM3Mx?=
 =?utf-8?B?bVBVMHpKbGw4U2kyZzdQZENJeHRIcTZYZHA2MTc2cC9kTUJERUpoUDdWU1Vi?=
 =?utf-8?B?aExrTjVRSi9WRjZkdk5zWlRMQUVySmpDS3NHSW1VTXhremFzQmZ1UXQwc1Rj?=
 =?utf-8?B?U0g2VnhJa3JFT2J1TmtORnEzNjY4cFpJWWN0bzUvZFhZT2w0bWdqbGM2aGds?=
 =?utf-8?B?UHFpNjRhVmtMa2lwZ3lqSXFZaFRZY0hDeE5Mc3d3bzVEcEF6K0tLY0J3TkRK?=
 =?utf-8?B?MTJwZFB6WVFXM1JXUmpSRmdVRDJBL21vRW1Xa3BtQURYdHY1WXJ1d2dYRDA2?=
 =?utf-8?B?UEdBMGZrL1M3R3lheVcxSWNuL0ZtZXdib0h5Y28rS0sxTDJnWCtxQ0RFYTJx?=
 =?utf-8?B?ZW9BVUxqQXFrR1JXYTBGTkVOcGVvYWFmZU90dFQ1U3gxN2ZsamZ4WU1ESlNW?=
 =?utf-8?B?a1JsR0Q2alpEZHN2R3JJOUdUL3FWZjluQkpSMWdIL21NU0RaR0dBN3JWNjlp?=
 =?utf-8?B?ZENnd0JsNTA0V1FhLzhubDVyVmFnYm92bHFkM0JhRjZQMVhxN1YxUjR6RktB?=
 =?utf-8?B?Zm9XOElnWjhROVB3TG92S294clczVzRGOCtLWnJOTmhlZ0o1NnVMNVJSd0Np?=
 =?utf-8?B?MGdPY0U1QXpBV1g4aTN3MFl6S1FnUVNSNjEyd0Nna0FCVk81ZER3WXRqZGJj?=
 =?utf-8?Q?aaoKdzVQFyd65gJk=3D?=
X-Exchange-RoutingPolicyChecked: ke+qGKCxn2WlD7GkK+ZPlPNGjSw2XSuRZs6fnKTvay1Q3bm0qLHs76GVZSw27+DeaOXJGSojd3X7FzKMtsdklp58WYy7xCCHNdSXrjCXCaoIqVm9NqriFXd1a/n7Ws/PTWiblEa7ZWFHo2nKsxaG39mf0WM6oJIqVOLAZbti89G+qRRDHHV2NHF1j6dTE5d9dl5K0w7c200bXqnHI9BrjAwGqtK37AALWO0pGLuLbcFvHSWDr8Q0/fHvm6O3/Pwl6eRFb+/fQTKZ0x3u7uiWf4fgMrZ/eLhzuPR+VKS+l4ny8X/yAJwLKHQeh+EUUsSYJik4+2haaMva38D++k9VtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b388b3-44cb-48af-f9db-08de95283d91
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 04:35:20.0765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxTLxOlvfSRWGVrpjd/nq0U7sx2hxUuzH26luicnVWhlFYa5ci2NV/iGrXCrxoM870R1xW9LywucsU+uYqcvrAXnFpBN7eftE9fPvT4Sfks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7568
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

--------------GWeRSyD0iTdsuw80iab3CafI
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Suraj,

On 4/7/2026 1:47 PM, Karthik B S wrote:
> Hi Suraj,
>
> On 4/7/2026 11:13 AM, Suraj Kandpal wrote:
>> Currently many pm backlight tests assume that panel will stay up until
>> unless we tell it to go down or AUX transactions are happening.
>> That is not the case, some panels when they detect that there are no
>> changes or commits going in, it will go to a lower power state. This
>> causes issue in this test like AUX suddenly timing out (mostly in
>> fade tests where each backlight change has a 10ms sleep and many
>> steps giving panel to internally go in low power state). Also since
>> changing backlight has its own interface it does not count as a commit
>> hence does not contribute to the panel staying on.
>> Also trying to change a backlight when panel is not up does not make sense.
>> To solve this setup the output and do a flip to make sure panel is not
>> down to simulate a real life use case on when backlight is changed.
>>
>> Signed-off-by: Suraj Kandpal<suraj.kandpal@intel.com>
>> Reviewed-by: Karthik B S<karthik.b.s@intel.com>
>> ---
>> v1 -> v2:
>> - Remove setup and commit function from check dpms as it is not
>> needed there (Karthik)
>>
>>    tests/intel/kms_pm_backlight.c | 20 ++++++++++++++++++++
>>    1 file changed, 20 insertions(+)
>>
>> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
>> index daa70c716..f108e8387 100644
>> --- a/tests/intel/kms_pm_backlight.c
>> +++ b/tests/intel/kms_pm_backlight.c
>> @@ -84,6 +84,24 @@ enum {
>>    
>>    IGT_TEST_DESCRIPTION("Basic backlight sysfs test");
>>    
>> +static void setup_output_and_commit(igt_backlight_context_t *context)
>> +{
>> +	igt_output_t *output = context->output;
>> +	igt_display_t *display = output->display;
>> +	drmModeModeInfo *mode;
>> +	igt_plane_t *primary;
>> +	struct igt_fb fb;
>> +
>> +	mode = igt_output_get_mode(output);
>> +	igt_create_pattern_fb(display->drm_fd,
>> +			      mode->hdisplay, mode->vdisplay,
>> +			      DRM_FORMAT_XRGB8888,
>> +			      DRM_FORMAT_MOD_LINEAR, &fb);
>> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +	igt_plane_set_fb(primary, &fb);
>> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>> +}
>> +
Ensure the framebuffer is destroyed once it is no longer needed.

Thanks,
Ramanaidu N.
> Sorry missed this part on rev1. Instead of creating fb's everytime we
> could just create two fbs and toggle b/n them. Also remove the fb after
> the test.
>
> Regards,
> Karthik.B.S
>>    static void test_and_verify(igt_backlight_context_t *context, int val)
>>    {
>>    	const int tolerance = val * TOLERANCE / 100;
>> @@ -133,10 +151,12 @@ static void test_fade(igt_backlight_context_t *context)
>>    
>>    	/* Fade out, then in */
>>    	for (i = context->max; i > 0; i -= context->max / FADESTEPS) {
>> +		setup_output_and_commit(context);
>>    		test_and_verify(context, i);
>>    		nanosleep(&ts, NULL);
>>    	}
>>    	for (i = 0; i <= context->max; i += context->max / FADESTEPS) {
>> +		setup_output_and_commit(context);
>>    		test_and_verify(context, i);
>>    		nanosleep(&ts, NULL);
>>    	}
--------------GWeRSyD0iTdsuw80iab3CafI
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Suraj,</p>
    <div class="moz-cite-prefix">On 4/7/2026 1:47 PM, Karthik B S wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:c8eb555a-e7b5-49c6-a42d-a1602a39380c@intel.com">
      <pre wrap="" class="moz-quote-pre">Hi Suraj,

On 4/7/2026 11:13 AM, Suraj Kandpal wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Currently many pm backlight tests assume that panel will stay up until
unless we tell it to go down or AUX transactions are happening.
That is not the case, some panels when they detect that there are no
changes or commits going in, it will go to a lower power state. This
causes issue in this test like AUX suddenly timing out (mostly in
fade tests where each backlight change has a 10ms sleep and many
steps giving panel to internally go in low power state). Also since
changing backlight has its own interface it does not count as a commit
hence does not contribute to the panel staying on.
Also trying to change a backlight when panel is not up does not make sense.
To solve this setup the output and do a flip to make sure panel is not
down to simulate a real life use case on when backlight is changed.

Signed-off-by: Suraj Kandpal <a class="moz-txt-link-rfc2396E" href="mailto:suraj.kandpal@intel.com">&lt;suraj.kandpal@intel.com&gt;</a>
Reviewed-by: Karthik B S <a class="moz-txt-link-rfc2396E" href="mailto:karthik.b.s@intel.com">&lt;karthik.b.s@intel.com&gt;</a>
---
v1 -&gt; v2:
- Remove setup and commit function from check dpms as it is not
needed there (Karthik)

  tests/intel/kms_pm_backlight.c | 20 ++++++++++++++++++++
  1 file changed, 20 insertions(+)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index daa70c716..f108e8387 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -84,6 +84,24 @@ enum {
  
  IGT_TEST_DESCRIPTION(&quot;Basic backlight sysfs test&quot;);
  
+static void setup_output_and_commit(igt_backlight_context_t *context)
+{
+	igt_output_t *output = context-&gt;output;
+	igt_display_t *display = output-&gt;display;
+	drmModeModeInfo *mode;
+	igt_plane_t *primary;
+	struct igt_fb fb;
+
+	mode = igt_output_get_mode(output);
+	igt_create_pattern_fb(display-&gt;drm_fd,
+			      mode-&gt;hdisplay, mode-&gt;vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR, &amp;fb);
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, &amp;fb);
+	igt_display_commit2(display, display-&gt;is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+}
+</pre>
      </blockquote>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Ensure
        the framebuffer is destroyed once it is no longer needed.</div>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><br>
      </div>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Thanks,<br>
        Ramanaidu N.</div>
    </div>
    <blockquote type="cite" cite="mid:c8eb555a-e7b5-49c6-a42d-a1602a39380c@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Sorry missed this part on rev1. Instead of creating fb's everytime we 
could just create two fbs and toggle b/n them. Also remove the fb after 
the test.

Regards,
Karthik.B.S
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">  static void test_and_verify(igt_backlight_context_t *context, int val)
  {
  	const int tolerance = val * TOLERANCE / 100;
@@ -133,10 +151,12 @@ static void test_fade(igt_backlight_context_t *context)
  
  	/* Fade out, then in */
  	for (i = context-&gt;max; i &gt; 0; i -= context-&gt;max / FADESTEPS) {
+		setup_output_and_commit(context);
  		test_and_verify(context, i);
  		nanosleep(&amp;ts, NULL);
  	}
  	for (i = 0; i &lt;= context-&gt;max; i += context-&gt;max / FADESTEPS) {
+		setup_output_and_commit(context);
  		test_and_verify(context, i);
  		nanosleep(&amp;ts, NULL);
  	}
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------GWeRSyD0iTdsuw80iab3CafI--
