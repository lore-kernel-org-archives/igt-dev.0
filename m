Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC607E63F29
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 03:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4304F10E021;
	Mon, 16 Feb 2026 03:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CxESl92E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A888810E021
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 03:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771213166; x=1802749166;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mbtvJIEsKSm9nVJ8UgjzSd0S2NxzGSrwiGa8g1mtDvE=;
 b=CxESl92EisOSfxUQR4rdxx2a0/D4+KfHxgpyBfAKSCLyY+xeJNeQiRny
 Tk4sTJMa68TlCC0TRH6Rfub6jz8fEpDnElFQm4vGirJv0Kt4rzB75voeC
 xIaYdblhc/KjjY94eJSb/bfXFhNMoLUDfiCjVWNQtlb5GkF85w80jO8dx
 1Fd5ZMbu1cHDKbJ+uXyF/2q3ZufM5sRBE9IzZf4PyX7r+QUUs8pY8YyMg
 GVgaTo1Y4ZMH3NbSRrfJd88xJpNoBpQ7+o17i4lS4SIXgGL+6zp+ZaZKj
 SCKtgYu1wVoBjiOz8irjgPHGkZukAQs0LMOLhJbtdvnB0wGR2HD0jZ4ut g==;
X-CSE-ConnectionGUID: cBvfbR2iS+GGHeU0WKXR2A==
X-CSE-MsgGUID: wrtS8jEERO+elv6riLS2Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71494683"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="71494683"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 19:39:26 -0800
X-CSE-ConnectionGUID: XvaxifZpS52ByshxRw7xEQ==
X-CSE-MsgGUID: DGAtTSJ4RVaFjKuX16iDJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="244063913"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 19:39:25 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 15 Feb 2026 19:39:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 15 Feb 2026 19:39:25 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 15 Feb 2026 19:39:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esCgpjsRDF9ToG1rlvykp6qG/dEuHFnzHDMEG+iTmubgjD1lZGWXalFbJQnYtY2M5qyMfExlR9zZg6jRuWvi0alVB3nmYycorDEPVLuiLwiGysRlY5hI+p/3Rgevg9fL84FuBNYdCdPwXHTqVz8GgbmJ9V5zR7TWCY+fwzpEdCubumJ8P7hngUhrXHlIDkQWqQQvnXyOFEU6xE4lmHRHE4op7xX9n+hezCRdVVj/jAzCNPU8965jImluVsW6FkV0ilXhRHc/Wsf8CreNmFAB+qaj0vMBmYfqGCllPrEefyg02iqNlWv99brT5Z5WEqB2XnN8UTMgjv1l+Cy9X9SiJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orSOpSATnr1fmsVfziqHlyzG0ZRw+Rh4M4KSGZnh1QY=;
 b=CncE9kiWBSw/54UcvDVhbrsrAh6qxVDr8y9acf2XsRbx9l+rVs6izANu1nh+miO92us+2xjL3eUYVDpvo2TXNPu8ua4sUpvIkppTwx1kR30Aj/bQr4q6d8s4AQngIzcgSs+gfU/zaW5fQ8gMLDa8j7dfcLaC13GeLYHd3JPvhYwbZFOzqL9uuxdRRGFJ8dUoMseJ0+di/faPqE8SnAyu5YsbwfjuujYSjLm/WufXBUldPFmFJ9kesnHvQnvmQv9PuC3pPJHpSijgdohPl4OjfucNUpQn2YV8xbvvoDQLZnG1IDkwnLlZgX6a+zFZD6NtMMHcVeQeccbwz5dECUWmtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SJ5PPF5B09F0799.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::82c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 03:39:23 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 03:39:23 +0000
Message-ID: <5dbbbe95-52ed-4c62-b159-3b9dd6ec4c39@intel.com>
Date: Mon, 16 Feb 2026 09:09:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_content_protection: Fix multi outputs
 using same pipe
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>, <ankit.k.nautiyal@intel.com>,
 <mohammed.thasleem@intel.com>
