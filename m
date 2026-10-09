Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4295ACA601E
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 22:56:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25D311230E;
	Fri,  9 Oct 2026 22:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6fAdyuc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC13811230E
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 22:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791586533; x=1823122533;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mLd5otdKm74mjjH1ddL5/oU8Ev7wv5YgO+rg2R+s8v4=;
 b=F6fAdyucN8n8M/MkUp6rpz9tZmxJgQMbWu0MxDv/V/j4IZIeaPmEDK8b
 xcbfsnc0M0iEafhtfgcratjE/NqCIJvau4oaRTZP0bdDhExc4hFuOcNGp
 0xT1CCo+pvsvQ5oxPKaN65vVGbmmKrL6zyUMRWwnrQmneCa8gP/6iwoKa
 7ROUWM/VgFYjJbn3f2TMsjr8spknIhgMAqqzy575Z6/+mGVlwy/wob8Pn
 +BOv69sbolQcIprhws7u3ZFnKtsn3JY5HuswpV+s8qrdPqzSlThEK0yBo
 /k6cVFukH46wo/ecfFMQASrw0x9EHHY1BH5gAFkfw3qV46swiLAytlkeK w==;
X-CSE-ConnectionGUID: uaKA0e1jQryVNRWKb1St3A==
X-CSE-MsgGUID: Hze+hqjmQpaFlnbO9qPWOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="401346"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="401346"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 15:55:33 -0700
X-CSE-ConnectionGUID: aQtGooEZS1aStChRXzELng==
X-CSE-MsgGUID: CfhS89O2TWuYnTJiw2p5oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="607829"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 15:55:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 15:55:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 15:55:32 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 15:55:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdIOY9+/TBHf13Z8sgQVcCTimNnAfAvHlCeVyphf9ShVhNZibbXlWq7J6v2hNWh8DT4JU5FowfsMSTrDVWojyHXpWPJdM+Abj3/OonvaXDJenIXyMDd/LUGdrpaEd3o8+luViDNwlsk9y54o3CVtV6DO+44x12066RvPZNslf+f2sxpnHEZ+4uUU1J3S2SeddaZygRhq4r1+EbLdYwAzcESQ10FJaFQaBFiA746dBiKYkYviLNyFINpXbCVsEeRu3GgM+TcLLhYR3Ek2B0TQFsN4pgJWfBQNbjrZapXY+PdiNn5EJ4cg9sDr25rNkXG0nnPL4bKcu3cQOrSEk4GM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiivAHCxoGYmb7d+gky6V9JQuVVt5YCzgLRgNqvymIE=;
 b=NCSwB0ukrHFxR1z7/n0cxTHwTv1hyYn7jCcR6zgljB644gcgFH5Ij+0ezc9YZozd7uwnrDyzp5sBlHuf5pPxcfJ0AQFDLS23nsfgnM9ss5sm+yPhZodWv4iUxOHZzf/LUmJlLiXMOjm+7L23IziczTmh0Tm5JxCf0f2O2lDAE0xh/kmLOFo0HGyrTtK3aAXIka6Ps/0MNHmn/y6Ea79eHsXJAOhDW5Yigs7jXv80P/arGj9SBeVv9XfvjjUs8A5zx+ZdlsKL9NHsKGiYBa2ubM9uPAAqYnnFx4D6a3DLxWJWqVHMgWPVd/2KLS2h8o6rJ648TO6r2e5Zy2AWu9o8yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14)
 by CY8PR11MB6938.namprd11.prod.outlook.com (2603:10b6:930:5a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 22:55:29 +0000
Received: from DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429]) by DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429%5]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 22:55:28 +0000
Message-ID: <583c175f-9c84-4069-93f9-ec1a76cafd67@intel.com>
Date: Fri, 9 Oct 2026 15:55:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,1/2] lib/igt_core: Check if helper proc was alive before
 kill()
