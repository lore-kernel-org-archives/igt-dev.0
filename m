Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16ABC677C4
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 07:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594E610E347;
	Wed, 11 Jun 2025 07:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MnU9jVJ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB2010E347
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 07:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749625873; x=1781161873;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J1czy41uj1+JhardP1rhkB2966n5AiNj62sRGQKj7Bg=;
 b=MnU9jVJ3XlyXGPrYS+XGjqEy5cBJQNKgnozQY6CbVI852tPr4yYB2dtl
 EG9OELGpIMvNuryzAMVjLRuHvyF33J+/5mkP65CbrYG/R/Tqjfs0QlkiV
 8UiA5IgCOI/wAct2fQDfJ+EDJBZ2FXJ8AAPr41QCyppSdHXIzpEV7nZH1
 HnMx/Bb8GUaV4skldesTBkrrID5PMx3Y4K/OZKJZUMPyYyWJkLRrZhm5Z
 yZyQocrK4nvWnlSd+OgUN4FOTD9YJcTq3G0XXlTa6iBBnHoJB3uY/P2Vd
 77C4b7rs3rBAqwHgt++ktAHbzzc/c3uu/myZrCYUSvN142X/DxbozDYly g==;
X-CSE-ConnectionGUID: BvqFdeovT1+UhCT7KKVcCg==
X-CSE-MsgGUID: ev/Qg5A5SEmVbZVMlAxrng==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51858309"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="51858309"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 00:11:12 -0700
X-CSE-ConnectionGUID: xp7Fl5i1QD6RoDL6F45EgA==
X-CSE-MsgGUID: v8GJxsGnSPSzi5wpe5Bc9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="146981412"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 00:11:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 00:11:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 00:11:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 00:11:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7NkAjmFBS2n9gaT6+fN8orhcXtFA/0WKCgHdkezcfRcY7oooZMzd8weGkA9xORbG+Wqp9FIrTQSy9QCapE2oLRiieokLnShTujxSxtZFVESfsroow80h7BM4x8owDcTZG7jIVLYikIAaRuSLmMHJd7IXQK0a1uto7BovLjXmd542iDGN9eKssufU5eknzHShmttrqqtDryrd4Gxr3NN4+7i1YVVHGfCVA6Tsy5GCIPlIQxI3S4ssKlithnSRelbEzx7x7Vnho0f155N1uYNnX31BxaTVoEDrd0G6XfkmiddtaLR4MonS9cKG/c7YRPMRv+R+Ts+BuMxEEGVjF4H1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfefnnoRbkuNIaexrY4F0PAdhUtBydfMcyo4FLDtQ9A=;
 b=AR1XAsOvQfINMetN22qgo0ICxygS5/o7mN8G9bFNYFuiE9cIxLLNQGZBshE09G2kRWUsh7yktlDupRf+GK61akMXZ2Px5Q3+OarFeM2KhD9/asCEKbRhNEchjlzkc7Cbt3KngD3h6j9S6OSDo+2F0OnUo0aU2UzQDgo8eNglHWFbl9jLdkN0LBL8WOss48+Win5PLEGkI+P79/SoUdVAkWYyECpvWBOghkBBVu5MXK01t0UjVajmaCTGWMng3r8l27VjnNs5/1CY4iZNmT4jHpeiM4ENck0BV46EVxEDrlr8hvgy8i6BPFSsTny8m96yT+LeBrz+285oKl2BqhpEgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by BL1PR11MB5301.namprd11.prod.outlook.com (2603:10b6:208:309::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 07:11:08 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961%4]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 07:11:08 +0000
Message-ID: <9bc6c66f-8f13-4542-ad8d-c6ffdc6e8966@intel.com>
Date: Wed, 11 Jun 2025 12:41:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v11 5/5] tools/gputop/gputop: Enable support for
 multiple GPUs and instances
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>,
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>,
 <krzysztof.karas@intel.com>, <zbigniew.kempczynski@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <ashutosh.dixit@intel.com>