References: <20260209103445.1468369-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260209103445.1468369-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0229.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SJ5PPF5B09F0799:EE_
X-MS-Office365-Filtering-Correlation-Id: ad485035-0c1d-49db-6064-08de6d0cf981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|42112799006|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVdNUk5LWmNKUHpWdmNVbkNVbm9TQ1EzMnhQVzV3eE1EMm5UbGRMbUE4SndH?=
 =?utf-8?B?ZG9JaDNqSVcvK21qMGNwRWVCZTdsQ2psMW1NYU1DTUNla3dsTWxCL3kxaVBC?=
 =?utf-8?B?aVFxVldaNHJvU0IwaDVlQytIcFk4aWkreDFack1jZldBbGF2dkN0dzFmcVVG?=
 =?utf-8?B?MHUvQVNzNmd0dDAvMzNFdWJTbU9Qa2RjdjQzc0UwVWZySitORjczeSsvSEE5?=
 =?utf-8?B?SElJTStmeDRiRktCNVNIbVRMenJDV2Jhb2xDdnBSR0hXcjVlcjZKQU91V01K?=
 =?utf-8?B?N3ZmMEZZOVRQZXdhMUg0OFJSeGR4RnBrNHBkUGliMUl2N3M3bWlBQ0JraU5R?=
 =?utf-8?B?aWs0Y2N6WDVsUENBRU5UNzRxS250QVhDNXV0b05TWjRaZ0FJWk5mUzBoRTBR?=
 =?utf-8?B?WTI2TDFHeHZSM0V1aGJKOWtpZVU4RnNnMnpiSnQ2cU52MVVxTjdEenZ6cXhU?=
 =?utf-8?B?bUdhbWFuYkJ6NlJUWVlrZDlKN0VlcjgvdFBUK2tEcHVXcEZvVFRQbUNYTVJW?=
 =?utf-8?B?cFdyV3dnb1lIdUZWRFdNZVN1M054cW1HOG9KTXNFeWZiU0txL2xXaC9YRlRX?=
 =?utf-8?B?S1A0azBkY1RqS1B1ditOb0dJc1V5eVpCdmZKMi9YSHdKdERpZjlLS01OcEtq?=
 =?utf-8?B?b210QUlnRjZCREhjeDQ3ZlpmZUhjMUg5djEwT3haV0cwaElTZFlLeFd0c1NK?=
 =?utf-8?B?Sk9mdWRVQXJxN2dKOG5rdFdpamQwR1VVOVloSEV3MW5jSWJwQTR6a24ydGJZ?=
 =?utf-8?B?N3pXMW9naURCc1kyRFNQUkpvdUJOMk5JRWIvV0t3RVZkaUk5MFNFaXgxSDBF?=
 =?utf-8?B?NzZxRTNXWEhCR0tYSzd1YklCak9KdHhyVU8rbXc1eWVsb1dkdnpKMVpTcmJL?=
 =?utf-8?B?d1dieWN3Y1NpSXQ4eTFWblVQZ3Mxc3Y2UEs5WVBmcFZXcEdnU2xTSFV6TDVG?=
 =?utf-8?B?V1MxNThaNTVCS0pCZHkxWjVSQTJBaExPNWlHYmxPMEhIcDhWMWtlMExxY1Bu?=
 =?utf-8?B?cGxRWFRDL1NJeThOZmx4OUJjNGlTZFRkeHAxalRybld1Q1Z1OWwxQi9qNDlW?=
 =?utf-8?B?cDZiVnBxOUgxL1VBSHV0VE5vRW5mNjV3b1pFcXdzT0hRMjg2M3UrRlEySmlS?=
 =?utf-8?B?VDB3N1Rna21qS0doVWNZUjhUK0hZbzI5T2NXajNqUlBSSk5sb2xXV1VzM1B3?=
 =?utf-8?B?YmcwdVZBM0RLb0xsNjEveUJHRXRrSkVYbXhLYURqaGk0Mm1LN0NMVHVIdXlm?=
 =?utf-8?B?MFJlaEtyTThyQXZQSzlwbFlqcjZXR2RsQjdJa0VINHg0MkJUZ3FoL0dFdzkr?=
 =?utf-8?B?L08wcjAzYWg2OUt6KzI0TUUzNlBCbk9VNkpvS01uYWNjTE53Q3RGWUc2TlFv?=
 =?utf-8?B?anVFUE5hN1NxZjI2dlJrYTNEbWR6bEFoSTJwQTd1VHRkRWRMaFY3WCtiayt6?=
 =?utf-8?B?UXNrdm9XdDkzY282c2Q1RUkwM213M3EvUWQrNFhyd01aR2hQenVTVThlMzN3?=
 =?utf-8?B?WFdsYXRxZnk4QXBBVEx0cmNvc1RqdDA1V1ErTHVCS3Q2aXBaUVVtdjlGaTdW?=
 =?utf-8?B?NjJzNmxmdnhOUzBqTXFEME1MS0NSdC84cW92QlRVMWJ2SFQrWFpmS1dFcllH?=
 =?utf-8?B?eGFOOE5IUmhIMzA3RS9tU3RsTmR6eGdNQklGcFVNTjdsSlB4aXdmRzNLc0Nt?=
 =?utf-8?B?dHI4dFQxOUUxMVhoK3lBVys1ZzROM2J4ekFOcTkvbTBjekJiVldoa1RwNVcv?=
 =?utf-8?B?c2tFNGFHdGZkVzkyZ2RhK3AzTlBKVHhYVEJCZG9RV1J6ZFVVYWZNQkcxZVh4?=
 =?utf-8?B?Z0hZbjZqMUNONnh5RkF2bEFvbUV2S1A5aGtnN0poeVZ0NVh0OWRPMUc5QVJa?=
 =?utf-8?B?TWtUWm5RUE1ZOGFmdGZiTlRKM3JZUTNRSG1Sazg2YldTQTlJMml6U1pOM0VW?=
 =?utf-8?B?YktZd2JlNlQ2d3VkOUZGeDdlalhCcCtNdVJlemhJS3hHeXZobWh0SFl2OGZl?=
 =?utf-8?B?MjlsZm1vUFhEQ3FOK0ZZcDNRWjRYeEx3cXNNUlNDMXdxbG9IKzZPRTBLNzMr?=
 =?utf-8?B?QklVUHdrckpLTWttcUJKalNUeUhRU25PZDJBYW5YdXhRRkZzV3FyMDN4cEE0?=
 =?utf-8?Q?+K7k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3UzQ1VLUFFDelFVZE5XMXRWNjVobHFPWmQwdGk4NE5VdHdTTVZMdFo0YlFF?=
 =?utf-8?B?Zy9GKzB4UFFTMVlzbno1VW53N042OWNIeTJ6bkhxV0tZN3lQTlVmY0FZYnZG?=
 =?utf-8?B?bHRYZ04rUk9ncDgzeWFKczFGb3lOMWJSUnRadDdWWnN1dWlzakRubDk4UWx5?=
 =?utf-8?B?aTQ1b3NCYWl2MW80UWdDR2VVeS9TZkJCM3V4b0JwUzVtYjJCdkJvR201cDNm?=
 =?utf-8?B?QSsxKzRnSmcyb1JjRndHN3MzQ2thTDAvQllTTTc2b2JxdFJZdUV1U2hGSHVF?=
 =?utf-8?B?WStPL1lkVTBmY2NSOGdMaDJETUtvcEdvZ0tvOXpvd2V6dGhEcy96aS9OYThU?=
 =?utf-8?B?YmFFYzBweExra1Z1N01pVm4xaUVnZkJGLy9HQ0U1ZlNQaUw4NFJ6Z2toOTU1?=
 =?utf-8?B?NmNSUjN4NmpSWnlmTDRjaGgwdWRMMHVucGNGNEt5OUZkTkxlVUxRQlhWRkFI?=
 =?utf-8?B?UjNrdXptYkFyWGx6b2VVN1loelpNUHY3WUJReC8xMVBUTnRVajU1K1NGUThy?=
 =?utf-8?B?czV0a0ErSXpkSjQxdHNodCtMM1N2RCtJd1QvaVB5MlZFbHJ3Q1gzb01Reis4?=
 =?utf-8?B?VmsxaW96TkVpb3VJYndtditXVVlzUFZsbnhNdWJ3bXZOOFVIT3ZyWUErNGdt?=
 =?utf-8?B?aEhUUGlGSFRVSmxSWHk4OGtzekZrd1FRN3hlb0RtRDR5aUcrNzE0SDEybmMx?=
 =?utf-8?B?WVNUdk84MUk5WEFCVE0rS0EvNmpRSEVTTitRalZweWF6bTJCcHZlY0gxZVVm?=
 =?utf-8?B?eTZndVUxa0lQTHBCR0J0c2RVNE9oV0JiczZuUHFmSVljbWlNR2UwMG51Tm5v?=
 =?utf-8?B?RE4yMUFVU2NqWUtuUEwwblp3c0JadncyeHlSbmVKTi9sRXJsSWJqWVo0KzdV?=
 =?utf-8?B?TDNuVm9pcmFuT0ZlMGlSWGM4a2plaENRenVmalVJelR1Y20xUkV5dGF5Q2xv?=
 =?utf-8?B?aExGa3pHSXNFckgxOW91bUFYQnMwa29NTjlicVU4MC9CSTY2SUlaaFhaSnBh?=
 =?utf-8?B?ejlYMkxPaXk0R3R6V0FuWUxpaHlSSStVamlDQXg1MjdFaWV4VU1vc3BzQVZ2?=
 =?utf-8?B?NUc1Z1ZSSGc4enZFSkNNMWZNYXRtdnlUN3ZHUVhadmRQeFQyTnlRc1IrZGJk?=
 =?utf-8?B?dlVjS1QvT3pGd21RcXhZRGVsaHJzSWFIcmY1d21HWWJnVUNtbUo0eDNFYlM3?=
 =?utf-8?B?U2xYL2dUcmJoeFh3OXRUMEpYTjA2bzFpcWRHRzN0eHYwczNYRXhEVEZrWXZP?=
 =?utf-8?B?R2F3Y2s4V0xYcVFxbVNwN09iK0ozR1lEQW5KZHhnakVDSFo1dU5XS3dLVnlP?=
 =?utf-8?B?UnRRcVVuckpDdGtQQWFSd2dBdHFxMEVNV0g5V1cxNVQrSVd6Z3NtQkk4U2Zt?=
 =?utf-8?B?S0ZCeUxvaHJENklNZHl2eEM4TUJWUTd3TW16U1pwS3FBaG5yNm9DeC9vRUt6?=
 =?utf-8?B?Z0FzNGtSUnlwNDZvMnZxWFVjeTNEbWxhSXVGTTYwRTZhZDA3K1hpRXplL3ZK?=
 =?utf-8?B?UDZLZ2txMmV1c1M2Y0R3ZzlMek51N0RUWmR6MnJKaUhFWjNpamhyWk5jME42?=
 =?utf-8?B?OUN3NG5MZ1NGT2JPOVFXaklBNy96VVphTi9ibnZqTDBKcU9rM2RRTDBFTEo0?=
 =?utf-8?B?Rk1pY21pb3BzaHdwdnE2bUlteXB5TnExL0lzQkZ6ODZvUkNBd25ramdTR1ky?=
 =?utf-8?B?ZHZQMkt4TFdwTEI5NlRQdW9lTkswb2ljRktmdHdkdGlhcHBVK0EwQjFpa1dn?=
 =?utf-8?B?WGFEWHBFUXMwdHBCd0c5bWNubFJQRnJFSHNzQnZVMlNXM2k3MTI1L2kwWXZz?=
 =?utf-8?B?RTV1SDVZNGp6VWFwL2FtMmRla1g3WmZyNVd6bHhBSURGNGN3em5rSVprVWZu?=
 =?utf-8?B?T1ROMi9UcWZVcGVwbGdBbzV2MDdyb0ladVFVVTdQQWk3REtnaGhOMHQ1ZGxZ?=
 =?utf-8?B?MTZSMUlQT1p5ckI1MG1UV0NqaFFVRk1zVkpjdW8yR1ZCa0VuTllxZUkzdDZQ?=
 =?utf-8?B?MEJ2bWtLc1Vsbm9HcmhnbThrRWJiVFlKMVE0ak9mN0pGaHZCbUFpbUJOYklG?=
 =?utf-8?B?Zk5uTmcyQ3ZCTHJ6TldBczNKRUV3VXl4ZnFmNFloSGRkSjMyMGM3alhONDVz?=
 =?utf-8?B?QnhPQUVGUkFCWFY1UHROdXFnbnoycWhraGhCT1gzQTdOcE4wUTNTazlIaVNz?=
 =?utf-8?B?OUlwZmdHc09WQjN3b1ZVSDlGUWkrUkpIbXFRNnQ2bjM1Uy9vaUkwb1hNVG9q?=
 =?utf-8?B?akxON2U4VTl5L2FtZ1M3dE9URWc5ZHFtM2V3cVBrcDJIZ0Rld2g2VU9FdXVK?=
 =?utf-8?B?WU5BVnYrN2VhcEFJbFNoVS9yMnErNURseHhMOXpUQmV5SGFjeGhHZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad485035-0c1d-49db-6064-08de6d0cf981
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 03:39:23.0021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nEtx0ZlzVAgVqxSobx3EnbqPGAS+0/INqXu5hEc/K+YpQAaSu7dCbONQaUoFogHLInoC76mzdGBSRZbwadc0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5B09F0799
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