To: Gustavo Sousa <gustavo.sousa@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20261007-stop-pw-reserve-v1-1-abbd3b879612@intel.com>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <20261007-stop-pw-reserve-v1-1-abbd3b879612@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:303:b4::30) To DM4PR11MB5232.namprd11.prod.outlook.com
 (2603:10b6:5:38b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5232:EE_|CY8PR11MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: e39d7cc1-14d4-42a8-81f7-08df26586a03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: w4Gi4SIc/jCgovUCnGN0tIi246nFs2Kn6eeARKqv5/XGslfs57khFKec480N/gidjRA8NVgP4QGzbdOcMHGpLo4e759lKhjpwzVidY9BHlBOz+B+ocfGlW0S5LTXx3wTMRKwcQLKebCdSta5O5l37ED11nzQ22pVM+ARW1ZlvJP7TeDkZJ0Hfi6VjxaU9HzDACopyC5DgJ0iDkHQ1LpFm+y5PeRJr7xxtMML+ZvRNs8gJfIIjUo5nxlwPaLrYQT6wHuL59ECyORQU48BiZYwxV8U+XHpmqWx+09TfckRo7uifTsFwe7h1S6snYsmF+3Jz0WnoDgZDbSKopXCKobrbiX7LpUBfZcfEXxn5HYKEkYavDiuJqJAFeMPZ9zwxfkMSF5caE39kATLG8mpV/KiPBIrbEGOjWaOALkF1AVh8NSNsTkphgwpHvU387nFuVWDp/pqYkZVszgaWm3khddoVoXeWyHo2mvppGxD8Sf7VcJ/29Tk5VSzs4i2bM8fgvxeafwJtgytNRSxEcNPMzEoo/4LiVEeuRW7AOJh+eFKtHlE/wBKUzotfHbqdAiWH7uNGbZVWPBDQfYe4ntpzK179LqIFh2OCVpgpYjxXpJYybjcrRAoF/F/oUIeYbQt/FeDyGMc1Z2l0/mj0QpRRh6JxN2UHMJFlyrkG8WMEaUt4KI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkZoVVZsNnhMczcyYXZ2b2Q0c01oU1BpUnZaSGJDbWx0WFJmTzVlYnA1ZzVN?=
 =?utf-8?B?QzZ6QVQydnNGbDJCUmVxRFJVR0d0K1hrUWNQeDlWV1RSYitCVDZwVFZTdTNL?=
 =?utf-8?B?SU9pWDhKL1IybGZIcTZKMGJreHZ3dVgyWkVlUm95UHowRnFkZEdQSWlYNkpK?=
 =?utf-8?B?aU1QM0hXMElYVERuYUp0TjJWUDBCOGtEbXlmbDRyVW8wQ0VwVnQ1L1RGR291?=
 =?utf-8?B?d0VwQjZpVXFyUG13Y1hIcjI4L3RJRVlIZDlXTFNrekVvVWd5U0dGQi9aMktK?=
 =?utf-8?B?YzJQYWpJTlZvK3hNL1Boa1BHRXVoRnlsZjhCaDRodWlGRHRabGFvUDI2dTVs?=
 =?utf-8?B?TitPcUNzNGkxTkpuNHZXRG5ZN2dNdWVNbU14b1NjR2w0OU05YUxKNEc4SUwv?=
 =?utf-8?B?SzVJQzQyeWRBZ2R0YWgxMU15MFEydEJnT2dvUHI3YXN4Z3c0U01EZnMydXd1?=
 =?utf-8?B?bTVOWmhGakd6UGxkRzlOOUZ2S0NYMXpTU3Jsdk50ekp4QUgzTXNVMGlXSW45?=
 =?utf-8?B?ZGlRV0syNTA5eU02WnJLSVNjUnlMZkpnWjhxMDQ3c1pKZWw2b3FvbGlld1cz?=
 =?utf-8?B?WmFxS29Cb1UwK2RsL3h5dldzUjF4UEZCZVZGS0FOclY1dElZVWVKUjJUUDRz?=
 =?utf-8?B?SzJQbGZ5R2RtTXBWQVFWaTRBcjFPb25ham8zRUVuOUR4aC9xQWc3cnJKdmtH?=
 =?utf-8?B?TEQ1cjhYRkhrUHN1TitVUkpVQkk0SGx6bHh6ak94Tyt5NFhMR1NPQVVyRnMz?=
 =?utf-8?B?T25BMGhvRFUrVFc2WHJydVluSmY4L1poUGg2K1I4Z1oyNkczYkpUZUlwUmtH?=
 =?utf-8?B?cEVEbllJUGs0T0JNSUVNY2VYZy8zSjVPM3BHWWt5dHIrUEwzcnZkZ1ZFZWhD?=
 =?utf-8?B?RFBKVWI0bnZ1MEl2YlUyMG0xVHYxVWNYdkM4cGJ6ZWh3cEJZcmJkOTh0eEVX?=
 =?utf-8?B?MHdpNHVkZ0VlY0Q2ZTg5RC9jblBFN1pFM0xiSkdJNHZkbkdHVU90Ty85cHh1?=
 =?utf-8?B?QmtZdDZyNmRJUkVZUk1DNU93VTRYQTVIQkR0MDBLbk1DeSs3ak1tRkdMNzBn?=
 =?utf-8?B?SjhaM1RxOHVDcTlDSW9XZVVHRFE3Wk0wOWRBOTc1di9FamN2M1k3K1NWS2FD?=
 =?utf-8?B?dFpEOG0yaU9Ya3VLSzlFREtNellFWnc0bEJIYTVudnV0WVFsRUlXa0R5ZEF6?=
 =?utf-8?B?czdwYmpVUFJTSVMvRHZRZWdJeDZ3SFZhcFFZTjE2V0VtQkYvUW1JV0g5aXdl?=
 =?utf-8?B?MUNVamR4WHNPcTVQbldxWFhtcWl2aUdUR3BzTXAwREhIcTZSOVptRzBIQnVJ?=
 =?utf-8?B?K2VGdUVLTWlVbFdsZS9ZM1dpdURNYXFVYXdkaWZoeTU1K1pqaysxc2JqU0dF?=
 =?utf-8?B?alMrK3huTkVzVEwrakVoQlZNbUZocUpHaitHcmV5eHVZaGlySnN0UDk1Q1pV?=
 =?utf-8?B?eElDVjhDZ0lHVk1kc2JXeUFZZ0NHdzJUdnppaVJrWU8wNUZWeDhJd0FLTG1T?=
 =?utf-8?B?cWJlemh5anp3Z2liaklSRHJHM2NKZzJxUFQ0b05BOWx3TXZWdld2UGw2c2F5?=
 =?utf-8?B?Y3ZoU2RsZ1hFSUxOdC8yVExpeHJLbVVmZ0YrWmRIakRWd0EyR1oxRmdxRkh1?=
 =?utf-8?B?WmtDT3U4TUtHaUswbVZjeGZlVk5JU091QmRMTnR1NFV5bnVYNHpCQXNYR2x2?=
 =?utf-8?B?YS9jbWR6L0EwUVd3MHFUVEJKUDlGVTBVLzBOZkNvNnpwR1pFUkFJUGhrZ1dk?=
 =?utf-8?B?SVdlYkVrQWd4eDFweGtHTXJWNGxOdEVvV0h1R0ZLSmVjUlNSRXJoenVISGFp?=
 =?utf-8?B?aDlLUVFxZFR4V1lqU3hxVlFBOGRFRXA2M0lvNEJLMVdNc0Z6NWk0QmFIUnls?=
 =?utf-8?B?U3BVaHEyTVNRZWhsNWZqVnlwVEIvSHM0T05FTC8wRVVDMUVxdHo2cTkwbXRD?=
 =?utf-8?B?T0VUeDV3Uk82N20zWXZORkptM3hzSmlCQStPWVBwZndKV3hpeGorZGNEMHR0?=
 =?utf-8?B?YlpKSkpvcEpXTkVINTBodS9ucWN6azRqK2lZbEJIRVFWbG8rcXZOOWNkWG1K?=
 =?utf-8?B?cUJ4eWxqZGxwakV2WCtYWURER1JFU0xRODhFTDJ0RTlRM2x0N0ZIRzcxcHZa?=
 =?utf-8?B?SHpDaG1haS96Rk9jcllackdzQ2cyM0IxNUgzVG5BVGV1QWZNL05xVk5LZTNh?=
 =?utf-8?B?MnBJWjZGUkh6U20xSlVDaytEMXFENGRXL3pHWFY1MmQydURiblVaUGdBQzdV?=
 =?utf-8?B?YW1yMEVSNWxSR3VzTUlPR3JaN2luNGtraXJLOHl2UTNJWFNSN2Q5OVhmeDJR?=
 =?utf-8?B?UXR0UnA3WmpXNWtRbUtDWVo3TlZ2U3lHQlZNWEE5OCtjNDZ4NHFXdz09?=
X-Exchange-RoutingPolicyChecked: QtQ1vkNWjPa9N37cA4jovosQ9VQyoNnbX1LNM4topUeV6ofQIoJKF8s9Yzz0nKd7O4ojXH1YzGBvA2QbIC1/ELq2tkPCXbrcR0FZHLM083XLjSzXI1RZS/Af6XOLZd8NS5PAtlF0vNObIV39NVU0EX+oEbAdg8czOBHE4Ucyvyk3A1fNqSBxxN/YlGj1PlnkIefx/Vt/YlVOyfH0r+3Bze1XPlpMrx00IHRziS/F0u72QTiAE2oPHHP2rxhzDMz7tdTIJCsF/jXXItFQKsIxuF53mFyW1sfdExAMWvYSpd9aQEZMxa+JaQyne78Jop5kaerJT3R4fVW+7bGdeqWdVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e39d7cc1-14d4-42a8-81f7-08df26586a03
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 22:55:28.8794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1xtgiDtLQxz9nmeFmt5ixy7jwIDb5C6p+Fwpo1HUmFkoBj8v/1w3QnCDq49RhNeS595BWsI43LoI5A5gMdIjdMVZ4Bhp+eph7Z7z/MV3tM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6938
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


On 10/7/2026 7:16 AM, Gustavo Sousa wrote:
> The function igt_stop_helper() does a sanity check by verifying if the
> helper process died "too early", however it does that by checking if
> it was terminated due to not handling the signal used in the kill()
> call.
>
> That logic has a flaw though: it the helper process gracefully handles
> the signal sent by kill() and exits normally, igt_stop_helper() will
> mistakenly take that as dying too early, because WIFSIGNALED(status)
> will be false.
>
> That's the case with the pw-reserve process: in an upcoming change we
> will change pipewire_reserve_wait() to call it with execlp().  Because
> it handles SIGTERM and exits normally, a warning and assertion failure
> would happen with the current logic.
>
> Fix that by checking if the process was alive before calling kill().
>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>   lib/igt_core.c | 20 +++++++++-----------
>   1 file changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 8ee9432923e6..d9949ea131f8 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -2652,13 +2652,6 @@ int igt_wait_helper(struct igt_helper_process *proc)
>   	return status;
>   }
>   
> -static bool helper_was_alive(struct igt_helper_process *proc,
> -			     int status)
> -{
> -	return (WIFSIGNALED(status) &&
> -		WTERMSIG(status) == (proc->use_SIGKILL ? SIGKILL : SIGTERM));
> -}
> -
>   /**
>    * igt_stop_helper:
>    * @proc: #igt_helper_process structure
> @@ -2670,17 +2663,22 @@ static bool helper_was_alive(struct igt_helper_process *proc,
>   void igt_stop_helper(struct igt_helper_process *proc)
>   {
>   	int status;
> +	int ret;
>   
>   	if (!proc->running) /* never even started */
>   		return;
>   
> +	ret = waitpid(proc->pid, &status, WNOHANG);
put waitpid in a do/while loop to catch any EINT return that may need a 
retry.
> +
> +	if (ret == proc->pid)
> +		igt_debug("Helper died too early with status=%d\n", status);
> +
>   	/* failure here means the pid is already dead and so waiting is safe */
>   	kill(proc->pid, proc->use_SIGKILL ? SIGKILL : SIGTERM);
>   
> -	status = igt_wait_helper(proc);
> -	if (!helper_was_alive(proc, status))
> -		igt_debug("Helper died too early with status=%d\n", status);
> -	assert(helper_was_alive(proc, status));
> +	assert(ret == 0);
This assert can be moved before kill call to make sure the correct 
process is killed.

-- Daniel.

> +
> +	igt_wait_helper(proc);
>   }
>   
>   static void children_exit_handler(int sig)
