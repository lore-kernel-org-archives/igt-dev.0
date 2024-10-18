Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82544D3C553
	for <igt-dev@archiver.kernel.org>; Fri, 18 Oct 2024 07:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4213110E0A8;
	Fri, 18 Oct 2024 07:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MH6GeH3L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1302110E0A8
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Oct 2024 07:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729235849; x=1760771849;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0LUrKsGYRWFhZ/+tCd3G+rsCiHjrnmlpjcGDS/1FLXQ=;
 b=MH6GeH3L9fskURLrmX2qT8QQAa3rHfLbREYjSCa6nJOIF6NHzSrUs6in
 LzxLG2oYtO8j1jtOseIwwHQNHZeDdm5BfAIHv7yhqn0H4mLelnJHyF2/0
 zA2gupM5E/eixOT77Og1Kt6DsWazM+nLb9dK2pAhTy4qPw5I6w2Jxp5Xd
 4F1jtkgKSfOy0xEmk4FNhXG/S75Yx2mZr2xccTfad/Oih/0PoeOkGxbxR
 FQumwAhwcvfK1PSkztwM/gOiMvpOD2QIYTqlI1mrHOOlN4H+oroJoP8m2
 qIXFCPaVs0rlcPvzQNvY3tn0tXL/YVSDs8e/RZJ+ORlprIClxF2bgC4wo Q==;
X-CSE-ConnectionGUID: vo1datqEQPKJZtQPFSQHrw==
X-CSE-MsgGUID: WGdSL8cZTDq+F0Ba89LLdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="40153690"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="40153690"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 00:17:29 -0700
X-CSE-ConnectionGUID: i3oygt76QI6hdtgzjiU54A==
X-CSE-MsgGUID: 1g7ToQnwQ+O25C7wox36yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="83368701"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 00:17:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 00:17:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 00:17:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 00:17:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 00:17:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgcNX2S66s5g4Exm3kefjap9yy72ZL9LTCmjff7eDfS8bgAkIWClN0OPm2MMWoyaOeShdY4jyfptIYV4AmsxYroLqWKGpPzKH7kbiTm076CwaugBqfe7lkfMKh5J1oixRFnsATwo0jBlWIH+AI2Ek+5cJgS/98Y0Nl9Nf6Kt1MIfpJjLuoZ8jPRHybXHamiB+0iLRaOIVFFhZmEZETzWuF+ndjmpdu2JRr2U0HXec98VawYUb2o55jRq9bwGzYWfj85Bs0+aU5Cbf+j2hPjQqDYZwT61UxBgVermj3FOV1+wHbWYRv//P/XcOdhKCpei2A+K0rKwSw222x92/wgd9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIm62diBmO0Nxibk1CuYZRf2vkXDQk8Ahx4a2koAP3k=;
 b=rEMXDFmuP3LkUQf+vhtZmjoTcam5qe8kVG4Bd4Gm1+CWTDqo1DQKhlFvIqsuleCv94KsrcZHtde3OHnP4WBfljW7aCavmjhJrzQXqAkSzeOOMlHCRybQPE4VDW2mCZizL7O/dmHzNUYNvoiAC8naWizfEBCkwKkNYRPUYxVueE6JUE2SmLj+U5J2b+dizo88HhbgLTHbP4cbv+rjouf8e5u8yzcu0G/g+92gOr0nWFjHXDwwCQdU39akuIQkQgt5cuxafaIV9ZOe6Wc1PirFmZuf4WYWSsnyhteyHV2UU6G2zubLCNuPiZcc6ySIouenHKdOzbrpixlPZFf8sDkJ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by MN2PR11MB4565.namprd11.prod.outlook.com (2603:10b6:208:26a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Fri, 18 Oct
 2024 07:17:25 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 07:17:24 +0000
Message-ID: <2b0d697b-779b-45cd-a697-77eefe61d7c4@intel.com>
Date: Fri, 18 Oct 2024 09:17:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/6] tests/intel/xe_sriov_flr: Implement clear-lmem
 subcheck
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Satyanarayana
 K V P <satyanarayana.k.v.p@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20241009113018.741371-1-marcin.bernatowicz@linux.intel.com>
 <20241009113018.741371-6-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241009113018.741371-6-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0085.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::7) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|MN2PR11MB4565:EE_
