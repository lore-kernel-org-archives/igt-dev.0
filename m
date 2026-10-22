Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE892606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 06:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mixZHQTP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8317410E3B3;
	Thu, 22 Oct 2026 06:15:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E17210E19E
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 06:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792649667; x=1824185667;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=taP7OWAP7XDHjCQegwkG1PwerKjXNRdeSuykhf4liiM=;
 b=mixZHQTP2uSqu6jgVjmGET6kzh9jyxTgWHBIVsyTah8mD4+nIfjrqnSc
 giEd4GXXJonaR7NfzFPKlf2cB+1/aQNd1nJvuKQeXpq6fBkuvzmsm2/P1
 zr31MK53LrkOV7FfGkBx/s173TKoC2cvMTyshHmS8n/tnNTEdZpXFR2Ks
 VlBYmWiIZSYf1uX+L1yT/+qB1DCebBZnJb4F7alQff9nbATSS/LGflL54
 YicJNwaGUvU8ESSIkfj24qhq5r4Bh5mpn91epuVYw8d2mCChAnBgYTrnL
 9qME59P03mrsJ7Q0wIw5oJpLf3nRIX2Sfcja47FLRM8VohWE1gnfVZUD7 g==;
X-CSE-ConnectionGUID: VYPF1j28ThaIhREPUwqHYA==
X-CSE-MsgGUID: kRmzsuaXQPegKn5Jnm/Q1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1268424"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1268424"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 23:14:27 -0700
X-CSE-ConnectionGUID: kB0EIkszTB6NUc22x1sOCg==
X-CSE-MsgGUID: RHC9QW6vTrScf4E/oahkEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3771375"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 23:14:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 23:14:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 23:14:25 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.52)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 23:14:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytefSjiA4zQxkXH86MIBHyydHMs13gY0SCeGHiCIAj510/7cAyciPGfIDjQli/Sdyy8F8HeLSZUNzDfS2zXMAOPVI1n8byNqA7YjG369NBS7OmcedRC2vLnCl6xyZvtJDjMGqzQl5FtlL0yqO0k9qjw9pV5VKy96ssISz8lGlJwefGQTANX4WLFP6hC7vbGd/8oz9odlfcULxOJ8bfiKeQGUqLXx+eJBILTuAyqQ4xQ8CCVB3PFHnIePetIZq9qWtk6AYKevPoCNbw4leLxH6hxXME3KKDnKwQfF+BqWsml4WmN9Xz5qa14J277uwlgLeag5xnuhHBSi+hz0cnvGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5f9D6MStIeUjoXr0JG96aOGbZP7vxoPNXg3r3CBLNo=;
 b=iWgpcWig24uBAe+CxwcGNPtZmJrtIPAOVj/DyFraCHnRIcm53O4shxZPNfMBAHSxlAMa67mjB4pXz8eDm2+OAT7XIDsgXezAVEjzKX1TjbL9ZqZc1dbFFaO4sKrHHcVrnwx7RfyLh7MpJ9msCs6y/w44ZvknTeOVB+msG3CiAOul8g3SZoTSkX86CybgV98MH8aHB12+bPW2uRvErwsWwQnZJAwevpjlg00fMLrJeA1GZCEedGVx14HmIEE+qtI1RATViI/vlBnPLGfQFUNf5cIYrlQPA4OVmUlVX9f2f8U7nMtfvoZklx/QhRTVzuxqptv9wPEhTc1gpzTX81TOaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by LV0PR11MB9839.namprd11.prod.outlook.com (2603:10b6:408:384::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 06:14:23 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0522.017; Thu, 22 Oct 2026
 06:14:23 +0000
Message-ID: <2d6af3e5-d280-459e-9e2e-4a473ba1e2d2@intel.com>
Date: Thu, 22 Oct 2026 11:44:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/intel/xe_wedged: ignore expected GuC error in
 dmesg
To: "Tauro, Riana" <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <nishit.sharma@intel.com>, <shuicheng.lin@intel.com>,
 <kamil.konieczny@linux.intel.com>
References: <20261021044910.253131-2-mallesh.koujalagi@intel.com>
 <11421d19-81d3-4c51-91bd-a064c08ee6b4@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <11421d19-81d3-4c51-91bd-a064c08ee6b4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0054.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::19) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|LV0PR11MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6f1f41-c69a-4b14-b8b7-08df3003b77b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: P96mRQVZL5mQWddfOIXzHIjKW2yP6ceK4Uy5ewIr3aGmKehemNGkxaqLIPTKP7U1KsSabLGnrYJrGN1AFajSGt4eTi7t/qrr/vs5D03FHHZBX3AtZfFNWfMAFmWnbahyXuphs3INx2eXMnRChYqaKW/5I0KaI+0o7zSThVXRqm4VyS01uJKf1cLfRhKyEAis4OG1IHrDvJdQ8YyNbAN1x8w7i9WZCj4WU4zlU4SqRZHNdhUsSxIDnPsjE3Jhfh+5+mBmRy75e/gmZmofrRT7lPmRBG+77tGIZz7l0jh+vvO30zwwjxLc/M5uMP1N9wy+BLfA8j0pZ+BZLecCoiAveSFpdH4T1mtBlnyamRu3WpnAteXbKyui250dIrZk8ZUaam+SIKXMGaEDu03eDBneTSrzOpsOiMHtXkDQldcfYelFW2Xp/penBDEQgZBpOiqZjXNHy9KTnyrcoVllK5PRjKIdkoT8yE0Td69ZAj4gaMAj98q2702D4QE9krHANQKB0bEEih8X5T1rkVQF5wCST2RlrcKiSeXSslpOfGC0+8OXDjuriBrZF1fbcb205hD+xfiLXCSKYs0e0HBlKaB/T1Z3mSZ1pVhF5zPn5jVT7wxkMu9VmwIvENlZayEbXf7kitnU2ZvUVIrgnOEaZcAqfJJLvJW8YamvGdqrldH94QI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUlhSGt2NnQ1b1B0WS82YjlnYXJuNkt3QWhiZ21kSWFDcXZEendTQXJOSTRy?=
 =?utf-8?B?VTFaK1JEZGJQdFpucWNlOWtHaGZEdnBDMm5rS3g2b29mVTY1aVVTQTFEQkQ2?=
 =?utf-8?B?MW5FTWRJd0pVUGtFUHBZZzZ1dmlLTWpzelpQWVl2NGFiQzBKR0FhQ2N6NGs0?=
 =?utf-8?B?ZDJHeklmempRZlZGTzg5aEpQdUVKVlJ2Y3JkVlVEbEVVbTJpK1o5YlJSM3Yz?=
 =?utf-8?B?MHE0MnRQSWhxdW5kblkxNUJWUHlLM2U5VVR5RUZzTkdoZU1kQXdKTHl0b3c5?=
 =?utf-8?B?bitkakRLQjVwTVN3cWV0NUJSRXlpaTRLaGFVc081N0JOS0pJN0ZhdVcydkZj?=
 =?utf-8?B?bGVZT2ZKRWFFSElaS0FnVVhUVWhqbTlRODhxclhlQVR4NmhrQlVlRkUxZXds?=
 =?utf-8?B?L2x3ejNoOHA5OHQyRjIwZFBsNmZOSDJaQ1pEYmllcW9zWFVEa1VCR0lzUmdO?=
 =?utf-8?B?Mi9MRzdGTk9ZOFZoWlJJZDNWTlhXNzVaSzd5YmhnNkRPbW91bnc1STZrNW1P?=
 =?utf-8?B?Wm9pZEVrZTdCc1NHd3lzT1lBa2NxdHdIZmlydGsyVk80MWhSa2tiNm1VdktR?=
 =?utf-8?B?YnJ2ZEZKTk9tQmNBT2ovR2F4TE1iTmxuaWI4ZEp2OFBWODJuSlVJVW90UnE0?=
 =?utf-8?B?RXQ0Ylc4Wk84cFFGT3BFcW42ZVVrc2hkZUd3VUJjZUZhOE04REpnZVlwVlI1?=
 =?utf-8?B?RlpMOVdSLzIxZ1BRTWJYTXQvSTRuNkFRYWplVXYxWVBWZkRuOGQyeWswNHMz?=
 =?utf-8?B?Y3I2cGx5V0JWR3dQbHFtZ3hKWlRDMGZNMzd2VHFOTWVoUndIcG1NOGpuZW5W?=
 =?utf-8?B?bmlYWkdSYnZYQTY4ZE5nRmdaOTZEakVkNzAvSjlzbndGR1Yrc3I4eU9NWElL?=
 =?utf-8?B?YzZNaGtWak9IYlhFbERlajdlWnhRbTFnT0tXSmxlZTNpWk5XNGM3cVd5ZEpQ?=
 =?utf-8?B?ZmQxOGc4eEVUTHFmSmJ6b2lmTzFPUzQwSDZZOW9UdUluanNkaDM4QnhNL2J3?=
 =?utf-8?B?QmtrUDR6R045Z2F4MGhpeDRoamhGMTBYUTN0ZGxxNmNKQkdBMTA2YjA1OWtO?=
 =?utf-8?B?SXhvN2hFUFJ2QjQ1WGR6RGxUSi8waUIrKzF1THN6dnc0QmUzQjZVdURxZ0Y1?=
 =?utf-8?B?dzRYVnBLaGp0OUFuK24wVzNjMGlkbzB0Vk1wWG5pVXNteWFsOWoxSmY5RzFP?=
 =?utf-8?B?dTRTQ2gwVUVRZlRzQXk4eWthTTZOQmtlWU56Q2dKdysxQVZEZUg3SzZKd2lx?=
 =?utf-8?B?d1o1ay8rZmdSR2p2cmpBYm9CZW1iT1JmOWZGL2IvTTVoaUdJekRMcGlFTzFR?=
 =?utf-8?B?R05XSU9mL1pxL2ozaHlBRWVVWG44Rk5XWXpZbzh1QmM1VkpHUUZxRDJwS1FZ?=
 =?utf-8?B?NENTWmc1SmhEaEl6SExQaEY4UWRwNnpmdVdFOUNaSzVidXE4OHJsbXpQekpq?=
 =?utf-8?B?S05ZYml4QXliVTMrd1ZhZllQVUZzZ0E3RkYzY1cwS0h3RlVHQ2IyQitNMjRZ?=
 =?utf-8?B?UWdqdDMxVTV4L0dHZmppOEFVd2FBSTFMeGJ6S1dvZjFsTXRObWY5YkRmYVJV?=
 =?utf-8?B?WTh3ZlRDS0pObUdEQWt2YThrOC9mUllJOGpSNC93YnRtR1o5VlJUdng5VjhM?=
 =?utf-8?B?QnR1SzFwdWZuYlMxNU1JLys2Q1RvU0FxN1NTaFlWYUpVVmIwaEhOZ2lNZysy?=
 =?utf-8?B?KzFQUlpSajNoSWFmSjhxR2QwYnZ2RXYrQ0JLRVExQzZRQlIwZHRMOXF3UjFE?=
 =?utf-8?B?SEZFV1plelJJUDY4dmduWXo4d2EvVUs0YzJXNWloNG9LTndFblFObzRhVkhw?=
 =?utf-8?B?WGNqR2pQN05ZUmpoY2VYVG1ZeElaN1pzd1czeEZCTDkyZ1RjVEoxcGJmc0o4?=
 =?utf-8?B?YjlwSzA0b3o3Vkh3aGtRcmNSdWRZNXYvRWwzT0pDSE9WSkdOc2plMHFQbVBC?=
 =?utf-8?B?UElpakZPckJsSitHLzJwTmlkYkRPd1MwZGJzdnJJNVBjbThWU2RmK1ZDcnBB?=
 =?utf-8?B?ZzU1QmVZSTJhSUE3dEQyaTJhZm5EUzNqdTdpZlMzdXRiMzlzNksydWlEU2ZU?=
 =?utf-8?B?amhBZUMvTm5jbDRnZmU0L3VoRXY0YU9qUXgzajdleWZYSENOMzZiQkQ2Ymhn?=
 =?utf-8?B?QVVUQ3NNYVpPYVNmYSs3NkR0aGE1TjRqaFNvRUNBTEZLODhjc0xHWjgrODZT?=
 =?utf-8?B?bnNaNjMvSnd4QkNhcTFVa3FldXd0YkUySzF0eDhpM3VxSkJUMkFZVldlNytF?=
 =?utf-8?B?dDBkVjVaMkNTQjBMZjQwSVpobDFYd0xCNnkrL21kT0diZjhpNGp4OXZFMTY4?=
 =?utf-8?B?YitjLzMrRHc3Q05wSXpxRXZldkgyTkVEZXpCMkJ5MjVMNzRNb2tjMVorMXVO?=
 =?utf-8?Q?a+gf8GHKIUNYj2og=3D?=