References: <20250522154447.496407-1-soham.purkait@intel.com>
 <20250522154447.496407-6-soham.purkait@intel.com>
 <4c11b2be-ccc9-4cff-a389-8c908f6ee64f@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <4c11b2be-ccc9-4cff-a389-8c908f6ee64f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::9) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|BL1PR11MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: a9920e39-8a73-4675-667b-08dda8b72355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTk1T2huTWRmK3QvcGFuN1dqL1c4UWRyTXdvQktzY3laTGxzYUJ6T3BpeG5Y?=
 =?utf-8?B?UDJ2bSs1YU9sZ0lKUGRVekd0YzJxWHZSZGVBNHo0djI0aWUyOGkyZUpmdWY0?=
 =?utf-8?B?TXFmV1lJMlJNQ2t5RjJjRmFvbFNtdmRta09DMmw4aHRVcFZQZlhMRUMxSDNT?=
 =?utf-8?B?cVdKbWtUUzd2a0lnTVlFZ3hLSmg4MnZuOWM4cmwrM3dod3V2KzBuYlNtMkVq?=
 =?utf-8?B?aUVZcnVBczhkTXR1amFETVkwVm9zcGY0U2c4ZjVPanh5ZzRYV0gvNUdhVlI4?=
 =?utf-8?B?Ykxrazg3czJneEZHSnU3QlhRaDN0UnNDeVdMekR0MFIwODJqWXR3L3dYeEhJ?=
 =?utf-8?B?Y3lYcDBOTHltNzhFM2k2WjBrYm96cUZFRDNWa3ozcWJveWpieGRqT3BaODNp?=
 =?utf-8?B?NTcvS2VkSWROTUs4bEh2bXRvcE1lRXBMZWhPUVVmckxvSmNRcmx4S3pNdGln?=
 =?utf-8?B?dTdmdk5MWDdUaXJtNUFybnRxSVVsSXJQRExTcUdQR1lMTkNNdjNvaGRrek1P?=
 =?utf-8?B?UDhPOUhUZmdQWFRURmZ2a2tnOVlPbktVdGtQU0J0RkJsZEtQQm9iUlppUFJL?=
 =?utf-8?B?U3E3QlpmZFAxY3hnejBvVjBHdUUyRXdsRFNNRm95aTE3N3lvRE9Jc2xYY2Qr?=
 =?utf-8?B?Q1ZXMHBHK0E1Tk83S1VDM2diNjBwN05ZcE1tYnFrSUF1WU1QWndxNktiUGlG?=
 =?utf-8?B?d0J6c0FJMmpZN2xaNFl6bjFVcjA3MElha1dsTUtOekFwYTF4SkFhQ2hPYWpo?=
 =?utf-8?B?MGZSSXlQQ1lDVDMxZkpNdkJEaTQxZ05hTFpCcjNtN0Y1MFJRUDl5eFBnMU44?=
 =?utf-8?B?WUREQnYrUCtaV2hCUFBRQ2FOdXR2TUVtWFNZKzBVTXAvU01KYnhrWlp4andC?=
 =?utf-8?B?SHBkVzVpbTZ3bFdZdTY1NEU2MlBYNE1qaXUzaW43Zy9xMVNTOU1UTTQvekNF?=
 =?utf-8?B?MDhZTGFlckdpUUxQME8yUC83RUJSTFdOT2NXS2E4RWkwZmVNb1pMMEc1TTBr?=
 =?utf-8?B?Q2J2ME5MeDN1aVJ1WHlMM1p3dVhZbit3aGZSalZCMzlET2pvcTY0WG1KVWx2?=
 =?utf-8?B?SzhwRkhpUlBlWkVNU2p5QU1VQzRjaWY5dUttV2F4V1ROZy9CZGFPaFBibmJR?=
 =?utf-8?B?enJXSG01ZnRvZnlOcXBZOFVDUHJhQXlqUnRCUS95cGFodmpJVXFPL1RUTXE5?=
 =?utf-8?B?bXVDNTFTdkNRSHc0cmxFMG4ybFFqWVlaOVU3OE1lYnNNdUhCaWQ0T2xnVnBX?=
 =?utf-8?B?Vm9ydGFDME8xSElKRThiOE5GWXR1RExSNWpiWHhzV0R2dXRjSnhjVWJrWGVj?=
 =?utf-8?B?K1ZyUU9pWmtzYytSZDlxMXQ0Yy9WZkxQWlA0eS9iODhJL3NiajVxZmhoQjNS?=
 =?utf-8?B?dEphZjZQSjlLRG9STThWZ2x1NDlhdFFPQldWd2xnMmR1QVJMczk5OHFucGZ0?=
 =?utf-8?B?ekdFQWo4L1pocWhwb01McXJsZEVyMVVUaGhidWlYdkh5QldMajVMb1AvSmdE?=
 =?utf-8?B?UURYeC91dWFOY0NBU0RpSkx1bjBnN0xmNzhZeEF5NGtqdEFwY08zbnZTUHJl?=
 =?utf-8?B?eUZDdEpQU0tOMkhTdk1HT3RwT3FSOXJmVUFGaEE2UU94c0JHdi95UldZelRv?=
 =?utf-8?B?Y2lCdFdlZ3p3bUFhcXpNRXhmdlIwNzN4dTFxRDZxR2NVZXBqWmQ1SG1PRHZG?=
 =?utf-8?B?Tmd0Qm54VHI3SFRZaEgxTzVBU1RwNTZyZjlOWGZENmI1RVg5VVBURnFJMVNo?=
 =?utf-8?B?YXdrUXl3b3c2dG1nTkJJVWhMUjZpdGdnUFpkQTZha0tnTXRUYmR6M0dVV0pU?=
 =?utf-8?B?d1lxd3ZsOUFpa1V2TFV5aWhHeUJoV3h6Zy82d3NxSGdoSVZNeFo4Q0hXWGpZ?=
 =?utf-8?B?T0YwSmlMZVpxU3BQWGZIczAwVzFXUU9aNjNpRjA1ZUNGU0FWRFZRWDZISVZv?=
 =?utf-8?Q?vbTKibik7OQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vkw3VFhLU05YVDF4UG5sQ3FwemNRWmpBQWVzNVV0dENja2V1djd3YVI4WFBp?=
 =?utf-8?B?ZFpEZWs3NUZWQUtLZzFCK0xSaUhzOGtJazM5ZW04SkxydGRoaTVtWnM1MnRJ?=
 =?utf-8?B?MW5nMkpGYWx5aEtaa2FTYzZpV1Y5Zk8wYjdkQUFYNlZPYWp2cTlXTUpXR1pE?=
 =?utf-8?B?aFlVc0xrM1dJWXJtajFyN0VIMDdvVmV2RThacjU5VlE2UkpXUFB6VDdrcDRo?=
 =?utf-8?B?cVlHNEtQR3R5QWdZQkEwcHdkMTBoSGFCTGlUNGs3SHBRdzlWR3c5ZEc4RnVX?=
 =?utf-8?B?VjlBNjZzZzRrWGdlNzhaM1Q2YzhOa0IweWVUeklUT2F0M2ZSbG9CZG1TRDZG?=
 =?utf-8?B?QnByMjljaWpCdUxtT0dDTU9zZG1NaXFrRS9kSDJGY3F5aTVZcVNPTTc3Tjd0?=
 =?utf-8?B?dk9Ydk9lR2N0d1RWSVR2NTE4dHdkcG80NHY2T3lxQkpXL29qRUdQcENGWVVz?=
 =?utf-8?B?ZGVZZXJZQzFhVUMraENsbFdzWmo2ZEdvNVRxZC9vNDB3STJtclFaLzlwMEZk?=
 =?utf-8?B?a3UyYTJLYWxxbE5BN1ViY2p1K1owMmFuMTV6MHc0R3oyUGpWYWJvSCtwODdM?=
 =?utf-8?B?WG43UmtqK1pOTVBNTUFsSkNQdE5VZks0ZmkrR29KVDIzTlg3a21sbG1jMnVC?=
 =?utf-8?B?MWlBR2gyT09WVlErbHBhaXRvMDhHN2NqVnpIczBzaU0vY1BJbmExZlNCRktB?=
 =?utf-8?B?ZXhLOTZsVUhmQUVWbzRTdFZKUTlaWGFnVGhEaWtIQzkvQmRVNG9OdEh1WE5H?=
 =?utf-8?B?bFhieFhzQnFnNHRMelRsZisrNU42TFZ5M2lNVVBiakRZYUhjVHFJYWhtWEZm?=
 =?utf-8?B?czdGeGxJZlBrUk1vVEVvZnNGNTArYWNsNTNPc2xadFVJNkJIaWtXNGUvOGs3?=
 =?utf-8?B?RVBqbldCWVNvbXJDekVFZXFKZ2RoT3YrSXRRRDg1aXlkamNIRExiMlMram5P?=
 =?utf-8?B?Z05CS3A0ZkFEUlFDVXNyTkhZci96L0hKQk5sSnMzOFNQWWZDLzJ5Wll2ZWV2?=
 =?utf-8?B?NlBEcjBFTEZwUDYzK2R1a1JWRSs3dkFaV3dqNTNuRzJJQzdxeUg0bUZza0hz?=
 =?utf-8?B?eWxkUjZEejhNbS9TaEtHUzliZzdIWVRrME9rWnBSenNWZUE3Y1lleGtBeGQ4?=
 =?utf-8?B?VGZFT05rS0Q4T01rT01BUlhGZUpqcVR4ekN3OUt6V0x5K0FBbGhYVE0yV1dh?=
 =?utf-8?B?NnNycGRmZlU2SC9oUnV0cGc1VWRtK0wvTlZtZ2JxMmdrYWJXWHF2Ujd6N1FH?=
 =?utf-8?B?YW1sV1lBa2p5aDlrdW9FS2NFNFlRa2k1YTYyU2JkN0VMcTkvdE82YXZyRkF5?=
 =?utf-8?B?cGZaV0t1SzUrcFBnRWpNT2J1dWJ1MGYrTGVBS0E1NWxRaXhEUHVldFZHTjNE?=
 =?utf-8?B?M21EWVVjZUhJMkZUNldNdXpKajRVUVhwb0JTdHBSYnJNTFJ5dVVUUXVQNnJh?=
 =?utf-8?B?cXEyMFRvV2tUVkFzZXNUTUNnNmUvMmNpTFJ6K0YvRDh4bkx2ZnlTVzg0aUJP?=
 =?utf-8?B?dk1ibVU2WTI1Y0VNd0xXV2lrRmF6UGE1RGwrbzRiL01TeHp2eS96bmRCR0lh?=
 =?utf-8?B?RnZYdkkvMHgrK3p1VGFDY1Y2YkFFWnM3eTBTOGFBWEplRmpqd3h6ait2Q0xa?=
 =?utf-8?B?U0VVcnQwL0Fid2lCMTk4WjJ2K2NKMFY0MTdkelBKUzhDanlrK25zU21SV09Z?=
 =?utf-8?B?NWtpUGs4bDJqY0Fob0hIci9NcDF6V3EvUnpTLzlTc2hUMzRzc2hFbjFGYWNF?=
 =?utf-8?B?c08rYXhnZWUvU0hMV0FhcUcwU0tuYmdhNnRzaVpoek1iRzdSVW1YS2VoRmor?=
 =?utf-8?B?S2o2d1ZjNFhyNEJvUk93REY3UStZUE4vQkRGaVNWdjJkRCtlTGYzTFdka1lZ?=
 =?utf-8?B?L1E3dlp4M0c4L3BjSkdLZzBKUTNzcWNuckRla1FPaDdGN3RMVElXYWt0VnVY?=
 =?utf-8?B?N0FpaWRWQ2hrdzVRazNiaHMybUJ5WVdhZTQyMW1UdUsvTTBLZ3Mrekk3NTN1?=
 =?utf-8?B?MlB0Nmw5U1JFeEdUY0d0TUM1YkZFTVZ6bGpxQUMxQ1pZOWdoNHR5OE40TE5t?=
 =?utf-8?B?cStTYmhTdmlELzl1U0RqWEFyeSt3K3B4cnk1T1BMUHVXamQ2NEtUbHFPbHdC?=
 =?utf-8?B?ejQxVjBjczFaTS9QemNxSHo3dHBaeUNWYjJ6QmYwdFFVZElMb3Q3NGN2MmlT?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9920e39-8a73-4675-667b-08dda8b72355
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 07:11:08.5903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7s0lT5ym8vrPL3zPlA+p9cDjg5NbVxQ327jh/+kOkdctU0fRJNKtbco0Yw74jtzNp5Cf/0Z4kSAsyaBnkuNOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5301
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