X-MS-Office365-Filtering-Correlation-Id: 935518b3-733c-4b41-6c38-08dcef44ea4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGFzWkhDNlNzL3d1SjJaZlpPSXJmT1NpMkJPbjlENm5sb25Id1E5RFhlTzZq?=
 =?utf-8?B?V2o3UUNFOXVYQVdaUUc4RGFtTjlTR3NMVW5Zb2VkemF4VEEwUmMvRU9VT2RO?=
 =?utf-8?B?RE1rbUxxMDEyQVltYzJPYlRaTjFJMkFnTzRxUEl3bDBwMnhwY3NTbndwNGtn?=
 =?utf-8?B?b0pyNHlzSk8zVW41aUpxdjhzekJqWE0ybzQ5QzVBam1IVjl6ajZaOE5XQ1lC?=
 =?utf-8?B?elZZNm1raGhPN3RhcnpmU3ZReXozdjlLeUpCcFBNc2RrVnE3dzJ2VXByRVhJ?=
 =?utf-8?B?SkQyUXNUNDJ2aXZtREhybjFXVHVBZUMyMGxMcUJjT3FqWlh5NktCUFRNNUtZ?=
 =?utf-8?B?RlZzVXJrSWhFUlN6Z2txemQ2bStEVWxldmJrNnRsOHhDOTFPSHExLzNhN09o?=
 =?utf-8?B?T0tkb1BRKytheVlERmFvZ2VsTXkyYXo5dGx1RktQd0RiYTFjYm1EN2ZqazZa?=
 =?utf-8?B?Q1ZBSHl4eEtVdElnT2czWXR6TERWTllVaUEwaGJHSHpGVXlYcS9VVTBiUzBi?=
 =?utf-8?B?RkFpek1qUGkwSklFSjVNL0NTTktvRzdqQTdDcTJvR0IyQzhDWHpHZUVUUzdH?=
 =?utf-8?B?SzdBK2I2KzN6WlVJZFU4SkZ6amYxWmlOdmE2VWVneC8rTG9nSUlKYi9TOVl0?=
 =?utf-8?B?a1JzcExRR3o2YkF2N0lIcjJENUg0S1JtS0d3WDhZNGZEQ01ES2Q5VUZnOXdu?=
 =?utf-8?B?UkpST1BGQ2FucCtUZEZvTUNnSk9TVzdlRFhDTTVHZG96cUgrQ294aVNidDhK?=
 =?utf-8?B?MWN5Rk5UTW9iY1Vmby81dmlKYjFQMmthMEo4bEFsV1pJemJoUVVLbnFWZ1Zw?=
 =?utf-8?B?VGxiZ05zNDZsVEk4VjFhdzRHWlBtRHlibWZ5ak1yK1VjTGZNYmc0aC9GMUhL?=
 =?utf-8?B?YlBIaVViQXdkd3lNZ255ZWxLUlFQUmY2eDFNL1BTSm5KU003Sk1oR1pEdVVJ?=
 =?utf-8?B?cjRuYVBRY2V1Z3JQRVBwbjNVd2NuRk1JbEtrcjBVbkhGK1pHaTkrQVZ0K2lC?=
 =?utf-8?B?bklzVU94YmN2YUFQckFtOVdVaklFNndjUVY5VVVndTUrQVV3a2o3Q1RuRXBD?=
 =?utf-8?B?M3h6YjVpc1cwUkdNclBMMFJLMEJKZ3h2bzM3UkJjamtLdXRYM3NrQWx0Zy9F?=
 =?utf-8?B?cFJQVHlGOVROMWF1enhPcXVrWE50OUwyVldRYXd4LzN2aGVXWGM2Zm5oUG1m?=
 =?utf-8?B?YTR4OTlyd1g3OE1oZGtDVDJwYUpHcnpnVEs0cU9ieEdHUTdPYmZpbEVXMmRW?=
 =?utf-8?B?bFVpeWtDSGJHUlZnWXhUaDFOZ3IyczA0RStxWTBUaWFBNWJ3ZjdDQk5Vd3Jr?=
 =?utf-8?B?Z0ZTZnVESTBYLzloUWgzYUN4NWFseDBoWWJ1RzZuelQyaGsxV1NOL0g0elcz?=
 =?utf-8?B?WjAyTWlOTHgwdlFqQXRvTGRTT0NFallZR29lT0pUOElpQnhvWUJRN2VoTlFU?=
 =?utf-8?B?SUVYdFFPRHVVeXJLS3hmM0djbjVlbTFQZ0tZRVZGTXJjdEY2VkszMGdZMW1y?=
 =?utf-8?B?Y21mY0FwUGdCWW83Rml5MXlTWFNKckpPTmRFdU9zWG5QeE5YNGRESzdPS3Qy?=
 =?utf-8?B?WXlyNGp0d2wwZStiZjZUZ0JLRWt1eUxvQVRkRVNic01seG5CbUp5Q29HU2dJ?=
 =?utf-8?B?YnR4Sm5TZzhyQVBOL3prQ0V1VVB6a1lIZm9GamdRaUYxY0hlNGJUcFB4YzBo?=
 =?utf-8?B?aXlvdjdlSVZESkd1cWowdlJOaktJMGl3aGtOS0Q0RFh1NDZzZzZ6RlpBVm44?=
 =?utf-8?Q?Z5aeYmKSS6iK4E/HeffkDpCw8XyV9ZZ5f4ouq9O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVFoV3JQZXAyQUdNMTdHUTQvYllYMHlVT0dqTWJCZXF4SDFFYWZIKzFzeDY0?=
 =?utf-8?B?aEZIN2thY1N5cnBPYU9HNSsxTi9sK2krSjZOWUxNekZrWlJPWEZtWTNtNFJK?=
 =?utf-8?B?blQ3VjA3akRZRGxCYXpRbE9OOTBnam16M2NHSE5WQjExYllUWnJRR0w2SXU3?=
 =?utf-8?B?R0dESC9DT29CUXhxZU45MDlTWTNtQlZDbkF3RXlzb0o0Y003ZFRSVWZORGxW?=
 =?utf-8?B?UEhJWmw3UEdOekFwb2tYbHFHbUJLUVlScjVaVEd1NFBWUTE1c0xlNC91clRn?=
 =?utf-8?B?UmZoUjRZK2d4d2JwdkcyZEo5OUdjRm9NS3dnaUNsQlRNZmw0RkFIYkZ5Yjhh?=
 =?utf-8?B?Q0d5UzlHSmtqUzAzWnVCWW9VRkhkL3oyVFZ2WGFvNUpVbW9NVU5xQW01VEk0?=
 =?utf-8?B?cW1ZS1k0QWhyMFdFem5QQVp2OWtZbFdNeXZudnR1TXpscE8zQUF2YjRlWWFp?=
 =?utf-8?B?WUFrWnR2cU51WCtDdWJGc1Y0QlNVNWdmSnZDV1d2ZnBqQWFucW1BWk4ramVU?=
 =?utf-8?B?eE4xMXVwVW5nY2JrWjV5L3Q5OTNkYm1YUXBOMVJ0OE55M1lselBQQlFHOWVZ?=
 =?utf-8?B?L3hObzJVZW82T0l1TGtHb0NZUkxZSFp0MDNGdkNRSDlBSjJCVy93N3k5Y3Z1?=
 =?utf-8?B?OGZmNlJlbEVKZnpXcDM4WEFxMmN1YTFFdU54UzVtSjBWd0haRjJVenRyTklH?=
 =?utf-8?B?Q1g0ZWdiTnk1bER1eXRZdlBVS2svbDB2bXloek14YS9SdUhrL0VFOUJ1YWE0?=
 =?utf-8?B?SFp2MWhHMHBIR01zaTdBTjNlUFVTRkszV2xwODBNUFJOcGp3aEZOQXBtek9C?=
 =?utf-8?B?OHRoSFJjZDdFWDFhbm5lc0pONWRrYWJENDdmbEhvaTBNYkE2OFFia1Y5a0pN?=
 =?utf-8?B?Y2kyZm9JUTBLMURUSm1nTlN5SkNRSzdDaFhTdERYVjJvS2d6akpOUEMxdm5I?=
 =?utf-8?B?VWs0T2xyRFhuem5henFTbjN2NE1rNTlUNWVmNkY2YWR3TUROSWFxazN0dTRR?=
 =?utf-8?B?bVFJUzRyNVhhSEtPU09Ob29INWoxU2xrK0w2WCt0WUI4b0kyVldWdXB1TWp4?=
 =?utf-8?B?bkxtd0pJNmF3emNIcnNBWHgxUUVyQ2Y0bGpHUDB0Szc5N2l0S1pCQzJpYnd0?=
 =?utf-8?B?V3lDQWQyRUtOSlZacVlOM3h0dG1VQU1Pc285S1dGL3BuTVFQaGFPVGovSHlZ?=
 =?utf-8?B?WWdDZ1dVd0JmalNYSkFtU0JmY3RoajlYbE1SUElRY1Y0R3VEMGRQOXIrd1BL?=
 =?utf-8?B?cUxkMUxtYVpPeiszbzBURVJYUTJPZm5SZ3c0OFpKeWZoWWcxQlNST0NoQkFv?=
 =?utf-8?B?RTRza0g5L3VEbEMyOWhoRnJ4N2wzWXZGOFBGOHg1SmxGNkk0Mno2L1hqL2V6?=
 =?utf-8?B?ZFI4WmhWNmtPZ3N0N2hPS1pKbjh3Ung2cllrZEJPSnJVZ1E5bG50OHpvT1J3?=
 =?utf-8?B?RTFhZ29UMzRrUTQrMmtqVG9zdEJBdkxnWlg0QVZaMXV3S2tqSWhJTGRJSDd4?=
 =?utf-8?B?ZFlRV09mY2RZVHZ4czJ5ei9XN1VUUlZaWnU0bXkwL0IwYWRGbHNHWmVYTkZV?=
 =?utf-8?B?QUlqdDBPbDNJQXpTSGV6Tng4ditqY29hVzFvS2IwRmhzZC9iVHVQWWhiSTJv?=
 =?utf-8?B?ZGVVM3daS0kvdUdhdEcvZW8vSkVrOWx1TWxyV09pbm5xaDFpaTVyY2ZRVmxM?=
 =?utf-8?B?L0xXeVJaQzdEYlFhZmo5Z0RuOHdUNDV2c3F4ZDRSVXFjV3hPVVV0R2YzRlF1?=
 =?utf-8?B?Wmk0WHMvc281bFpqcU1yNjM2UGMyeG1lSk9WU2N1WlN2NVJtR016dnBKWDRo?=
 =?utf-8?B?Q01IaFFxWEptS2xXUEltRzRRT3RmTHR0OFN6ZFE0UUJVU2h6blIwN0htSXQv?=
 =?utf-8?B?d3UxVGhNVzg3dmZDRkE4aEtNcStVYkFqbW1acENTdjA5bU5iUXdpcFlIS0lr?=
 =?utf-8?B?RzkxWEJnY2dYNDVOUjFTSHVKNFpaMnFrdWUyUVgvVFZFelJWL01zaEgwK2VL?=
 =?utf-8?B?VTNkcnNCQm53Q1BVZWZTRDFqcUEzb3IxZU1XMTcyNFdEYXZ0VUIwYlQ3Q0Yw?=
 =?utf-8?B?SkJQcDk5UGhwTEFwUGhxaEVRV1FVUzJVdCtuWjYrOFFqak1ITTltMm9QendY?=
 =?utf-8?Q?/cc3hqaa3TNWsNVk/SYt5drFV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 935518b3-733c-4b41-6c38-08dcef44ea4f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 07:17:24.9486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vcm7Vgmo/7lP4R5d5IkKMCbQxtmcdNOfoaeylQ7FnsdICB2CIcjoiY4gIj3DZvQtnxFFRzhkG5RqEBPaf/m/Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4565
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


