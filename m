Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFA8D75E57
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 14:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C6810EB53;
	Fri, 22 Nov 2024 14:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VV36eEwl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F6410EB53
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 14:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732285366; x=1763821366;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iT0BINSvcAh7LdqkkwaN6dTQ1gMRrLvUr+xJoGME030=;
 b=VV36eEwlp8z3dQ/jhfPE1DjadYpJLIQCqNKe1tluxyB5FqFRwMLGADCD
 CEmkrYdQDyAv7P8bV4olJIkmUXeGTphLAlrnnFzW7gRs9OMqPosxqN91V
 Mj9U5VNgpU+IT1bprd8sAtxipBlRLdWU2AxQ131udDBpXhcZ92pEwqNzW
 SxRHUfmhyFmY3EaovHuKFLfdOY7+TNdYLQe4dHLPPtOc05jdzgWJeBP30
 vEpU1dVJpRllTLORwxVpAiU1+He5DHFEbMegNVVDkkwkaP6IESLDl2zJ/
 8OhDsupZoje8TjmUZword2K2vlTCUFcre12m6/Jx/BynC9920gyVsQ1/7 Q==;
X-CSE-ConnectionGUID: UX1wnXYsQJ6EvW9HBLOSHQ==
X-CSE-MsgGUID: 4Xbo+d7MQvWRjrudewzJFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="42949506"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="42949506"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 06:22:46 -0800
X-CSE-ConnectionGUID: oUhZHQrKTpGiYS+mxMxF2A==
X-CSE-MsgGUID: 9QtG3eayRQaAygLnoi952Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="95658266"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 06:22:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 06:22:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 06:22:44 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 06:22:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohZZKt7sHPcS04/Bz+HuOlNqYr9vMbOVX/WbhUfOenyB8p4yEabeX9ap18cC33riSokzeu6x5nV4/+zms5QK06olijY/ZcDhxKQRZOBf2r6hPSQe++9Uxn5zwTvRKAKJ2awOxigf/22XZl2GQwXA1oSOKqb4EIyF99ecWOciGbq5BZ/T9My5FHUgY5wvRO5DHYcDnz8BS46jatuUnw5hcdcWj29Ig5zzXjTlpJt6BTgUGRbj19dX1l7b6vS86I4CI1ajYlF9tDVPy0mkwNzAc5t4C887zMAsi3LMxvteODyfzIYnDhaItDz5aeFImi/PadODcN0bSOfxFrsnpytTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qceTXqWb4Lm4wIoYxXE4O0LWn+aaFC9OgIaq/YirQjs=;
 b=AtHV8kyKwsZ/sGE8tW3J5UWl1BFmSBLfoPDqAijENGmdFWLilOlxKpEiNsqg84usdsTAkae9/76OfdiJoRi8QbMNwLBAEXxH0DPfUG9pHTRNPavOawSabhqiuhUprVFWdO22qOtYkBNJIELBHPq5cC8apW5M/5dn6s2z8ROryqJ6uq/VX4cltTkNWisCbBmHcNKdxIapt10hrP3mL2B/O4ldgN1G4EWOZ87rTxDZUkUH0EoqhKW0N6n+kdaN28KSONQyUSeQQBp4A69t5LVc3P7UTka2CU0CkolAgZduwHQDPc66i4bTrbDgjDwlkEzosMUZpw0qWXpqKQ6NKm5SSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6619.namprd11.prod.outlook.com (2603:10b6:303:1eb::13)
 by SN7PR11MB8263.namprd11.prod.outlook.com (2603:10b6:806:26d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Fri, 22 Nov
 2024 14:22:41 +0000
Received: from MW4PR11MB6619.namprd11.prod.outlook.com
 ([fe80::55f0:ee1a:cbd4:a704]) by MW4PR11MB6619.namprd11.prod.outlook.com
 ([fe80::55f0:ee1a:cbd4:a704%5]) with mapi id 15.20.8182.014; Fri, 22 Nov 2024
 14:22:41 +0000
Message-ID: <b7edccc0-0c27-4afd-b473-6a4c520cfb47@intel.com>
Date: Fri, 22 Nov 2024 15:22:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] lib/gpgpu_shader: simplify load/store shaders
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
References: <20241121-gpgpu_send_rework-v3-0-0b6aa48ab006@intel.com>
 <20241121-gpgpu_send_rework-v3-2-0b6aa48ab006@intel.com>
 <6a525a4772b595e0ac0739005d4902c60fafd369.camel@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <6a525a4772b595e0ac0739005d4902c60fafd369.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::10) To MW4PR11MB6619.namprd11.prod.outlook.com
 (2603:10b6:303:1eb::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6619:EE_|SN7PR11MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: ad2d1dca-d595-46a6-514d-08dd0b011f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0NURUNIY3hTZyt2SXI3b1VtYjBBeXhSU1hLYmpvYlRremFTOXBIY2JnNFlD?=
 =?utf-8?B?Z1lMSGtSdUJnZk5nbGM1c0NPdWlHZisrSmxZNnlySVRpNGVTenc3SDlDM09Z?=
 =?utf-8?B?ZkZkZzIwVXhFNngzT3FXUi9nMGlibnBuaUVCUHdRaFVxM3IrYkh5S2pwMnhw?=
 =?utf-8?B?S3pSTXp0cGlpSGpBVGpGb1E4cUd5Wkk5QVBpcEFCRk1OVTZ1Vk5oR1U5Wmdu?=
 =?utf-8?B?QUJWVk5yaGJFT1p0NkRUVHNVN0VnYy83YkRjTjlBMjV4T28yVklEZVJNQmNX?=
 =?utf-8?B?M0VXV0JSYUt1dUhvanpxRGhBRWhBaVp4c1dKTVlERWxpeTFZb0dDblpLUUNN?=
 =?utf-8?B?eStVQmJkUGxTVHRVMWZRLzNsOVZ0QnpPSXQ0NDh1eFl0L2xBK2padFJqdUdF?=
 =?utf-8?B?cllZVE5Ra3BBVTM0aVNmV3hxNU9XSDJOa25Ea0JFeHRsckdOZWJ2R2RzdXFQ?=
 =?utf-8?B?QVZrUk5GZldUb2N1eDVQU1FIYnlrOElCYys2dGp2NnBPbzlOaGRFL0hSYUQw?=
 =?utf-8?B?UlVEanR4TjUyMTNFdjc4QTd0ZDNMNE1ZaGxZcHRrL1hZNk13YjJCSlZoT3ZG?=
 =?utf-8?B?Vy8rbmxDZkZ0SDFkblBXdkMyamVLNWQ1SUY3cWdGYjdvL1drdHFzU0FPNlFT?=
 =?utf-8?B?RkZPRy81a2ZiS2pjSGJXSWdMK2ZkWENGeHViWEkyRUVudnVlTy9uRVVGQ3k1?=
 =?utf-8?B?TUpzazg0aU82bkxGNjRDMGFKY0h3WGpPV1BGOVNUbStLSmZla3drNndCVCsx?=
 =?utf-8?B?MDI1ZTdycXFZcnZraFkvaHV2dnAvc0o0T0szTlFLS1ZzRzdIVmovK0luSkh5?=
 =?utf-8?B?S0ZUK3hDSDkwNHVMUVhTeTl3anlmem5mNE1tR0RxVU44OGNXYW9IRy9JMXZm?=
 =?utf-8?B?ekt3d3k5ZUZGTGZQQk9mcWhhc1RCcTBmL0hZNllodlNDZHl5WFplVE9lYjRm?=
 =?utf-8?B?Q1VwVVB0WjYrS29NZmFGUHllY1ltUTl3d1RNSFB0Z2dLeVh2QmgxMG9FNHVS?=
 =?utf-8?B?c1JtR0I3SElReGp2OGV2OTNzSkFwWVB6a2wzSWVhOEtyVDdaWVV1K2xYZnRz?=
 =?utf-8?B?YjNjT3pkaFEyZE9SM0pHZFM2MUJUZG1qUEY4YnpuR0tuZmdEelFWYURRL0l3?=
 =?utf-8?B?OU9iU3EzWEgwZDMyUEJkMjNhaDRMQ2R1RklaTzNsaktHT1NVK2pvTUQwZ1oz?=
 =?utf-8?B?ODA3U3BOaVlQN002cVczc0FiR0RxOUx0eUwyY1A1dG1UV1JJNjdVSm0yWi9X?=
 =?utf-8?B?ZlZ2UnJKeUd2ckRxWEFRWEhNWkd4SVJNWHZUcnRvSGpuMnhDdzlPbzRKZlRM?=
 =?utf-8?B?c3NYVUZ6VzhGbFdQVHhhUmFHQlVqUjhYa25GUFJVck1lenhxcUZtd25mS1Q2?=
 =?utf-8?B?YS9PcFdoT0pTMnoyTkxHS0d5UkFCQjNLWHV4RjN5SmlzOVJNd21IUFlZQmFI?=
 =?utf-8?B?Ulpjc1NxZXZFOUFVaG8rYVkyMlNoM010dndOTHdZMGpTa29qK1ZjeVNzUlRL?=
 =?utf-8?B?YWFGeWpnTU11TzlkNFR3ZlVBY2x4NXJhYlltdHhCN0UxeHJsMmhmM1YvMGJW?=
 =?utf-8?B?dlo2V1A4T2huK2M5YVVGTkhoemYwSXpsZzdsaDZWV2R0MlZxd3NuRjJjS3JZ?=
 =?utf-8?B?VkZEdXdhYTVTZkltK001YWxRU3NLRzE3VEhJcWFTdFJwWHdLbC9UUzBLT3E5?=
 =?utf-8?B?WlVldzJiSThCTDB2ajdxZkd4N2l0YzloWGdNNTdSQ1NFWm5HM1hwdHphR3Fm?=
 =?utf-8?B?eTJGMThNUFR4YTlBeEkwUHhUcVdmNzFuRjllbXE5Tk9ua2daNXJzMXdQUnRv?=
 =?utf-8?B?dEdBTE1RdjZiY0V3Y090dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6619.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWludFRXUWU5NEFScUdySnJ5a2ZIU21YaTFQck5PT3FzUnVTK1RWd0hsVXU2?=
 =?utf-8?B?eDdiVEwxZEFYRmZpajdKYlRvY0dyb1pJWEprbVppR1M0R1dXbDhRdTU0dUFr?=
 =?utf-8?B?MUZDY29LR2JmZzlTTkh4bE9YbGVJVUVvYUVEaGtzNWJpS3B1VklqVDR5VGN4?=
 =?utf-8?B?cmpSdmZ6U2dpN2pvWW5yT0wvL1lESzRsbzdjaDF3ZHRNTmtBRXdmRFhhSmFS?=
 =?utf-8?B?eDNpRHoyRnFzbTNQUElYOTB6YWthbVpSekkrQThMSkVDMHZnaVdDS3ZjTTFa?=
 =?utf-8?B?czZVQW0zcEpSeXUwcnRpN0JaTFZlMDNRL0p4ZWhUVFBRYjJxeE5XN1dORDkx?=
 =?utf-8?B?eExmbkZ5cDI0VGZJdGhtUmlnS1hvUVdoYmRBYzRmcnFnOTV1aWRkMmsvS00v?=
 =?utf-8?B?OThXRXM1d003bGdtNDl2VVN6aEV2dzdoTkpoZm5DWHNpUld2eUxsam8yTDV6?=
 =?utf-8?B?QnphOHplQWQ5M3BPSGZFQm1lcnZRY2ZiM2d4YXNuNjE0SFpCQ3BoQ3FTc2hk?=
 =?utf-8?B?S1ZKWmp2R2c1NXZVVjNXOVlnenpiUkJuUDNSY2QyWFRUNE9jRk9Qc3JHZjZt?=
 =?utf-8?B?aXRTOU5uOVpUdGZzMDc0c05KSS9OQndvbzNaeEs5cUczQnk4RU90Y3JNSVk2?=
 =?utf-8?B?NnFkelM3TWp3QmRINldiSFNPaEdkYTY2ZDZ2SVNXcFpHam1leXAxV3BPU3pD?=
 =?utf-8?B?c2gvaXR1Vk0zaHJGZ3JIdGNqVHdGZ01FWHdGd3RZVVhoVHAvR3Y5Mmg0aFpK?=
 =?utf-8?B?bDE5RnFkTThvS1FjYmNRQlFlMHBhOUdpa3lybVdFYy9pcTZWNElsUjJMbitt?=
 =?utf-8?B?cVVYR1IrRGtMMXpIT0ZjV1U2WGxtQ1pKVkJIejFadEs3NzZmd0xTMUtjMnN4?=
 =?utf-8?B?YWlnbWlpb3FtMXJVVC8vbHlvV0RwOXA2YU8xOE03dENWcGFkc1RxazFQZ1NX?=
 =?utf-8?B?TGk3L2hWOFhyWkRXVHRSSUhjYjgvSUVYTE1pM1d5cGZqRHNDQjB1OTVPeE5S?=
 =?utf-8?B?Y2hkZWJ6U3NON3lQd2dPODNSeUpiQWIxQVF2bGJ4VUIvYzMwZTdyMGt0TW95?=
 =?utf-8?B?YzE2V0V4YzUxTXlicjIxYUdNMFE1OGxTcGg0TkJUaGllUGNCcGVpNkdVTG5y?=
 =?utf-8?B?SDBsQVdtRDVjeVpJMkN4a1ZCYi9vbVdHbEk0Mkw4RVhVZGRvKy9ueUpPcG5a?=
 =?utf-8?B?L0JnYVRXSEVtYlFKeEc3eVlKOWFadWtURTNiRytSbThXTU5GeVMvREFTQ2d1?=
 =?utf-8?B?bDN0OFJWMHozS3d5QjMzM0VmRVN3aDVQeFZzOUFTMVkyalViZ0VGQjUxYXA2?=
 =?utf-8?B?bVRybjl4T25TL3NlMDhOUkZnUWJENFlZNUpKa05kYncwU2l6TXBKYzA0ZXlE?=
 =?utf-8?B?U0c4QU5xRlZwMWpXNnZTdFVTcUtUY1JMZnNCSStrVnVQMSt5N05KanpHWWVx?=
 =?utf-8?B?Rm5mMmhxaFNuZVA1L3pBZThwcmdCby93Sk1xaHVFSHI1TWdtZElxRFZvR0dl?=
 =?utf-8?B?NUlVZUxMM1ZrMlI4dzE2N0xUVlZJM0Vxdm5Pd1RaUXJXRDJ6SE9CUUlQcmQy?=
 =?utf-8?B?VEtIUGd0SE9pb3QrU0U3QnBQbE9IS2NsdDUrRG85eXJRdE1jaXhrZGg4YWVp?=
 =?utf-8?B?L3BudHBacHE1UmNZL2t6U2g5L0txUXJldnVvSWRMUmpNRzEvZ21hNEErWE5V?=
 =?utf-8?B?amVNYUNMSnh0ODNqbVBWVGI0bzZBeDdSVWovQkJXSy9KL2h2c29kMTJtMTdx?=
 =?utf-8?B?OWxxeFdEV054ZWE4bmhBVUtYQXZ6citPSjRKaFZCWGM2Qm50Vm9LWVg0MHBK?=
 =?utf-8?B?aHZZU3UxQS94V3JrY1piVHNlRXZ4QlIvYkZXa2ZuR2RDVFRLNFhKNGV3RFNV?=
 =?utf-8?B?YjJWT2drS1g0MldBVDlxMGhxSEdsMjNDTkJQaVp3V2Zxa1lpelRwMGhFQTkw?=
 =?utf-8?B?ZlliL3dTL21obTB1RXM0anloM2ZBYy9XVTZHQkhTanNVYisrOVcvb2hjbldj?=
 =?utf-8?B?QUk3MEdMc1VWVGpEMElDaVdCSkwyTytraXRHcUh5S2VHYmcrUUQ3MXJERnVN?=
 =?utf-8?B?bGY5V281TDQ4VVFiaWZIR29hK1QremEwTnRMdWM1US9uSlQxbnJIMk50T095?=
 =?utf-8?B?V3ZodHpOWlhFSTRBMElzODMzUVB5TlF4ajlKT2pnY1QyMHkwUVFHbTYxbW9D?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2d1dca-d595-46a6-514d-08dd0b011f52
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6619.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 14:22:40.8988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCOxl1AhUzluSZtI4mvLuO3hNzd66Tv1n4mtEnODYFdY+UyEheCTMPX7CPkSNGAO9ywbzpzSkGV1NrqovRLxEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8263
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


W dniu 22.11.2024 o 15:05, Grzegorzek, Dominik pisze:
> On Thu, 2024-11-21 at 18:12 +0100, Andrzej Hajda wrote:
>> There is lot of redundancy in shaders code regarding load/store messages.
>> It makes the code barely readable. Simplify it by using macros in iga64
>> assembler.
>> Every load/store operation is split into two phases:
>> 1. Load address/descriptor (from) where data should be stored/loaded.
>> 2. Issue load/store instruction.
>> Shader threads needs two types of memory access:
>> 3. Private area per thread.
>> 4. Area shared per all threads.
>> Different platforms access surface in different ways:
>> 5. Using media block messages.
>> 6. Using untyped 2d block messages.
>> 7. Future platforms will use different messages.
>>
>> All this is simplified to two macros per message in shader:
>> 	load_(shared|thread)_space_addr(dst,y,width)
>> 	(load|store)_space_dw(dst, src)
>>
>> v2:
>>    - captialze introduced macros (Dominik)
>>    - fixed thread -> shared call (Zbigniew)
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> ---
>>   lib/gpgpu_shader.c          | 160 +++-------------------
>>   lib/iga64_generated_codes.c | 318 +++++++++++++++++++++-----------------------
>>   lib/iga64_macros.h          |  43 ++++++
>>   3 files changed, 215 insertions(+), 306 deletions(-)
>>
>> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
>> index 4e1b8d5e9009..363435e7efd3 100644
>> --- a/lib/gpgpu_shader.c
>> +++ b/lib/gpgpu_shader.c
>> @@ -431,22 +431,8 @@ void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
>>   
>>   	size = emit_iga64_code(shdr, jump_dw_neq, "					\n\
>>   L0:											\n\
>> -(W)		mov (16|M0)              r30.0<1>:ud    0x0:ud				\n\
>> -#if GEN_VER < 2000 // Media Block Write							\n\
>> -	// Y offset of the block in rows := thread group id Y				\n\
>> -(W)		mov (1|M0)               r30.1<1>:ud    ARG(0):ud			\n\
>> -	// block width [0,63] representing 1 to 64 bytes, we want dword			\n\
>> -(W)		mov (1|M0)               r30.2<1>:ud    0x3:ud				\n\
>> -	// FFTID := FFTID from R0 header						\n\
>> -(W)		mov (1|M0)               r30.4<1>:ud    r0.5<0;1,0>:ud  		\n\
>> -(W)		send.dc1 (16|M0)         r31     r30      null    0x0	0x2190000	\n\
>> -#else // Typed 2D Block Store								\n\
>> -	// Store X and Y block start (160:191 and 192:223)				\n\
>> -(W)            mov (1|M0)               r30.6<1>:ud    ARG(0):ud			\n\
>> -	// Store X and Y block size (224:231 and 232:239)				\n\
>> -(W)            mov (1|M0)               r30.7<1>:ud    0x3:ud				\n\
>> -(W)            send.tgm (16|M0)         r31     r30    null:0    0x0    0x62100003	\n\
>> -#endif											\n\
>> +		SET_SHARED_SPACE_ADDR(r30, ARG(0):ud, 4)				\n\
>> +(W)		LOAD_SPACE_DW(r31, r30)							\n\
> It's a bit odd to me, that in case of LOAD_SPACE_DW you leave an user with a choice
> wheter to set Write Enable (W). Is there any possible use case when we do not won't to set it before
> send message? Especially, taking into account that we aready always did it perparing the message.
> Moving (W) inside the macro would be cleaner. And it will spare a future user a dillema wheter use
> it or not.


Sometimes it is '(W)', sometimes '(W&f0.0)' 
(gpgpu_shader__write_on_exception), I think it is easier this way than 
via extra argument, or separate macro.

Regards

Andrzej


>
> Other than that I did not spot more issues. Great cleanup indeed, so from my side it is:
> Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>
>>   	// clear the flag register							\n\
>>   (W)		mov (1|M0)               f0.0<1>:ud    0x0:ud				\n\
>>   (W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r31.0<0;1,0>:ud   ARG(1):ud	\n\
>> @@ -511,28 +497,13 @@ void gpgpu_shader__common_target_write(struct gpgpu_shader *shdr,
>>   				       uint32_t y_offset, const uint32_t value[4])
>>   {
>>   	emit_iga64_code(shdr, common_target_write, "				\n\
>> -(W)	mov (16|M0)		r30.0<1>:ud	0x0:ud				\n\
>>   (W)	mov (16|M0)		r31.0<1>:ud	0x0:ud				\n\
>>   (W)	mov (1|M0)		r31.0<1>:ud	ARG(1):ud			\n\
>>   (W)	mov (1|M0)		r31.1<1>:ud	ARG(2):ud			\n\
>>   (W)	mov (1|M0)		r31.2<1>:ud	ARG(3):ud			\n\
>>   (W)	mov (1|M0)		r31.3<1>:ud	ARG(4):ud			\n\
>> -#if GEN_VER < 2000 // Media Block Write						\n\
>> -	// Y offset of the block in rows					\n\
>> -(W)	mov (1|M0)		r30.1<1>:ud	ARG(0):ud			\n\
>> -	// block width [0,63] representing 1 to 64 bytes			\n\
>> -(W)	mov (1|M0)		r30.2<1>:ud	0xf:ud				\n\
>> -	// FFTID := FFTID from R0 header					\n\
>> -(W)	mov (1|M0)		r30.4<1>:ud	r0.5<0;1,0>:ud			\n\
>> -	// written value							\n\
>> -(W)	send.dc1 (16|M0)	null	r30	src1_null  0x0	0x40A8000	\n\
>> -#else	// Typed 2D Block Store							\n\
>> -	// Store X and Y block start (160:191 and 192:223)			\n\
>> -(W)	mov (1|M0)              r30.6<1>:ud     ARG(0):ud			\n\
>> -	// Store X and Y block size (224:231 and 232:239)			\n\
>> -(W)	mov (1|M0)              r30.7<1>:ud     0xf:ud				\n\
>> -(W)	send.tgm (16|M0)        null    r30     null:0  0x0     0x64000007	\n\
>> -#endif										\n\
>> +	SET_SHARED_SPACE_ADDR(r30, ARG(0):ud, 16)				\n\
>> +(W)	STORE_SPACE_DW(r30, r31)						\n\
>>   	", y_offset, value[0], value[1], value[2], value[3]);
>>   }
>>   
>> @@ -565,31 +536,8 @@ void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset)
>>   	emit_iga64_code(shdr, media_block_write_aip, "				\n\
>>   	// Payload								\n\
>>   (W)	mov (1|M0)               r5.0<1>:ud    cr0.2:ud				\n\
>> -#if GEN_VER < 2000 // Media Block Write						\n\
>> -	// X offset of the block in bytes := (thread group id X << ARG(0))	\n\
>> -(W)	shl (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud    0x2:ud		\n\
>> -	// Y offset of the block in rows := thread group id Y			\n\
>> -(W)	mov (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud			\n\
>> -(W)	add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud    ARG(0):ud	\n\
>> -	// block width [0,63] representing 1 to 64 bytes			\n\
>> -(W)	mov (1|M0)               r4.2<1>:ud    0x3:ud				\n\
>> -	// FFTID := FFTID from R0 header					\n\
>> -(W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud			\n\
>> -(W)	send.dc1 (16|M0)         null     r4   src1_null 0       0x40A8000	\n\
>> -#else // Typed 2D Block Store							\n\
>> -	// Load r2.0-3 with tg id X << ARG(0)					\n\
>> -(W)	shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    0x2:ud		\n\
>> -	// Load r2.4-7 with tg id Y + ARG(1):ud					\n\
>> -(W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud			\n\
>> -(W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(0):ud	\n\
>> -	// payload setup							\n\
>> -(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
>> -	// Store X and Y block start (160:191 and 192:223)			\n\
>> -(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud			\n\
>> -	// Store X and Y block max_size (224:231 and 232:239)			\n\
>> -(W)	mov (1|M0)               r4.7<1>:ud    0x3:ud				\n\
>> -(W)	send.tgm (16|M0)         null     r4   null:0    0    0x64000007	\n\
>> -#endif										\n\
>> +	SET_THREAD_SPACE_ADDR(r4, 0, ARG(0):ud, 4)				\n\
>> +(W)	STORE_SPACE_DW(r4, r5)							\n\
>>   	", y_offset);
>>   }
>>   
>> @@ -618,38 +566,11 @@ void gpgpu_shader__increase_aip(struct gpgpu_shader *shdr, uint32_t value)
>>   void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>>   			       uint32_t y_offset)
>>   {
>> -	emit_iga64_code(shdr, media_block_write, "				\n\
>> -	// Clear message header							\n\
>> -(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
>> -	// Payload								\n\
>> -(W)	mov (1|M0)               r5.0<1>:ud    ARG(3):ud			\n\
>> -(W)	mov (1|M0)               r5.1<1>:ud    ARG(4):ud			\n\
>> -(W)	mov (1|M0)               r5.2<1>:ud    ARG(5):ud			\n\
>> -(W)	mov (1|M0)               r5.3<1>:ud    ARG(6):ud			\n\
>> -#if GEN_VER < 2000 // Media Block Write						\n\
>> -	// X offset of the block in bytes := (thread group id X << ARG(0))	\n\
>> -(W)	shl (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud	\n\
>> -	// Y offset of the block in rows := thread group id Y			\n\
>> -(W)	mov (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud			\n\
>> -(W)	add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud   ARG(1):ud	\n\
>> -	// block width [0,63] representing 1 to 64 bytes			\n\
>> -(W)	mov (1|M0)               r4.2<1>:ud    ARG(2):ud			\n\
>> -	// FFTID := FFTID from R0 header					\n\
>> -(W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud			\n\
>> -(W)	send.dc1 (16|M0)         null     r4   src1_null 0    0x40A8000		\n\
>> -#else // Typed 2D Block Store							\n\
>> -	// Load r2.0-3 with tg id X << ARG(0)					\n\
>> -(W)	shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud	\n\
>> -	// Load r2.4-7 with tg id Y + ARG(1):ud					\n\
>> -(W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud			\n\
>> -(W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(1):ud	\n\
>> -	// Store X and Y block start (160:191 and 192:223)			\n\
>> -(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud			\n\
>> -	// Store X and Y block max_size (224:231 and 232:239)			\n\
>> -(W)	mov (1|M0)               r4.7<1>:ud    ARG(2):ud			\n\
>> -(W)	send.tgm (16|M0)         null     r4   null:0    0    0x64000007	\n\
>> -#endif										\n\
>> -	", 2, y_offset, 3, value, value, value, value);
>> +	emit_iga64_code(shdr, media_block_write, "		\n\
>> +(W)	mov (1)		r5.0<1>:ud    ARG(1):ud			\n\
>> +	SET_THREAD_SPACE_ADDR(r4, 0, ARG(0):ud, 4)		\n\
>> +(W)	STORE_SPACE_DW(r4, r5)					\n\
>> +	", y_offset, value);
>>   }
>>   
>>   /**
>> @@ -697,41 +618,14 @@ void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t value,
>>   				      uint32_t y_offset, uint32_t mask, uint32_t expected)
>>   {
>>   	emit_iga64_code(shdr, write_on_exception, "					\n\
>> -	// Clear message header								\n\
>> -(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud					\n\
>> -	// Payload									\n\
>> -(W)	mov (1|M0)               r5.0<1>:ud    ARG(4):ud				\n\
>> -#if GEN_VER < 2000 // prepare Media Block Write						\n\
>> -	// X offset of the block in bytes := (thread group id X << ARG(0))		\n\
>> -(W)	add (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud	 ARG(1):ud		\n\
>> -(W)	shl (1|M0)               r4.0<1>:ud    r4.0<0;1,0>:ud    ARG(0):ud		\n\
>> -	// Y offset of the block in rows := thread group id Y				\n\
>> -(W)	add (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud   ARG(2):ud		\n\
>> -	// block width [0,63] representing 1 to 64 bytes				\n\
>> -(W)	mov (1|M0)               r4.2<1>:ud    ARG(3):ud				\n\
>> -	// FFTID := FFTID from R0 header						\n\
>> -(W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud				\n\
>> -#else // prepare Typed 2D Block Store							\n\
>> -	// Load r2.0 with tg id (X + ARG(1)) << ARG(0)					\n\
>> -(W)	add (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud	 ARG(1):ud		\n\
>> -(W)	shl (1|M0)               r2.0<1>:ud    r2.0<0;1,0>:ud    ARG(0):ud		\n\
>> -	// Load r2.4-7 with tg id Y + ARG(2):ud						\n\
>> -(W)	add (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud    ARG(2):ud		\n\
>> -	// Store X and Y block start (160:191 and 192:223)				\n\
>> -(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud				\n\
>> -	// Store X and Y block max_size (224:231 and 232:239)				\n\
>> -(W)	mov (1|M0)               r4.7<1>:ud    ARG(3):ud				\n\
>> -#endif											\n\
>> +(W)	mov (1|M0)		r5.0<1>:ud	ARG(2):ud				\n\
>> +	SET_THREAD_SPACE_ADDR(r4, ARG(0), ARG(1):ud, 4)				\n\
>>   	// Check if masked exception is equal to provided value and write conditionally \n\
>> -(W)      and (1|M0)              r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(5):ud		\n\
>> -(W)      mov (1|M0)              f0.0<1>:ud     0x0:ud					\n\
>> -(W)      cmp (1|M0)     (eq)f0.0 null:ud        r3.0<0;1,0>:ud  ARG(6):ud		\n\
>> -#if GEN_VER < 2000 // Media Block Write							\n\
>> -(W&f0.0) send.dc1 (16|M0)        null     r4   src1_null 0    0x40A8000			\n\
>> -#else // Typed 2D Block Store								\n\
>> -(W&f0.0) send.tgm (16|M0)        null     r4   null:0    0    0x64000007		\n\
>> -#endif											\n\
>> -	", 2, x_offset, y_offset, 3, value, mask, expected);
>> +(W)     and (1|M0)		r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(3):ud		\n\
>> +(W)     mov (1|M0)		f0.0<1>:ud     0x0:ud					\n\
>> +(W)     cmp (1|M0) (eq)f0.0	null:ud        r3.0<0;1,0>:ud  ARG(4):ud		\n\
>> +(W&f0.0) STORE_SPACE_DW(r4, r5)								\n\
>> +	", 4 * x_offset, y_offset, value, mask, expected);
>>   }
>>   
>>   /**
>> @@ -778,22 +672,8 @@ void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
>>   	emit_iga64_code(shdr, end_system_routine_step_if_eq, "				\n\
>>   (W)		or  (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x8000:ud	\n\
>>   (W)		and (1|M0)               cr0.1<1>:ud   cr0.1<0;1,0>:ud   ARG(0):ud	\n\
>> -(W)		mov (16|M0)              r30.0<1>:ud    0x0:ud				\n\
>> -#if GEN_VER < 2000 // Media Block Write							\n\
>> -		// Y offset of the block in rows := thread group id Y			\n\
>> -(W)		mov (1|M0)               r30.1<1>:ud    ARG(1):ud			\n\
>> -		// block width [0,63] representing 1 to 64 bytes, we want dword		\n\
>> -(W)		mov (1|M0)               r30.2<1>:ud    0x3:ud				\n\
>> -		// FFTID := FFTID from R0 header					\n\
>> -(W)		mov (1|M0)               r30.4<1>:ud    r0.5<0;1,0>:ud			\n\
>> -(W)		send.dc1 (16|M0)         r31     r30      null    0x0	0x2190000	\n\
>> -#else	// Typed 2D Block Store								\n\
>> -		// Store X and Y block start (160:191 and 192:223)			\n\
>> -(W)		mov (1|M0)               r30.6<1>:ud    ARG(1):ud			\n\
>> -		// Store X and Y block size (224:231 and 232:239)			\n\
>> -(W)		mov (1|M0)               r30.7<1>:ud    0x3:ud				\n\
>> -(W)		send.tgm (16|M0)         r31     r30    null:0    0x0    0x62100003	\n\
>> -#endif											\n\
>> +		SET_SHARED_SPACE_ADDR(r30, ARG(0):ud, 4)				\n\
>> +(W)		LOAD_SPACE_DW(r31, r30)							\n\
>>   		// clear the flag register						\n\
>>   (W)		mov (1|M0)               f0.0<1>:ud    0x0:ud				\n\
>>   (W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r31.0<0;1,0>:ud   ARG(2):ud	\n\
>> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
>> index 41be66f74486..04015b0b6d29 100644
>> --- a/lib/iga64_generated_codes.c
>> +++ b/lib/iga64_generated_codes.c
>> @@ -3,7 +3,7 @@
>>   
>>   #include "gpgpu_shader.h"
>>   
>> -#define MD5_SUM_IGA64_ASMS 09d72b5fd1f62c8c2905caa80f400567
>> +#define MD5_SUM_IGA64_ASMS da66be3cf9bec819a61429de75943011
>>   
>>   struct iga64_template const iga64_code_gpgpu_fill[] = {
>>   	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> @@ -83,10 +83,10 @@ struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>>   	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>>   		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>> -		0x80100961, 0x1e054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x1e654220, 0x00000000, 0xc0ded001,
>> +		0x800c0961, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
>> -		0x80132031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
>> +		0x80032031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80008070, 0x00018220, 0x22001f04, 0xc0ded002,
>>   		0x84000965, 0x80118220, 0x02008010, 0xc0ded003,
>> @@ -96,12 +96,12 @@ struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>>   	{ .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
>>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>>   		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>> -		0x80040961, 0x1e054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
>> +		0x80030961, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80004031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded002,
>>   		0x81000965, 0x80218220, 0x02008020, 0xc0ded003,
>> @@ -111,11 +111,11 @@ struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>>   	{ .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
>>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>>   		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>> -		0x80100961, 0x1e054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
>> +		0x800c0961, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000061, 0x1e154220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e450220, 0x00000054, 0x00000000,
>> -		0x80132031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80032031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80008070, 0x00018220, 0x22001f04, 0xc0ded002,
>>   		0x84000965, 0x80118220, 0x02008010, 0xc0ded003,
>> @@ -125,12 +125,12 @@ struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>>   	{ .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
>>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>>   		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>> -		0x80040961, 0x1e054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
>> +		0x80030961, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80004031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded002,
>>   		0x81000965, 0x80218220, 0x02008020, 0xc0ded003,
>> @@ -140,11 +140,11 @@ struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>>   	{ .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
>>   		0x80000166, 0x80018220, 0x02008000, 0x00008000,
>>   		0x80000165, 0x80218220, 0x02008020, 0xc0ded000,
>> -		0x80040161, 0x1e054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
>> +		0x80030161, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>> -		0x80049031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80009031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded002,
>>   		0x81000165, 0x80218220, 0x02008020, 0xc0ded003,
>> @@ -193,84 +193,83 @@ struct iga64_template const iga64_code_breakpoint_suppress[] = {
>>   };
>>   
>>   struct iga64_template const iga64_code_write_on_exception[] = {
>> -	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
>> -		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
>> -		0x80000040, 0x02058220, 0x02000014, 0xc0ded001,
>> -		0x80001969, 0x02058220, 0x02000204, 0xc0ded000,
>> -		0x80000040, 0x02158220, 0x02000064, 0xc0ded002,
>> -		0x80041961, 0x04550220, 0x00220205, 0x00000000,
>> -		0x80000061, 0x04754220, 0x00000000, 0xc0ded003,
>> -		0x80000965, 0x03058220, 0x02008010, 0xc0ded005,
>> +	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>> +		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04558220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04558220, 0x02000454, 0xc0ded000,
>> +		0x80000040, 0x04658220, 0x02000064, 0xc0ded001,
>> +		0x80000061, 0x04754220, 0x00000000, 0x00000003,
>> +		0x80000965, 0x03058220, 0x02008010, 0xc0ded003,
>>   		0x80000961, 0x30014220, 0x00000000, 0x00000000,
>> -		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
>> -		0x84132031, 0x00000000, 0xd00e0494, 0x04000000,
>> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
>> +		0x84032031, 0x00000000, 0xd00e0494, 0x04000000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
>> -		0x80000040, 0x04058220, 0x02000024, 0xc0ded001,
>> -		0x80001969, 0x04058220, 0x02000404, 0xc0ded000,
>> -		0x80000040, 0x04258220, 0x020000c4, 0xc0ded002,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded003,
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0xc0ded000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded001,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x80000965, 0x03058220, 0x02008020, 0xc0ded005,
>> +		0x80000965, 0x03058220, 0x02008020, 0xc0ded003,
>>   		0x80000961, 0x30014220, 0x00000000, 0x00000000,
>> -		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
>> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x81004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
>> -		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
>> -		0x80000040, 0x04058220, 0x02000014, 0xc0ded001,
>> -		0x80001969, 0x04058220, 0x02000404, 0xc0ded000,
>> -		0x80000040, 0x04158220, 0x02000064, 0xc0ded002,
>> -		0x80000061, 0x04254220, 0x00000000, 0xc0ded003,
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>> +		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0xc0ded000,
>> +		0x80000040, 0x04158220, 0x02000064, 0xc0ded001,
>> +		0x80000061, 0x04254220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04450220, 0x00000054, 0x00000000,
>> -		0x80000965, 0x03058220, 0x02008010, 0xc0ded005,
>> +		0x80000965, 0x03058220, 0x02008010, 0xc0ded003,
>>   		0x80000961, 0x30014220, 0x00000000, 0x00000000,
>> -		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
>> -		0x84132031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
>> +		0x84032031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
>> -		0x80000040, 0x04058220, 0x02000024, 0xc0ded001,
>> -		0x80001969, 0x04058220, 0x02000404, 0xc0ded000,
>> -		0x80000040, 0x04258220, 0x020000c4, 0xc0ded002,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded003,
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0xc0ded000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded001,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x80000965, 0x03058220, 0x02008020, 0xc0ded005,
>> +		0x80000965, 0x03058220, 0x02008020, 0xc0ded003,
>>   		0x80000961, 0x30014220, 0x00000000, 0x00000000,
>> -		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
>> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x81004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
>> -		0x80000040, 0x04058220, 0x02000024, 0xc0ded001,
>> -		0x80000169, 0x04058220, 0x02000404, 0xc0ded000,
>> -		0x80000040, 0x04258220, 0x020000c4, 0xc0ded002,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded003,
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80000140, 0x04058220, 0x02000404, 0xc0ded000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded001,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x80000165, 0x03058220, 0x02008020, 0xc0ded005,
>> +		0x80000165, 0x03058220, 0x02008020, 0xc0ded003,
>>   		0x80000161, 0x30014220, 0x00000000, 0x00000000,
>> -		0x80000270, 0x00018220, 0x12000304, 0xc0ded006,
>> -		0x81049031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80000270, 0x00018220, 0x12000304, 0xc0ded004,
>> +		0x81009031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>> @@ -324,84 +323,68 @@ struct iga64_template const iga64_code_clear_exception[] = {
>>   };
>>   
>>   struct iga64_template const iga64_code_media_block_write[] = {
>> -	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
>> -		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>> -		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
>> -		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
>> -		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
>> -		0x80000069, 0x02058220, 0x02000014, 0xc0ded000,
>> -		0x80000061, 0x02150220, 0x00000064, 0x00000000,
>> -		0x80001940, 0x02158220, 0x02000214, 0xc0ded001,
>> -		0x80041961, 0x04550220, 0x00220205, 0x00000000,
>> -		0x80000061, 0x04754220, 0x00000000, 0xc0ded002,
>> -		0x80132031, 0x00000000, 0xd00e0494, 0x04000000,
>> +	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>> +		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04558220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04558220, 0x02000454, 0x00000000,
>> +		0x80000040, 0x04658220, 0x02000064, 0xc0ded000,
>> +		0x80000061, 0x04754220, 0x00000000, 0x00000003,
>> +		0x80032031, 0x00000000, 0xd00e0494, 0x04000000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>> -		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
>> -		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
>> -		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
>> -		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
>> +	{ .gen_ver = 1270, .size = 48, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
>> -		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>> -		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
>> -		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
>> -		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
>> -		0x80000069, 0x04058220, 0x02000014, 0xc0ded000,
>> -		0x80000061, 0x04150220, 0x00000064, 0x00000000,
>> -		0x80001940, 0x04158220, 0x02000414, 0xc0ded001,
>> -		0x80000061, 0x04254220, 0x00000000, 0xc0ded002,
>> +	{ .gen_ver = 1260, .size = 44, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>> +		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04158220, 0x02000064, 0xc0ded000,
>> +		0x80000061, 0x04254220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04450220, 0x00000054, 0x00000000,
>> -		0x80132031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80032031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>> -		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
>> -		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
>> -		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
>> -		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
>> +	{ .gen_ver = 1250, .size = 48, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>> -		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
>> -		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
>> -		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
>> -		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80000140, 0x04258220, 0x02000424, 0xc0ded001,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
>> +	{ .gen_ver = 0, .size = 44, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80000140, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x80049031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80009031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>> @@ -432,65 +415,68 @@ struct iga64_template const iga64_code_write_aip[] = {
>>   };
>>   
>>   struct iga64_template const iga64_code_media_block_write_aip[] = {
>> -	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> +	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
>>   		0x80000961, 0x05050220, 0x00008020, 0x00000000,
>> -		0x80000969, 0x02058220, 0x02000014, 0x00000002,
>> -		0x80000061, 0x02150220, 0x00000064, 0x00000000,
>> -		0x80001940, 0x02158220, 0x02000214, 0xc0ded000,
>> -		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80041a61, 0x04550220, 0x00220205, 0x00000000,
>> +		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04558220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04558220, 0x02000454, 0x00000000,
>> +		0x80000040, 0x04658220, 0x02000064, 0xc0ded000,
>>   		0x80000061, 0x04754220, 0x00000000, 0x00000003,
>> -		0x80132031, 0x00000000, 0xd00e0494, 0x04000000,
>> +		0x80032031, 0x00000000, 0xd00e0494, 0x04000000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1270, .size = 44, .code = (const uint32_t []) {
>> +	{ .gen_ver = 1270, .size = 48, .code = (const uint32_t []) {
>>   		0x80000961, 0x05050220, 0x00008040, 0x00000000,
>> -		0x80000969, 0x04058220, 0x02000024, 0x00000002,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80001940, 0x04258220, 0x02000424, 0xc0ded000,
>> +		0x80030961, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>>   		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1260, .size = 40, .code = (const uint32_t []) {
>> +	{ .gen_ver = 1260, .size = 44, .code = (const uint32_t []) {
>>   		0x80000961, 0x05050220, 0x00008020, 0x00000000,
>> -		0x80000969, 0x04058220, 0x02000014, 0x00000002,
>> -		0x80000061, 0x04150220, 0x00000064, 0x00000000,
>> -		0x80001940, 0x04158220, 0x02000414, 0xc0ded000,
>> +		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04158220, 0x02000064, 0xc0ded000,
>>   		0x80000061, 0x04254220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04450220, 0x00000054, 0x00000000,
>> -		0x80132031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80032031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1250, .size = 44, .code = (const uint32_t []) {
>> +	{ .gen_ver = 1250, .size = 48, .code = (const uint32_t []) {
>>   		0x80000961, 0x05050220, 0x00008040, 0x00000000,
>> -		0x80000969, 0x04058220, 0x02000024, 0x00000002,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80001940, 0x04258220, 0x02000424, 0xc0ded000,
>> +		0x80030961, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>>   		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 0, .size = 40, .code = (const uint32_t []) {
>> +	{ .gen_ver = 0, .size = 44, .code = (const uint32_t []) {
>>   		0x80000161, 0x05050220, 0x00008040, 0x00000000,
>> -		0x80000169, 0x04058220, 0x02000024, 0x00000002,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80000140, 0x04258220, 0x02000424, 0xc0ded000,
>> +		0x80030161, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80000140, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>>   		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x80049031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80009031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>> @@ -499,77 +485,77 @@ struct iga64_template const iga64_code_media_block_write_aip[] = {
>>   
>>   struct iga64_template const iga64_code_common_target_write[] = {
>>   	{ .gen_ver = 2000, .size = 48, .code = (const uint32_t []) {
>> -		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>>   		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
>>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
>>   		0x80000061, 0x1f354220, 0x00000000, 0xc0ded004,
>> +		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
>> -		0x80132031, 0x00000000, 0xd00e1e94, 0x04000000,
>> +		0x80032031, 0x00000000, 0xd00e1e94, 0x04000000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1270, .size = 56, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
>>   		0x80000061, 0x1f454220, 0x00000000, 0xc0ded003,
>>   		0x80000061, 0x1f654220, 0x00000000, 0xc0ded004,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x0000000f,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0001e14, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0001e14, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1260, .size = 52, .code = (const uint32_t []) {
>> -		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>>   		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
>>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
>>   		0x80000061, 0x1f354220, 0x00000000, 0xc0ded004,
>> +		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e154220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0x0000000f,
>>   		0x80000061, 0x1e450220, 0x00000054, 0x00000000,
>> -		0x80132031, 0x00000000, 0xc0001e14, 0x02a00000,
>> +		0x80032031, 0x00000000, 0xc0001e14, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1250, .size = 56, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
>>   		0x80000061, 0x1f454220, 0x00000000, 0xc0ded003,
>>   		0x80000061, 0x1f654220, 0x00000000, 0xc0ded004,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x0000000f,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0001e14, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0001e14, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 0, .size = 52, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
>>   		0x80000061, 0x1f454220, 0x00000000, 0xc0ded003,
>>   		0x80000061, 0x1f654220, 0x00000000, 0xc0ded004,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x0000000f,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>> -		0x80049031, 0x00000000, 0xc0001e14, 0x02a00000,
>> +		0x80009031, 0x00000000, 0xc0001e14, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>> @@ -627,56 +613,56 @@ struct iga64_template const iga64_code_clear_r40[] = {
>>   
>>   struct iga64_template const iga64_code_jump_dw_neq[] = {
>>   	{ .gen_ver = 2000, .size = 32, .code = (const uint32_t []) {
>> -		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
>> -		0x80132031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
>> +		0x80032031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80008070, 0x00018220, 0x22001f04, 0xc0ded001,
>>   		0x84000020, 0x00004000, 0x00000000, 0xffffffa0,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1270, .size = 40, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80004031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded001,
>>   		0x81000020, 0x00004000, 0x00000000, 0xffffff80,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1260, .size = 36, .code = (const uint32_t []) {
>> -		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e154220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e450220, 0x00000054, 0x00000000,
>> -		0x80132031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80032031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80008070, 0x00018220, 0x22001f04, 0xc0ded001,
>>   		0x84000020, 0x00004000, 0x00000000, 0xffffff90,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1250, .size = 40, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80004031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded001,
>>   		0x81000020, 0x00004000, 0x00000000, 0xffffff80,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 0, .size = 36, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>> -		0x80049031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80009031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded001,
>>   		0x81000120, 0x00004000, 0x00000000, 0xffffff90,
>> diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
>> index 6459b524c3fd..40b6338928e1 100644
>> --- a/lib/iga64_macros.h
>> +++ b/lib/iga64_macros.h
>> @@ -16,4 +16,47 @@
>>   #define src1_null null:0
>>   #endif
>>   
>> +/* GPGPU_R0Payload fields, Bspec: 55396, 56587 */
>> +#define R0_TGIDX r0.1<0;1,0>:ud
>> +#define R0_TGIDY r0.6<0;1,0>:ud
>> +#define R0_FFTID r0.5<0;1,0>:ud
>> +
>> +#define SET_SHARED_MEDIA_BLOCK_MSG_HDR(dst, y, width)	\
>> +(W)	mov (8)		dst.0<1>:ud	0x0:ud		;\
>> +(W)	mov (1)		dst.1<1>:ud	y		;\
>> +(W)	mov (1)		dst.2<1>:ud	(width - 1):ud	;\
>> +(W)	mov (1)		dst.4<1>:ud	R0_FFTID
>> +
>> +#define SET_THREAD_MEDIA_BLOCK_MSG_HDR(dst, x, y, width)	\
>> +(W)	mov (8)		dst.0<1>:ud	0x0:ud			;\
>> +(W)	shl (1)		dst.0<1>:ud	R0_TGIDX	0x2:ud	;\
>> +(W)	add (1)		dst.0<1>:ud	dst.0<0;1,0>:ud	x:ud	;\
>> +(W)	add (1)		dst.1<1>:ud	R0_TGIDY	y	;\
>> +(W)	mov (1)		dst.2<1>:ud	(width - 1):ud		;\
>> +(W)	mov (1)		dst.4<1>:ud	R0_FFTID
>> +
>> +#define SET_SHARED_MEDIA_A2DBLOCK_PAYLOAD(dst, y, width)	\
>> +(W)	mov (8)		dst.0<1>:ud	0x0:ud		;\
>> +(W)	mov (1)		dst.6<1>:ud	y		;\
>> +(W)	mov (1)		dst.7<1>:ud	(width - 1):ud
>> +
>> +#define SET_THREAD_MEDIA_A2DBLOCK_PAYLOAD(dst, x, y, width)		\
>> +(W)	mov (8)		dst.0<1>:ud	0x0:ud			;\
>> +(W)	shl (1)		dst.5<1>:ud	R0_TGIDX	0x2:ud	;\
>> +(W)	add (1)		dst.5<1>:ud	dst.5<0;1,0>:ud	x:ud	;\
>> +(W)	add (1)		dst.6<1>:ud	R0_TGIDY	y	;\
>> +(W)	mov (1)		dst.7<1>:ud	(width - 1):ud		;\
>> +
>> +#if GEN_VER < 2000
>> +#define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_BLOCK_MSG_HDR(dst, y, width)
>> +#define SET_THREAD_SPACE_ADDR(dst, x, y, width) SET_THREAD_MEDIA_BLOCK_MSG_HDR(dst, x, y, width)
>> +#define LOAD_SPACE_DW(dst, src) send.dc1 (1)	dst	src	src1_null 0x0	0x2190000
>> +#define STORE_SPACE_DW(dst, src) send.dc1 (1)	null	dst	null	0x0	0x40A8000
>> +#else
>> +#define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_A2DBLOCK_PAYLOAD(dst, y, width)
>> +#define SET_THREAD_SPACE_ADDR(dst, x, y, width) SET_THREAD_MEDIA_A2DBLOCK_PAYLOAD(dst, x, y, width)
>> +#define LOAD_SPACE_DW(dst, src) send.tgm (1)	dst	src	null:0	0x0	0x62100003
>> +#define STORE_SPACE_DW(dst, src) send.tgm (1)	null	dst	null:0	0x0	0x64000007
>> +#endif
>> +
>>   #endif
>>
