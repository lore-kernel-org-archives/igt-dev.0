Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80810C5AD49
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 18:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B5B10E578;
	Mon,  2 Jun 2025 18:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CjgV4mI/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDE210E578
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 18:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748888753; x=1780424753;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gMSyZDbe7kItCO4CWzF6jbcefzJqmC/kUCACqQmyYjI=;
 b=CjgV4mI//eltflkMw4OpwM6ENqWSc6nRUnmwSGdM5EDXSdH2NwFCYGCx
 Ow2q00MI5xvOWqQ59igUF7a7Vzh7kEe9oRyw0ey+rmCcjXTv41tEcpVyp
 AzYupmTO9KNtd/rKK98qHqmnzMlrC3UhZeOdy3KGfNqf+udWKP/yclWVw
 oV7as3Ng96faDZaPCNem/IY9w5+kHF4BOFobCS7ipPYj6Od8J5TkWoKmP
 6/B28VQ4ThwnmzuBKFFAuld3ssEnYJbU1E88xB9/x8o8ARhvnSJSHFZrr
 j9OXy20NzVxj3ch8niZfpqFMNI+d3xHWW6ee0stb5myjm4uxcYAs8UgVF w==;
X-CSE-ConnectionGUID: gSc9IP+9QR+6HYFxjjI5mg==
X-CSE-MsgGUID: Peu5jxk1QqO9b8VqtYVTpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50772647"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="50772647"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 11:25:49 -0700
X-CSE-ConnectionGUID: iWs4WwGfQtKU7I4I7COmCQ==
X-CSE-MsgGUID: 2S9w2aQVRaicaLl6spvgkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="148473625"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 11:25:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 11:25:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 11:25:47 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.80) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 11:25:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6QFtWQeeQey8nMt0Y+9zLqPGM/vgy44+XXtx1Q1hc0iG/3K7y9eglW/YJfkylYZLfb1p0IfBZXARlQKQh3pFcAUpbJlK3aapmyhMTQ6vSNcySGtv5Mx/rmxGnluRnIDXk4A6/ztGAjchnYPTCSJskwz0zkkfaUtNQlGb2IXCoA+OJm6PsbRSB+q7KjS6T9FiOLFc1N6A9LoX57w1FW2Cdj25P2WkcYAM3sGBXd/Py0RDzxNJ82JFUzsiYBjZCZZCYwSGLWxShqN8DYWz8yyfwtIiO6tBfjYEGaN5MWe2/BKeWDKAqiIXyC/Hg2bAYI+FSmPxp5bcX7N2wq9CYG4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFrcSQ/y1zROsfBkQQU7iQiR7AxVEN8U3XO2hNHb2aY=;
 b=qvSCduQ0oQMhpCqw2KPhIIdDCFZD1LbAG5wcD8n4YxNgD+GS6YvzmxMwOZ0b60fsKAFZpadHW/O7DrkrNc3JA9Rj53mnMSE69voY89wgnS2zfroeEzIrwF6b1X8ZUYCT3/oPwWklQ4QxYTE1940RItkcNAHGU26tOJo3aTb5RDY9ppy/2r88ArklIos0rDpggJjgqdl9WjEmRGPQuEEHA2BvKiV+/l8YK/dpJ1bpGB3H7SDwaWTMAKbVRyeWsuAfajzJfx18fKzBj/VMg8WISqgkvg/puN1lQq2L03vDstliUdAMMtzmWw+SXv1EXFrer70IEUYiftfVy4ty14E0rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW4PR11MB8267.namprd11.prod.outlook.com (2603:10b6:303:1e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 18:25:43 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 18:25:43 +0000
Message-ID: <74ce12fa-b60b-4103-b92b-6f54a3696c44@intel.com>
Date: Mon, 2 Jun 2025 11:25:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, <igt-dev@lists.freedesktop.org>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, John Harrison <John.C.Harrison@Intel.com>
References: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
 <b9aa7f22-aa4e-4f9a-9c5d-98d58066fcbb@intel.com>
 <0d4c919f-88a1-497d-84f5-25b8cb854d50@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <0d4c919f-88a1-497d-84f5-25b8cb854d50@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::35) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MW4PR11MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: fe91342c-4fa9-49ae-6441-08dda202e27a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXZaN1oyeHUzZU92QnVLV2dRVysyNWR3SmxJdnl6dzhyU2NvNnBreXdTMXQ5?=
 =?utf-8?B?SkdzVUF5WlFSakE1NWF2NksyNlJwS0lLcWd6N3lVNzZOS2diemhPaENHSFpk?=
 =?utf-8?B?S3BBNWU2ci9reTR2VWV2SlF1VGQ3dTI2a3JPdlFJR0pDRDhrTkxQdWZvVVE0?=
 =?utf-8?B?bkZ6MUJSbDAvWTkvd3Nkc25VekhzNm9jc1VtaldsWCtPUlh4OUdrYUFiNnBD?=
 =?utf-8?B?Y1FQcWs3ZlZlYXlqZHd2ZkEzYndhdm1hNG1GVDZVQ1FIalVZOHJZOUdTSHdC?=
 =?utf-8?B?ak5kaDA4K1dCRDRLVE5mMXJsSG5uaWVhY0tQU21abU15Z1BrTFAyVzlNMU82?=
 =?utf-8?B?REpZaVpvSUVZNUlXQitCdGQ5U3VtVVNuVXFQUGRsc3JLWlQ5T3Yyanh6MUs0?=
 =?utf-8?B?em5XanZJVEM4RkgyQUJ5SGFUcjM2b0JxYzBVdGtJWnQ4OXZVTnNnL0dOOVpU?=
 =?utf-8?B?SXNGakxoUWEreTIrRUQyZzYzSjNPN2RHcXk4bEwxMXI0b0RURnJNcmRUZEFI?=
 =?utf-8?B?dkZCN3hoTzRWYkErdExMWlFtM29DaDNBM2RUVnBtbVpVcmxKb1Y2UC83OGZi?=
 =?utf-8?B?WU5ZUTNNOFNJSWNEbDg4Uzc3MHQyM3Q4L1drWUR5a1QrdUdRYW91a0YvZ050?=
 =?utf-8?B?bm5PZjlMSW9qZ1FvTzRxKzFML1ZZRllGUnhtZDRPdUhjclEzWFd4ZC84MUdO?=
 =?utf-8?B?WlVGSFRwaitJMkJvUkwrZEZ2WVVoMzB3Q09wWEE2a2JSeU1iWXE2ZDZLLzEr?=
 =?utf-8?B?QVpxS0t5QjJ0anZLdFl2emsvUTZTcUR3Z1VwSXNZYXNGQmRLQ2pFaWo4em9l?=
 =?utf-8?B?WkhqbHZVd20yMTlTRU44bTVvVjJZN05UQVA1NXFRcmFab1o3eVp6WXdCa1B5?=
 =?utf-8?B?T1RpVVNiYmp1R0w1WWlrSTBCZFpNMUZ6Nk11dGZLdjVJRnIxanYvMHBIS2Ur?=
 =?utf-8?B?UXI5WDgxS2lFem42cWZ3Z3l2V0F5aE9pSDdxZkZrZEZZWXhVbDVzdTV1U0FF?=
 =?utf-8?B?UUhRS2w4UWQzWEowRndnT2lUMWE2a2p1VmYzbm1ZOEhQSUZPZUtxd0x4a2tT?=
 =?utf-8?B?M2FWMFRERkJxQlR4S3c1d0c2QnJZaHVNM0FZcWFkM2RXUmI3MWlOb2hocFJF?=
 =?utf-8?B?UTdFUVhVdzVQTjhvYmRxN3dxUTZnVVJmS2JFcUhxbE1KYTZvYTQvb25ld21K?=
 =?utf-8?B?Q3ZjOUJLcjV4N0hUbGhnbVZPUldLMXpZR0FhN0hudGllcXZNa3pXVVBhL1lk?=
 =?utf-8?B?QVVVUDdEWVlPLzcrbng5Q3hLSW1jK1NhcE0rQnNFdGNYYXRQWmt5anNOTndR?=
 =?utf-8?B?MjlveUNNenBwK3IzVGJLWEtpUHNFMUl3YTNzUFlWUTZmZEtrNFhudEkxaEdV?=
 =?utf-8?B?bHh6MEZKaTJrRDk1d1NiS2o0bWl4eXB5ZE1YZFB4MytGajg4SHdxVEVZYWZK?=
 =?utf-8?B?SGlyVUhVQU9YcGhpMzZYUzV0UXh4eGFjRWxISEcvQVpPSWJpanFXZ3dvb2lT?=
 =?utf-8?B?bUxsNlY1UGVCRjhaLzd1RnRpUld5SDRFUGRTWVErRnY0QmdhdzVNejFxaWx3?=
 =?utf-8?B?TTlsTUNTUzlmcHdnampvTCtCcTdFVkRwdUx4OWV6VnFMcHMwNWQ4eHFCci9r?=
 =?utf-8?B?TDJtQzI5NmNqbGp0cXo2N01qQXF0MHlYQVArNVlNY0xWN0ZwdkYzbEJOQXVU?=
 =?utf-8?B?TGNtODRQR0V6eFU3YXpkRlVISzBObmEvU3hia3gySGsrT0t6YzZiSWN3Z21m?=
 =?utf-8?B?Q3d6U0tzWTFuWThSV0drVWJ4SURSSjBCY3B2VGcvazZrQ0V4ZnFEcGoyeWpH?=
 =?utf-8?B?eGdSTWplWGRGQlM0c3pmbW52VVRRZENudWYvZk5VWEJLRWZWKzUvWkpQdEVM?=
 =?utf-8?B?MHc5VUdqWEQwWTZRenNwRnJaTm5wVVdQT1V3R2sxYk0wc0FrT3ZUM1F2eVgr?=
 =?utf-8?Q?3kikZFURJCE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmNQWUFybEI3eUxPeFZpeThFS2pFWXdCSVN5RnpCVzdLdFFtdDZUZm50UUU4?=
 =?utf-8?B?TnloS04rZDVCU3NxUkVQQ01tUXI1OWVXT0Y0bSs5VEp2clN6YmkxZUFrMFdr?=
 =?utf-8?B?NWd6R1BMUGh0Tyt4U2lhamswcFh1VlhtQms2M3F6cENqR0F3aFdlNlJ0c0JO?=
 =?utf-8?B?ZDJpNlRiR3hTY0xpQWZxVW41aXNLYTFaV2xUelgwQ1FhY0xORlNXZDVHMGZX?=
 =?utf-8?B?VHBUTEZlWGIyZmFEZFlpcWY0SlBzNHNHUVhzMVQ0elRNaVpNZU5rS3FnUi8y?=
 =?utf-8?B?SDNqOE44QlRhUjBac3d0Vm1aWTI4Tlk2bEZrQzZ4TGI5Ym51T2F0U24rQWRC?=
 =?utf-8?B?alo5OEM3bVM0cUIweDZIZy9GUzdjVnp1L3huM3BvUUN3Z0JyU3pOMmRHT2xw?=
 =?utf-8?B?Ymovb3lzamx5dW4xRTF4K3haV0R6TkZtZVVVWWNwR25za3dwcHNUcmVYSHg2?=
 =?utf-8?B?Q1hZUlBhTlRTTUpSWDU3SUJaYmpDSm5CUENEVjcvTytZcHhrNk5YM3NkSWxJ?=
 =?utf-8?B?S0ZaTHVxcGo4N1VOTGhuejlNVTZiRktTT2RJMDBmSks0QzN5dlJVeW1ndEw4?=
 =?utf-8?B?aGNsaUk2V3N1Ty9NNWdsVzY1SnVFYmczSnZkS1RTaHFtMVB0ZmovMkFwMzlX?=
 =?utf-8?B?dGFUc3hVSjdTUURkNTJsR1hRdGI3am1BMU5IY3BGUFh2cW16ZC9zcDUreHVh?=
 =?utf-8?B?WDZ0YXpydVd4bDJyOE1oUlY1KzNKcUJjelRPT1V1bG82cys4NVZWcmM2WTg0?=
 =?utf-8?B?QlFUd3FGR0dlNXBrRk9taUpTS3pqOU9ka2t3NHhmdTh0NVJWcDFKMGt5eVBD?=
 =?utf-8?B?RXBwZzFNUk9ma3ZUaUswbnlHTnpzb0xVQVZkT1A2OGx5WWxRTWQyRzhEMDlT?=
 =?utf-8?B?MlFDUzVzQXh4V3ZaRG1NZEwwaFU0NmpydjhvZFhzNlkxY2JvazRiZ3dJM3Iz?=
 =?utf-8?B?emEwZ1hnMzNwNGx4clhDVjBaS3V2ZVJJRVJEeFpldHVBa3ZleEtXMnQzYzFC?=
 =?utf-8?B?QXBZMnpDZnBmU1JwOHNPWStIL25MOVhYTXZGR1JUaVNGL0dJTnFtSFpDU1Q3?=
 =?utf-8?B?U3lRVksraW80VHBIb2ZGNm1pM1VwQjh2eVJXRFBZMzlqRlZZbU9uQkZGb0pV?=
 =?utf-8?B?dFYyYTJqVlQxeStaVkljS0dlZ2h6MWd2bFVQazJEQWk0TTk5Vy9iSEhMZVBy?=
 =?utf-8?B?cWlKWUxYRExnSWdPTTRTOXQ1TnZFKzRQeFBrQ3h4VkhRbzgyUUk4Vjd3b2gz?=
 =?utf-8?B?WXE3Q1UwNzlwMEY1VzEwd21mVityUXdLT2lSQ3VvOWFXVkRjdUxLbGV0aG40?=
 =?utf-8?B?UWtFNndEcTRVVUR6OW9VRU1sUmZaSDBhWHhOZUR2TkswVm9nMFdwUGpIVDZL?=
 =?utf-8?B?aWc0K2pRTnczNDQ4YjI0NitBL1A2VnZNc2NLc3VlWlFNY1FQZnFzK2laV3BQ?=
 =?utf-8?B?VFRhQzlTaXRoV2MwYm9lWGtyK0R4cG0vYUVxSWVsWnVSdC9SdDhFbGNIZncv?=
 =?utf-8?B?d3FaUmtzYkJ4WGhSSk02WkJOVEd6Q0tHK3U3Q2s1RTAxeHh6WStHR2lTUmNx?=
 =?utf-8?B?K0ZxRllnNHJ3bUJnVUhJWGQ4OEl1RElvQ3VONmlubXhwd3VybjY5T21ncWFK?=
 =?utf-8?B?T3dpaTQraU1sRWk5bS9EcjVzdVA1VWJIRUpKaEJDMElJbTd4bElGeDBrQjFD?=
 =?utf-8?B?dzJTTEUzUVVqOUttcGZ6MVVqTjYwOE43bmZibE5Bam85SE9YRFFpYm4yd1hX?=
 =?utf-8?B?NERsTkg0bG9iVVdPSlA3MWp6MUtXWEEweGdXSDVkY3pYVjFibThVbW5VYndL?=
 =?utf-8?B?aXA3dXZpT1FCbmlnUHpDYUZMOTRTREUyWnNTUzNoeDk2VVhUNTRPaStxdUl6?=
 =?utf-8?B?Sk8wa3VJdjgxWXJHUnhQeVpaRUZrUlNkTjM1dnE0ZFphOUhyOHN1VWx4TmR5?=
 =?utf-8?B?Y2NidUtiMlREOXBiTVdqSGxaSUpiTHJFMG80RElKTXFvWE5zMUk5eXFQY2Vr?=
 =?utf-8?B?OW9ZZXRMRDVkelBiSVVnVXdtMTRxK2cyMVE0b1VMVm9TaWRWcW5zYzRNNTJx?=
 =?utf-8?B?RzBsUWRQbG1YSGVoQm1hTzJzc2owVVl0REtaVlFtaTFHN2huOENVa3FtaDZN?=
 =?utf-8?B?eVdwWXdGZkhNQUIrNU9HNlF4S0xXcmd1RzBINmVzMURjUm9pK2FYeDNKVE41?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe91342c-4fa9-49ae-6441-08dda202e27a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 18:25:43.2072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIXlEMjMNhDNQNNt7AXTjU46tO9ty4Wl4YDQrdKbKrSwxLwvz+oSWjir5vAXpxhc9/LF70Hapx4HgA795jzftVXL6CPnn8XbmYoAi2+oCHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8267
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