On 10/9/2024 13:30, Marcin Bernatowicz wrote:
> Add the clear-lmem subcheck to validate the isolation and clearing of a
> Virtual Function's (VF) local memory (LMEM) after a Functional Level
> Reset (FLR).
>
> The test maps the VF's LMEM, writes specific patterns to the memory,
> and checks whether the content is reset for the FLRed VF or retained
> for other VFs.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   tests/intel/xe_sriov_flr.c | 213 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 212 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 3bce235de..4c97c83a4 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -3,6 +3,8 @@
>    * Copyright(c) 2024 Intel Corporation. All rights reserved.
>    */
>   
> +#include <fcntl.h>
> +#include <sys/stat.h>
>   #include "drmtest.h"
>   #include "igt_core.h"
>   #include "igt_sriov_device.h"
> @@ -505,12 +507,214 @@ static void ggtt_subcheck_cleanup(struct subcheck_data *data)
>   		xe_mmio_access_fini(gdata->mmio);
>   }
>   
> +struct lmem_data {
> +	struct subcheck_data base;
> +	size_t *vf_lmem_size;
> +};
> +
> +struct lmem_info {
> +	/* pointer to the mapped area */
> +	char *addr;
> +	/* size of mapped area */
> +	size_t size;
> +};
> +
> +const size_t STEP = SZ_1M;
> +
> +static void *mmap_vf_lmem(int pf_fd, int vf_num, size_t length, int prot, off_t offset)
> +{
> +	int open_flags = ((prot & PROT_WRITE) != 0) ? O_RDWR : O_RDONLY;
> +	struct stat st;
> +	int sysfs, fd;
> +	void *addr;
> +
> +	sysfs = igt_sriov_device_sysfs_open(pf_fd, vf_num);
> +	if (sysfs < 0) {
> +		igt_debug("Failed to open sysfs for VF%d: %s\n", vf_num, strerror(errno));
> +		return NULL;
> +	}
> +
> +	fd = openat(sysfs, "resource2", open_flags | O_SYNC);
> +	close(sysfs);
> +	if (fd < 0) {
> +		igt_debug("Failed to open resource2 for VF%d: %s\n", vf_num, strerror(errno));
> +		return NULL;
> +	}
> +
> +	if (fstat(fd, &st)) {
> +		igt_debug("Failed to stat resource2 for VF%d: %s\n", vf_num, strerror(errno));
> +		close(fd);
> +		return NULL;
> +	}
> +
> +	if (st.st_size < length) {
> +		igt_debug("Mapping length (%lu) exceeds BAR2 size (%lu)\n", length, st.st_size);
> +		close(fd);
> +		return NULL;
> +	}
> +
> +	addr = mmap(NULL, length, prot, MAP_SHARED, fd, offset);
> +	close(fd);
> +	if (addr == MAP_FAILED) {
> +		igt_debug("Failed mmap resource2 for VF%d: %s\n", vf_num, strerror(errno));
> +		return NULL;
> +	}
> +
> +	return addr;
> +}
> +
> +static uint64_t get_vf_lmem_size(int pf_fd, int vf_num)
> +{
> +	/* limit to first two pages */

When the debugfs with provisioned size is exposed I think we should 
check the whole LMEM. For now it's OK, but if we agree then maybe 
instead of this comment we can add "TODO: ... (e.g. use actual VF LMEM 
size)" to don't forget?