On 2/9/2026 4:04 PM, Santhosh Reddy Guddati wrote:
> dp-mst subtests fails with both outputs trying to use pipe A.
>
> The test finds a free CRTC and this CRTC is not being used and instead
> uses a hard coded pipe with igt_output_set_crtc.
>
> Fix by using the found CRTC directly and remove unused pipe variable.
>
> Fixes: 4122d450aef2 ("tests/kms: Convert to for_each_crtc(), part 4")
>
> V2: Add fixes tag and fix commit subject (Kunal)
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_content_protection.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 40f9c418d..d2bbea351 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -867,15 +867,12 @@ test_content_protection_mst(int content_type)
>   	igt_output_t *output;
>   	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, max_pipe = 0, i;
>   	igt_crtc_t *crtc;
> -	enum pipe pipe;
>   	bool pipe_found;
>   	igt_output_t *hdcp_mst_output[IGT_MAX_PIPES];
>   
>   	for_each_crtc(display, crtc)
>   		max_pipe++;
>   
> -	pipe = PIPE_A;
> -
>   	for_each_connected_output(display, output) {
>   		if (!output_is_dp_mst(output, dp_mst_outputs))
>   			continue;
> @@ -891,8 +888,7 @@ test_content_protection_mst(int content_type)
>   
>   		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
>   
> -		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +		igt_output_set_crtc(output, crtc);
>   		prepare_modeset_on_mst_output(output, false);
>   		dp_mst_outputs++;
>   		if (output_hdcp_capable(output, content_type))