On 5/29/2025 1:29 PM, Michal Wajdeczko wrote:
>
> On 29.05.2025 18:23, Daniele Ceraolo Spurio wrote:
>>
>> On 5/29/2025 6:31 AM, Satyanarayana K V P wrote:
>>> Currently, numerous fault messages have been included in the dmesg
>>> ignore list,
>>> and this list continues to expand. Each time a new fault injection
>>> point is
>>> introduced or a new feature is activated, additional fault messages
>>> appear,
>>> making it cumbersome to manage the dmesg ignore list.
>>>
>>> This new patch automatically ignores all error messages from dmesg,
>>> eliminating
>>> the need to add or maintain a dmesg ignore message list.
>> This would make the test almost meaningless. If the test finds an actual
>> bug (i.e., an error we didn't expect), how would CI detect and report it
> but how can you tell upfront, without actually running a test, which
> error is expected and which is not?
>
>> if all errors are ignored? The only situations we would still fail on is
>> when the kernel just dies.
> and that perfectly fins, sine we should look only for BUG and WARNs, as
> it's quite natural and expected that once we inject an error, the driver
> will likely fail to load or proceed, and/or may report some error
> messages, or even try to silently recover, *but* it shouldn't ever crash
>
> and that should be taken as a test goal, not that we look for specific
> error messages that could be changed, omitted, replaced by the different
> driver release or when running on different platform or function

The patch does not look for WARNs though, it ignores all errors with a 
"*" filter, even WARNs. I'm still not fully convinced about ignoring 
anything, but I can understand the POV of ignoring just messages with 
the "ERROR" tag, as suggested in the other replies. I'd be happy with 
that kind of solution.

Daniele

>
> Michal
>
>> Daniele
>>