> +	return SZ_4M;
> +}
> +
> +static void munmap_vf_lmem(struct lmem_info *lmem)
> +{
> +	igt_debug_on_f(munmap(lmem->addr, lmem->size),
> +		       "Failed munmap %p: %s\n", lmem->addr, strerror(errno));
> +}
> +
> +static char lmem_read(const char *addr, size_t idx)
> +{
> +	return READ_ONCE(*(addr + idx));
> +}
> +
> +static char lmem_write_readback(char *addr, size_t idx, char value)
> +{
> +	WRITE_ONCE(*(addr + idx), value);
> +	return lmem_read(addr, idx);
> +}
> +
> +static bool lmem_write_pattern(struct lmem_info *lmem, char value, size_t start, size_t step)
> +{
> +	char read;
> +
> +	for (; start < lmem->size; start += step) {
> +		read = lmem_write_readback(lmem->addr, start, value);
> +		if (igt_debug_on_f(read != value, "LMEM[%lu]=%u != %u\n", start, read, value))
> +			return false;
> +	}
> +	return true;
> +}
> +
> +static bool lmem_contains_expected_values_(struct lmem_info *lmem,
> +					   char expected, size_t start,
> +					   size_t step)
> +{
> +	char read;
> +
> +	for (; start < lmem->size; start += step) {
> +		read = lmem_read(lmem->addr, start);
> +		if (igt_debug_on_f(read != expected,
> +				   "LMEM[%lu]=%u != %u\n", start, read, expected))
> +			return false;
> +	}
> +	return true;
> +}
> +
> +static bool lmem_contains_expected_values(int pf_fd, int vf_num, size_t length,
> +					  char expected)
> +{
> +	struct lmem_info lmem = { .size = length };
> +	bool result;
> +
> +	lmem.addr = mmap_vf_lmem(pf_fd, vf_num, length, PROT_READ | PROT_WRITE, 0);
> +	if (igt_debug_on(!lmem.addr))
> +		return false;
> +
> +	result = lmem_contains_expected_values_(&lmem, expected, 0, STEP);
> +	munmap_vf_lmem(&lmem);
> +
> +	return result;
> +}
> +
> +static bool lmem_mmap_write_munmap(int pf_fd, int vf_num, size_t length, char value)
> +{
> +	struct lmem_info lmem;
> +	bool result;
> +
> +	lmem.size = length;
> +	lmem.addr = mmap_vf_lmem(pf_fd, vf_num, length, PROT_READ | PROT_WRITE, 0);
> +	if (igt_debug_on(!lmem.addr))
> +		return false;
> +	result = lmem_write_pattern(&lmem, value, 0, STEP);
> +	munmap_vf_lmem(&lmem);
> +
> +	return result;
> +}
> +
> +static void lmem_subcheck_init(struct subcheck_data *data)
> +{
> +	struct lmem_data *ldata = (struct lmem_data *)data;
> +
> +	igt_assert_fd(data->pf_fd);
> +	igt_assert(data->num_vfs);
> +
> +	if (!xe_has_vram(data->pf_fd)) {
> +		igt_assert_neq(asprintf(&data->stop_reason,
> +					"%s : No LMEM", SKIP_REASON),
> +			       -1);
> +		return;
> +	}
> +
> +	ldata->vf_lmem_size = calloc(data->num_vfs, sizeof(size_t));
> +	igt_assert(ldata->vf_lmem_size);
> +
> +	for (int vf_id = 1; vf_id <= data->num_vfs; ++vf_id)
> +		ldata->vf_lmem_size[vf_id - 1] = get_vf_lmem_size(ldata->base.pf_fd, vf_id);
> +}
> +
> +static void lmem_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
> +{
> +	struct lmem_data *ldata = (struct lmem_data *)data;
> +
> +	if (data->stop_reason)
> +		return;
> +
> +	igt_assert(vf_id > 0 && vf_id <= data->num_vfs);
> +
> +	if (!lmem_mmap_write_munmap(data->pf_fd, vf_id,
> +				    ldata->vf_lmem_size[vf_id - 1], vf_id)) {
> +		igt_assert_neq(asprintf(&data->stop_reason,
> +					"Vram write failed on VF%u\n", vf_id),
> +			       -1);
> +	}
> +}
> +
> +static void lmem_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
> +{
> +	struct lmem_data *ldata = (struct lmem_data *)data;
> +	char expected = (vf_id == flr_vf_id) ? 0 : vf_id;
> +
> +	if (data->stop_reason)
> +		return;
> +
> +	if (!lmem_contains_expected_values(data->pf_fd, vf_id,
> +					   ldata->vf_lmem_size[vf_id - 1], expected)) {
> +		igt_assert_neq(asprintf(&data->stop_reason,
> +					"LMEM check after VF%u FLR failed on VF%u\n",
> +					flr_vf_id, vf_id),
> +			       -1);
> +	}
> +}
> +
> +static void lmem_subcheck_cleanup(struct subcheck_data *data)
> +{
> +	struct lmem_data *ldata = (struct lmem_data *)data;
> +
> +	free(ldata->vf_lmem_size);
> +}
> +
>   static void clear_tests(int pf_fd, int num_vfs)
>   {
>   	struct xe_mmio xemmio = { };
>   	const unsigned int num_gts = xe_number_gt(pf_fd);
>   	struct ggtt_data gdata[num_gts];
> -	const unsigned int num_checks = num_gts;
> +	struct lmem_data ldata = {
> +		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs }
> +	};
> +	const unsigned int num_checks = num_gts + 1;
>   	struct subcheck checks[num_checks];
>   	int i;
>   
> @@ -528,6 +732,13 @@ static void clear_tests(int pf_fd, int num_vfs)
>   			.cleanup = ggtt_subcheck_cleanup
>   		};
>   	}
> +	checks[i++] = (struct subcheck) {
> +		.data = (struct subcheck_data *)&ldata,
> +		.name = "clear-lmem",
> +		.init = lmem_subcheck_init,
> +		.prepare_vf = lmem_subcheck_prepare_vf,
> +		.verify_vf = lmem_subcheck_verify_vf,
> +		.cleanup = lmem_subcheck_cleanup };
>   	igt_assert_eq(i, num_checks);
>   
>   	verify_flr(pf_fd, num_vfs, checks, num_checks);