On 05-06-2025 22:27, Riana Tauro wrote:
> Hi Soham
>
> Code looks good. Have one question and few minor comments below
>
> On 5/22/2025 9:14 PM, Soham Purkait wrote:
>> Introduce vendor-agnostic support for
>> handling multiple GPUs and instances
>> in gputop. Improve the tool's adaptability
>> to various GPU configurations.
>>
>> v2 : Fix for refactoring GPUTOP into a
>>       vendor-agnostic tool. (Lucas)
>>
>> v3 : New year included in copyright. (Kamil, Riana)
>>       Removed caps in function name. (Riana)
>>       Struct for driver specific operations. (Riana)
>>       Headers in alphabetical order. (Kamil, Riana)
>>
>> v4 : Commit description and signed-off included.
>>
>> v5 : Fix for proper resource cleanup. (Riana)
>>       Use "dev_type" enum for card_type. (Krzysztof)
>>       Add new filter to return collection
>>       of matching devices.               (Zbigniew)
>>
>> v6 : Use device filter to populate the array of
>>       cards for all supported drivers.   (Zbigniew)
>>
>> v7 : Use filter to find all the cards.  (Zbigniew)
>>
>> v8 : Removed 'drivers' array parameter from
>>       card match function.               (Zbigniew)
>>
>> v10 : Resolved 'populate_devices' call with
>>        pci subsystem filtering.          (Zbigniew)
>>
>> v11 : Add space after /* and before */ for better
>>        readability.                      (Zbigniew)
>>        Comments wrapped at 75/100.       (Riana)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>>
>> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> ---
>>   tools/{ => gputop}/gputop.c | 223 +++++++++++++++++++++++++++++-------
>>   tools/gputop/meson.build    |   6 +
>>   tools/meson.build           |   6 +-
>>   3 files changed, 191 insertions(+), 44 deletions(-)
>>   rename tools/{ => gputop}/gputop.c (66%)
>>   create mode 100644 tools/gputop/meson.build
>>
>> diff --git a/tools/gputop.c b/tools/gputop/gputop.c
>> similarity index 66%
>> rename from tools/gputop.c
>> rename to tools/gputop/gputop.c
>> index 43b01f566..fc3ccb83b 100644
>> --- a/tools/gputop.c
>> +++ b/tools/gputop/gputop.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: MIT
>>   /*
>> - * Copyright © 2023 Intel Corporation
>> + * Copyright © 2023-2025 Intel Corporation
>>    */
>>     #include <assert.h>
>> @@ -14,66 +14,145 @@
>>   #include <math.h>
>>   #include <poll.h>
>>   #include <signal.h>
>> +#include <stdbool.h>
>>   #include <stdint.h>
>>   #include <stdio.h>
>>   #include <stdlib.h>
>>   #include <string.h>
>> +#include <sys/sysmacros.h>
>
> alphabetical
>
>>   #include <sys/ioctl.h>
>>   #include <sys/stat.h>
>>   #include <sys/types.h>
>> -#include <unistd.h>
>>   #include <termios.h>
>> -#include <sys/sysmacros.h>
>> -#include <stdbool.h>
>> +#include <unistd.h>
>>   +#include "drmtest.h"
>>   #include "igt_core.h"
>>   #include "igt_drm_clients.h"
>>   #include "igt_drm_fdinfo.h"
>> +#include "igt_perf.h"
>>   #include "igt_profiling.h"
>> -#include "drmtest.h"
>> +#include "xe_gputop.h"
>> +#include "xe/xe_query.h"
>> +
>> +/**
>> + * Supported Drivers
>> + *
>> + * Adhere to the following requirements when implementing support 
>> for the
>> + * new driver:
>> + * @drivers: Update drivers[] with driver string.
>> + * @total_count: Update NUM_DRIVER with the total number of 
>> supported drivers.
>> + * @operations: Update the respective operations of the new driver:
>> + * gputop_init,
>> + * discover_engines,
>> + * pmu_init,
>> + * pmu_sample,
>> + * print_engines,
>> + * clean_up
>> + * @devices: Update devices[] array of type "struct gputop_device" 
>> with the
>> + * initial values.
>> + */
>> +static const char * const drivers[] = {
>> +    "xe",
>> +    /* Keep the last one as NULL */
>> +    NULL
>> +};
>> +
>> +/**
>> + * Number of supported drivers needs to be adjusted as per the 
>> length of
>> + * the drivers[] array.
>> + */
>> +#define NUM_DRIVER 1
>> +
>> +/**
>> + * Supported operations on driver instances. Update the oprs[] array 
>> for
>> + * each individual driver specific function. Maintain the sequence 
>> as per
>> + * drivers[] array.
>> + */
>> +struct device_operations oprs[NUM_DRIVER] = {
>
> Replace oprs with ops.. generally use ops for operations
Isn't ops more sound like options ?
>> +    {
>> +        xe_gputop_init,
>> +        xe_populate_engines,
>> +        xe_pmu_init,
>> +        xe_pmu_sample,
>> +        xe_print_engines,
>> +        xe_clean_up
>> +    }
>> +};
>> +
>> +/*
>> + * devices[] array of type struct gputop_device
>> + */
>> +struct gputop_device devices[] = {
>
> I must have commented here before. As i see this is one entry per 
> driver right? why is it named device?

Actually this is keeping track of the devices for each driver, so the name.

I have updated the description for better readability.

>
>> +    {false, 0, NULL}
>> +};
>>     enum utilization_type {
>>       UTILIZATION_TYPE_ENGINE_TIME,
>>       UTILIZATION_TYPE_TOTAL_CYCLES,
>>   };
>>   -static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", 
>> "▉", "█" };
>> -
>> -#define ANSI_HEADER "\033[7m"
>> -#define ANSI_RESET "\033[0m"
>> -
>> -static void n_spaces(const unsigned int n)
>> +static void gputop_clean_up(void)
>>   {
>> -    unsigned int i;
>> -
>> -    for (i = 0; i < n; i++)
>> -        putchar(' ');
>> +    for (int i = 0; drivers[i]; i++) {
>> +        oprs[i].clean_up(devices[i].instances, devices[i].len);
>> +        free(devices[i].instances);
>> +        devices[i].driver_present = false;
>> +        devices[i].len = 0;
>> +    }
>>   }
>>   -static void print_percentage_bar(double percent, int max_len)
>> +static int find_driver(struct igt_device_card *card)
>>   {
>> -    int bar_len, i, len = max_len - 1;
>> -    const int w = 8;
>> -
>> -    len -= printf("|%5.1f%% ", percent);
>> -
>> -    /* no space left for bars, do what we can */
>> -    if (len < 0)
>> -        len = 0;
>> -
>> -    bar_len = ceil(w * percent * len / 100.0);
>> -    if (bar_len > w * len)
>> -        bar_len = w * len;
>> +    for (int i = 0; drivers[i]; i++) {
>> +        if (strcmp(drivers[i], card->driver) == 0)
>> +            return i;
>> +    }
>> +    return -1;
>> +}
>>   -    for (i = bar_len; i >= w; i -= w)
>> -        printf("%s", bars[w]);
>> -    if (i)
>> -        printf("%s", bars[i]);
>> +/*
>> + * If filter is not NULL i will be ignored.
>> + */
>> +static int populate_device_instances(const char *filter)
>> +{
>> +    struct igt_device_card *cards = NULL;
>> +    struct igt_device_card *card_inplace = NULL;
>> +    struct gputop_device *dev =  NULL;
>> +    int driver_no;
>> +    int count, final_count = 0;
>
> %s/final_count/card_count
Here count and final_count both are keeping track of the cards but 
final_count is the count of supported filtered devices, so the name.
>
>> +
>> +    count = igt_device_card_match_all(filter, &cards);
>> +    for (int j = 0; j < count; j++) {
>> +        if (strcmp((cards + j)->subsystem, "pci") != 0)
>> +            continue;
>>   -    len -= (bar_len + (w - 1)) / w;
>> -    n_spaces(len);
>> +        driver_no = find_driver(cards + j);
>> +        if (driver_no < 0)
>> +            continue;
>>   -    putchar('|');
>> +        dev = devices + driver_no;
>> +        if (!dev->driver_present)
>> +            dev->driver_present = true;
>> +        dev->len++;
>> +        dev->instances = realloc(dev->instances,
>> +                     dev->len * sizeof(struct xe_gputop));
>> +        if (!dev->instances) {
>> +            fprintf(stderr,
>> +                "Device instance realloc failed (%s)\n",
>> +                strerror(errno));
>> +            exit(EXIT_FAILURE);
>> +        }
>> +        card_inplace = (struct igt_device_card *)
>> +                calloc(1, sizeof(struct igt_device_card));
>> +        memcpy(card_inplace, cards + j, sizeof(struct 
>> igt_device_card));
>> +        oprs[driver_no].gputop_init((struct xe_gputop 
>> *)(dev->instances + dev->len - 1),
>> +            card_inplace);
>> +        final_count++;
>> +    }
>> +    if (count)
>> +        free(cards);
>> +    return final_count;
>>   }
>>     static int
>> @@ -333,6 +412,7 @@ static void clrscr(void)
>>   struct gputop_args {
>>       long n_iter;
>>       unsigned long delay_usec;
>> +    char *device;
>>   };
>>     static void help(void)
>> @@ -343,16 +423,18 @@ static void help(void)
>>              "\t-h, --help                show this help\n"
>>              "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS 
>> [.TENTHS]\n"
>>              "\t-n, --iterations =NUMBER  number of executions\n"
>> +           "\t-D, --device              Device filter\n"
>>              , program_invocation_short_name);
>>   }
>>     static int parse_args(int argc, char * const argv[], struct 
>> gputop_args *args)
>>   {
>> -    static const char cmdopts_s[] = "hn:d:";
>> +    static const char cmdopts_s[] = "hn:d:D:";
>>       static const struct option cmdopts[] = {
>>              {"help", no_argument, 0, 'h'},
>>              {"delay", required_argument, 0, 'd'},
>>              {"iterations", required_argument, 0, 'n'},
>> +           {"device", required_argument, 0, 'D'},
>>              { }
>>       };
>>   @@ -360,6 +442,7 @@ static int parse_args(int argc, char * const 
>> argv[], struct gputop_args *args)
>>       memset(args, 0, sizeof(*args));
>>       args->n_iter = -1;
>>       args->delay_usec = 2 * USEC_PER_SEC;
>> +    args->device = NULL;
>>         for (;;) {
>>           int c, idx = 0;
>> @@ -383,6 +466,9 @@ static int parse_args(int argc, char * const 
>> argv[], struct gputop_args *args)
>>                   return -1;
>>               }
>>               break;
>> +        case 'D':
>> +            args->device = optarg;
>> +            break;
>>           case 'h':
>>               help();
>>               return 0;
>> @@ -422,6 +508,52 @@ int main(int argc, char **argv)
>>       n = args.n_iter;
>>       period_us = args.delay_usec;
>>   +    if (!populate_device_instances(args.device ? args.device
>> +                       : "device:subsystem=pci,card=all")) {
>> +        printf("No device found.\n");
>> +        gputop_clean_up();
>> +        exit(1);
>> +    }
>> +
>> +    for (int i = 0; drivers[i]; i++) {
>> +        if (devices[i].driver_present) {
>
> if not present continue
It will be at the end of the outer loop if not present so it eventually  
continues.
>
> Thanks
> Riana
>
>> +            for (int j = 0; j < devices[i].len; j++) {
>> +                if (!oprs[i].init_engines(devices[i].instances + j)) {
>> +                    fprintf(stderr,
>> +                        "Failed to initialize engines! (%s)\n",
>> +                        strerror(errno));
>> +                        gputop_clean_up();
>> +                    return EXIT_FAILURE;
>> +                }
>> +                ret = oprs[i].pmu_init(devices[i].instances + j);
>> +
>> +                if (ret) {
>> +                    fprintf(stderr,
>> +                        "Failed to initialize PMU! (%s)\n",
>> +                        strerror(errno));
>> +                    if (errno == EACCES && geteuid())
>> +                        fprintf(stderr,
>> +                            "\n"
>> +                            "When running as a normal user 
>> CAP_PERFMON is required to access performance\n"
>> +                            "monitoring. See \"man 7 capabilities\", 
>> \"man 8 setcap\", or contact your\n"
>> +                            "distribution vendor for assistance.\n"
>> +                            "\n"
>> +                            "More information can be found at 'Perf 
>> events and tool security' document:\n"
>> + 
>> "https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html\n");
>> +
>> +                    igt_devices_free();
>> +                    gputop_clean_up();
>> +                    return EXIT_FAILURE;
>> +                }
>> +            }
>> +        }
>> +    }
>> +
>> +    for (int i = 0; drivers[i]; i++) {
>> +        for (int j = 0; devices[i].driver_present && j < 
>> devices[i].len; j++)
>> +            oprs[i].pmu_sample(devices[i].instances + j);
>> +    }
>> +
>>       clients = igt_drm_clients_init(NULL);
>>       if (!clients)
>>           exit(1);
>> @@ -442,14 +574,27 @@ int main(int argc, char **argv)
>>         while ((n != 0) && !stop_top) {
>>           struct igt_drm_client *c, *prevc = NULL;
>> -        int i, engine_w = 0, lines = 0;
>> +        int k, engine_w = 0, lines = 0;
>>             igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
>> +
>> +        for (int i = 0; drivers[i]; i++) {
>> +            for (int j = 0; devices[i].driver_present && j < 
>> devices[i].len; j++)
>> +                oprs[i].pmu_sample(devices[i].instances + j);
>> +        }
>> +
>>           igt_drm_clients_sort(clients, client_cmp);
>>             update_console_size(&con_w, &con_h);
>>           clrscr();
>>   +        for (int i = 0; drivers[i]; i++) {
>> +            for (int j = 0; devices[i].driver_present && j < 
>> devices[i].len; j++) {
>> +                lines = oprs[i].print_engines(devices[i].instances + j,
>> +                             lines, con_w, con_h);
>> +            }
>> +        }
>> +
>>           if (!clients->num_clients) {
>>               const char *msg = " (No GPU clients yet. Start workload 
>> to see stats)";
>>   @@ -457,7 +602,7 @@ int main(int argc, char **argv)
>>                      (int)(con_w - strlen(msg) - 1), msg);
>>           }
>>   -        igt_for_each_drm_client(clients, c, i) {
>> +        igt_for_each_drm_client(clients, c, k) {
>>               assert(c->status != IGT_DRM_CLIENT_PROBE);
>>               if (c->status != IGT_DRM_CLIENT_ALIVE)
>>                   break; /* Active clients are first in the array. */
>> @@ -481,11 +626,11 @@ int main(int argc, char **argv)
>>       }
>>         igt_drm_clients_free(clients);
>> +    gputop_clean_up();
>>         if (profiled_devices != NULL) {
>>           igt_devices_configure_profiling(profiled_devices, false);
>>           igt_devices_free_profiling(profiled_devices);
>>       }
>> -
>>       return 0;
>>   }
>> diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
>> new file mode 100644
>> index 000000000..4766d8496
>> --- /dev/null
>> +++ b/tools/gputop/meson.build
>> @@ -0,0 +1,6 @@
>> +gputop_src = [ 'gputop.c', 'utils.c', 'xe_gputop.c']
>> +executable('gputop', sources : gputop_src,
>> +           install : true,
>> +           install_rpath : bindir_rpathdir,
>> +           dependencies : 
>> [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
>> +       install: true)
>> diff --git a/tools/meson.build b/tools/meson.build
>> index de866c392..8002f707d 100644
>> --- a/tools/meson.build
>> +++ b/tools/meson.build
>> @@ -69,11 +69,6 @@ if libudev.found()
>>              install : true)
>>   endif
>>   -executable('gputop', 'gputop.c',
>> -           install : true,
>> -           install_rpath : bindir_rpathdir,
>> -           dependencies : 
>> [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
>> -
>>   intel_l3_parity_src = [ 'intel_l3_parity.c', 
>> 'intel_l3_udev_listener.c' ]
>>   executable('intel_l3_parity', sources : intel_l3_parity_src,
>>          dependencies : tool_deps,
>> @@ -122,3 +117,4 @@ endif
>>   subdir('i915-perf')
>>   subdir('xe-perf')
>>   subdir('null_state_gen')
>> +subdir('gputop')
>