X-Exchange-RoutingPolicyChecked: zodT32Iqex8JKUR1SJP18mLJxXPlZL47IXx2kEHLPWcl7XEfLo6DNDZsxot2Mx+mntg2BCvgsJIL9KamyhgossXFHuUwsPZxv86KSdNE33FLc6T5KXC/vRS86T7AoKoYG7gceLvyM/4Up15aVEx15j8riDDHdrGZcSPiUZlPf7kSij2jjfDJhxmVtxyqlkiEGEGw9sgOmH6izRpVMfa0r2buRDJnqaXNqJlLbx4xyFJwb45sB3cEUFK5atRjLylNhO/TRTGX9/w8y+GMim9ykUHnAI7AjGOBYmF7HxtcyLWTFuQ5FPve/+6e+XobcojT9qP4p/z1SROtNNyPwfQZAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6f1f41-c69a-4b14-b8b7-08df3003b77b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 06:14:23.2704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eV/C72CQmvkMr1Jl7HVLu+5svsJ4aCxXUOs6/4YrtxL6DOyYosn7bqzgcUY6S7ZRuwKOgZl8mv7DL3RpY23nH5BSa1X/gvfTutvOjNdNsrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9839
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 21-10-2026 10:28 am, Tauro, Riana wrote:
>
> On 21-10-2026 10:19, Mallesh Koujalagi wrote:
>> Ignore the expected GuC uncorrectable local error message seen
>> during wedge tests.
>>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
> Please confirm if any logs are missing in this path for local errors 
> before merge.
>
Yes, all local error logs from the xe_guc_uncorrectable_error_handler() 
path are covered.

I don't see any missing logs.

> This patch looks good to me.
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Thanks Riana!

>
>
>> ---
>> v2:
>> - Remove '!' and short the string. (Kamil)
>> ---
>>   tests/intel/xe_wedged.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
>> index fe8ea6969..ba7efbe1d 100644
>> --- a/tests/intel/xe_wedged.c
>> +++ b/tests/intel/xe_wedged.c
>> @@ -55,6 +55,7 @@ static void ignore_wedged_in_dmesg(void)
>>                       "|EngineInstance: [0-9]+"
>>                       "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: 
>> Unsuccessful -EINVAL"
>>                       "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT 
>> error"
>> +                    "|Tile[0-9]+: GT[0-9A-Fa-f]*: GuC: Uncorrectable"
>>                       "|SIGID=203");
>>   }
