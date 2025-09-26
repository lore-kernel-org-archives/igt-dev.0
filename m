Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CABCAC5AE
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 12:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFEA10E375;
	Fri, 26 Sep 2025 12:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQ3zal1z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6445310E375
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 12:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758889937; x=1790425937;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=X+cmr/3kAhRdd0aUqKiz9q7Z6uRXKZ3ePs9kDfyvdgU=;
 b=AQ3zal1zm23yDH41flqgM0U306HuJDpQFqTe93UPbvzFr8xRO5nDwoMH
 b1+X/Vm2TKQ29tOHcMfkVm6fsXvWcaxOPfTmnH2RCsy3rhruv99TYD1iE
 mdVRw15+PIESYPU/DB5NRM1sLQ7Ir+Xip668QnE2aQw65pGiuCWIiPB/m
 1LOx9xs8oEppqRwyZnBbwNodppgpe45IMmBnvfWWiPFub3chVcMCIw1o9
 O/Q4HRI3nFiKisClJQnDLaINIhQ+xraeMDBx1tPputIqJ5L13ya1df+7W
 uwohjYJ1LoSMx4uwRICEktnut+LRsQNs9wkyrD7F+cO34Fgvaa0XFRDyz w==;
X-CSE-ConnectionGUID: pBDuWApZQg6wIAMtlaKnVQ==
X-CSE-MsgGUID: IrclKR2dTWKOnAMNYnJgtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61271887"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="61271887"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 05:32:16 -0700
X-CSE-ConnectionGUID: TR/VwsZjQ/+zjLZtrNZleg==
X-CSE-MsgGUID: 3f71OIq5RjCkmbepnXKilg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="182006081"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 05:32:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 05:32:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 05:32:15 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 05:32:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LN6mvwyzbtOX3qSUPfJ8xxUCJn1JjnRW2IbsqW65+9Ut/dBbkhW2lcPB02NGZS9H9iyY3F62xb6aEwjM9fl/j+N6/hffmXlNi2pYSR7VsdHPfveeqOES8+eBZ3sJ46qaMohPoC4+r4W68I6bsx3re34gcMmMY4onWlKyyGqtpe1u0B/R8EGkT6k/zrkpGBBCeKUN0lOEXXTRDXYEAQrHwjS5P4nt8F4Xdrqv+Iua17FvTJIQdP/7qIcWUu+0/E0ILbeOyiOKpwZdGzb3S//HetRpmNtEh/8E5NE6LezShl/p89fdkgfsbyPQDG2x8/az6NW7/1MttgvB92zRfkpX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJL7s4RvZQeKUYMkSN9Z1baXnl2mQpDLNc/7ieFwq4Y=;
 b=wOXeurJoy763qDNlJdVZPgeH5SxgUsyB8ZPyVvvoxjHFRyYuTh0aoruskN/Qh0MCv4nwGDaOr9ugpeFHBLhzL4A+k7xjeicPTCbGymqEi3LzZRUt21D0FSPa5jUlxonGGHiXqcw84/OQjRFh06GlwY3Z5WW8GU1sr5s0sLrE/FYuGfChj9w8PHiHMTSrdO2uUNMUHuGL4VOvTTouVopGgv4KGrxLrlSHh8qMzIelswvejIS3x8MNnZVpyu1bLO1+enbkacigN/2z6SEL0XCFWOKoXmydrW4iPb7kX0ji+Dfy1EPyaLgmoMXpyS4oNhbm0rIvu/3UAle6lgW6UvgptQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 12:32:07 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 12:32:07 +0000
Date: Fri, 26 Sep 2025 18:01:56 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] lib/intel_blt.c: Fix MEM_COPY instruction for xe2+
 platforms
Message-ID: <aNaHvLwNrgWba_Z5@bvivekan-mob1>
References: <20250923150926.1829954-1-balasubramani.vivekanandan@intel.com>
 <scbqoixwk3kjbk6xbduoa7tumrmyptendhyugoppqmqpi465cz@l6zhkpxft5oe>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <scbqoixwk3kjbk6xbduoa7tumrmyptendhyugoppqmqpi465cz@l6zhkpxft5oe>
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|PH8PR11MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: a171aa80-b526-432c-8e6d-08ddfcf8b4e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3VJTDhETG1CQTk0c2FESmozQURaOG5kOWRMM3ZMbDA5eGUrYzBFWWNxN1ZF?=
 =?utf-8?B?SUhqWGlVamo3WkloWlJ1RmVmeTd6cnFDY3AveElYb1Nnci9VTFFlS2NRQVdt?=
 =?utf-8?B?MDhmNEJrR04waldsVkViMXMzZWdzWHFSVlZoY2dMa2I2R0piYm94MmliTGg2?=
 =?utf-8?B?ZmViYTgwaXdjNG95QVV3bEhlZXJhaTRPd3M4ZEdKQ3NwUmFZQWtnSDZQMllh?=
 =?utf-8?B?ODNERVo3bWZjTThPNDdEU29DMExPN2FvVXh4S0JjN2FHNldJd0JtRjVyelp0?=
 =?utf-8?B?K20wWlB5ODZRbGRtZnlydkV2SUgzdUViaUcwektzTnl2LzAyZWxTZVQxcy9O?=
 =?utf-8?B?V29oMmRlZFhudlhicDRyVE5FS3h5QnlyUi9kQ2RIbEpGbk1VckdMRW8wSVB2?=
 =?utf-8?B?YVRRQmdraTBKTUJ6MDJMTllCZlpTRm40TVVIRklHcjRBc0NHZjFXVHJXYjVR?=
 =?utf-8?B?TVg3UTBhZlRNVGJ2aXFuc1owcEVPLzN4Ui82am92SndSWldjZXQ2NVNMaTha?=
 =?utf-8?B?bWFuZmlyYW9FOUpvNUVUV0Mrb0FBdHJ5WnZoUFkrMTlxaVBIR3lPQVZtcUIr?=
 =?utf-8?B?UkpxK25JeVByaTQ2ZUtObmN5ZjFSVUhKczJ2WDdKb3VwT0lQRjFhZmE3aXVY?=
 =?utf-8?B?Qkk0QUd4MmJacVY3T3JIRnBkNFlkczRWazZXeWU2bjhhNEV3WHh3OVN5bndw?=
 =?utf-8?B?U3EvRXVvUzdGejVGNTRRYTlDQzVCVktCcVByRktHVUg2SUVwaUFNZnFLeEVI?=
 =?utf-8?B?MjQ1ZmZhWEdza0RrdENwdGNJdW5aUUdpMkdGRnMyK2pkazNNMVdKYmhPSWZ1?=
 =?utf-8?B?RjM4aXJ3YmI2Ri9yNnUwemxkZldVQ1REK2VJK3Z1dG4vVlFnOWttd0hDN1lr?=
 =?utf-8?B?b0NwWTNtei9hRUhUNkk5ZEttMm96ck1oWk5QenhFcGNNTXFic05rYmtSeGVu?=
 =?utf-8?B?UTluLzB6S3FwZTRNQ1BFNUgxUUxDczZPRzFSL240dThUUGRVREtscDF0OXA5?=
 =?utf-8?B?ZmF4YmRYb01kSWM4TldwVVBUTDcxaFk1d1NBT1I2bVVwNmV6NDUxNm9SeFMv?=
 =?utf-8?B?eDBWZnI5ZVQrY3pwbGcrZUtqNmhQSlJDdmZKRS9ZZURKRGhWUTAvZG1TRSty?=
 =?utf-8?B?STFVVTBKbFNCa3RwM05pQllhR1dqOG41RExDOG9kRytPRUd1OWRWcEdhR1du?=
 =?utf-8?B?OElDbGp2aitjeWlCendxUFNhY3RnT05XclBvQjliZ0N2ZWkrRGsyc2VHWnd1?=
 =?utf-8?B?LyttK3ZBd0lHZUR5QnJCWVozbFFNU2pqakx6L3V3R0M0a0xNTmI1MGRYQzNI?=
 =?utf-8?B?QTZMdDZLdlg1RUhBYkNPVEg2S1QxMHlZTUJmMG55YzN6alBnZnNXSHVvOVBE?=
 =?utf-8?B?WVZKdldRaUlXeFE2K3RyeTRzMjN0UHY5U3BnS1RvbzBJdWQxM3RyVjV5QmJj?=
 =?utf-8?B?K3BiRjVJMWg3Zk4vM29EZm5qMGx6cGNLaTlRaHhFempyeHU4ZXU0UW5zUmo2?=
 =?utf-8?B?ZGhFbGk4ekc1UFZsWkwzNjJmUnJNbGRZTFlCQ2pCdWFrT1QvcGQ3dzIxTFVP?=
 =?utf-8?B?N00vckdVS250OFVLUXFkQ2x5eXVUUi9PMGorWFk0U291SE5rWUh0RFFGT1VU?=
 =?utf-8?B?TEM1Tzd0TWNLSzZLcjRzUitzOVdHdTNERGZpQTd3Zk9WY1lseVBLRTlkRU4w?=
 =?utf-8?B?OCt2WnB3SVAzNkh2N1Zvc3M4RDJKSGVQTTRHMDB3dlRoL2JpYmlVQ01icHBj?=
 =?utf-8?B?N0k5NXN4T3NQbUpKRWhRVExTVDdDdWRkY01pU1FVV1pKazVyZFhyQ1ZjbVll?=
 =?utf-8?B?bWZYYXBoUHNxT0NwS0tOUVNlelBsa1pxYjFaUEJ0WWdMYU1TQ1hGUGE4ckJ1?=
 =?utf-8?B?RVVuTlB0ajI0azBRQUlWQ04rTzhrK2dyekRaRXNmaU11cG10NWhjMFBqZEl4?=
 =?utf-8?Q?h3WJMoL+dGTohaJ+nqk9GdsVJM3tZvKt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dy9VVUFVOU9IUWJ2My9RbnFORWQvWldFcHdmSzVyWERuK3FxZ2JrUWthWERt?=
 =?utf-8?B?dGp6aTNGN1NDb2lJdlNTLzhwVzZSbWcrcDR5S1ZrL1ZteWpmZ3lXRW80TE03?=
 =?utf-8?B?VG44U3Y4MUFwLzQ2a21QcTJJckFNSEVyekljeC9IdzlFMGZSVzA5L1NZU1Iy?=
 =?utf-8?B?Zld5ZlhYT2pmQ3crRjQ1bkJtNk56ZlJCekhHanJOb0psSjE4NG9kNkNLeXpY?=
 =?utf-8?B?cXRKcU03ZzBjS2dpYWV4cjQrRHl1dXB3aVZVVUxCRVBnRC9qQmQxakhpb0dx?=
 =?utf-8?B?eUorOXYvNUZ3ME1ERS9SRGppRW92K21yRVhsVCtDYjNNeE5KbkdqQ3R1dUo4?=
 =?utf-8?B?THcyNHlYMFhrbm1MVjQ5QkRiQXBMelBNMmk2T1MxaVZsVVExTjArT1lRQ1ox?=
 =?utf-8?B?eDg5V2VuYzlyVWd0cTFCM3dkVEo1cnlXUndHSzVWbzE4MXJBZVpaSXJuTUs3?=
 =?utf-8?B?cnkycW9HemNnS2xHaElBcUFyblJaMVR2S2hlN2QrR09IVzY4VE0xRUx4RzVu?=
 =?utf-8?B?UXJJWXZSTkFHdlRkUmVZQUcwSnI3VCs0QWF2YytJZ2w3a0F5eEVhSTZNcDFB?=
 =?utf-8?B?azhJTWkxbXQ1SXpGcGx6eEdCa093cWpvVnNpSml5SHA0ZjdRS0dhY0tRd2JH?=
 =?utf-8?B?elQxVFE2OUNCYUdDa1FOejN2d0hzcGZVWStIdm83SVVtd2Q4YUFaZlp0M2pr?=
 =?utf-8?B?RExGSjA3MXo2SDYyVnVab3JnOTgrcW5GQklpZ0QyS3dHK3dPZDlHSEUzOFdn?=
 =?utf-8?B?QnZKYUY0RTVwOUNSajUzWmZ5dDYwZHFGeGgwRlQ4M0xJS2lKWTRpWWFsR2Qw?=
 =?utf-8?B?OEE3YlhzQWRLUUVpR2JBRlhRL2o0SzJCTmRVSHFzSWIyVHBBVVdQeHdoSkRO?=
 =?utf-8?B?eFB0WXZHaFRFclRaZUp5RWtKKzIrc05NaEhEQmltTXg5Mjc4R3I5TzF6cmZV?=
 =?utf-8?B?Z2wwOE52TXI1dHBFRTNuTmdhTTZjVnYzWjJla014OERHa3ZYM21xcStoVi9F?=
 =?utf-8?B?b1BnTHRobkVDL1Q3OWFab3hQbnh6ME8zc1F2WGNPYUE3bGZ2V1EzK1BlR0dT?=
 =?utf-8?B?a3JHcStpOVlkNUVEZEpyeUFpNWF4U0pzV2t4YXhyM0ZEeSt4by8xWEJqYTVW?=
 =?utf-8?B?Qms0V3FBZlR2Lzc0aVhkMUppUm1jZ0UzMEFJS01qOXNyQlpaSmRZR285NG9M?=
 =?utf-8?B?ajZJODhtQW9GNlAxRmkwazJ1UUNIVmNHQ3oyU3RaRXRJMERFMWxabFdSeldj?=
 =?utf-8?B?MGl5U2tQODNybTlmeEllektYWnVET2Y4OGxJa1R0SUlnekVWZGozS2YrUkRm?=
 =?utf-8?B?SS9QdFViMWtOUmhPV3hGZEhiM1hnUThyVHRoTWpaZmtzMXYrUFpRbnh3ZElr?=
 =?utf-8?B?TUwzcXZnSWpRQ2UrVi9VQ3RlMlFBZzVhWWxtQnNNVXJoVUNQVkxiQ29wT1hv?=
 =?utf-8?B?N1RoNmVCZ3NnOHE2bGNxZ0JJYUZrbGNiZGJpZjNHZ05YMkV0WmYrRVJ0b2N3?=
 =?utf-8?B?dlMvYVdMc0ZmcGNDSnREYnd2RFJLc2FGOEZYcjZ0Vy9oVk0xcXdxYThvMEVz?=
 =?utf-8?B?aE5iRGNzWFJ1QllyL2Vwb0ZFZjJaZ3BVTFdVcTNvcnM5T3pOUjFkNC85NlN0?=
 =?utf-8?B?b05XR21JS2RMa1RwUWg2b2I2S3FFU2svZmdxTkUzY1RjUWNmUUhJclpRU2NJ?=
 =?utf-8?B?bzlQYWdMMlJKS3dneDFtWHE4a3d3M0JMZTlSWnlUTTlmc0xuMGpTWEVVQ2Fn?=
 =?utf-8?B?dkRPcEE4VzRGMnBMbFRIajE3SlY4T1k2dkg3K0NNeW9xWER1TkRyRVNIeWJL?=
 =?utf-8?B?NVg0SUpXbUQycStOOElEOVBSd3lHOFN0cmZMaElHN1lRQUJHcTUyeUN6ZDdW?=
 =?utf-8?B?Myt0L2Nrb2NybDgyalV4VUZJaHBEOXAvbTlianMySmhEZTJnVFVFeFRRemIv?=
 =?utf-8?B?KzJ2YjZOU2dEcjV6NmIvU3RTN25HV1k4L2N2dmtZRXE1UVZ3T1R2V1lkZ0NN?=
 =?utf-8?B?dWxoa3gzOFRGaTJqSTFlUjlLdDF5b0lyK0tRbit6WVh0Wm81OXNKa0t0bnUv?=
 =?utf-8?B?U3B0YlAzYW96VW9tSFV3Z0lOaWZ0NUI5cjRxRHF6OGRoOWo4dHNGeHRnUDBk?=
 =?utf-8?B?T3VtVGpOM2NXRkxiY1ZxOTVtdFZzV25Mek9FRlpxK3BBQUVoc3c2ZzZLNGg4?=
 =?utf-8?Q?xPcBw9o4NnR8H2ZWGHvpRL4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a171aa80-b526-432c-8e6d-08ddfcf8b4e0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 12:32:07.5529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIgiTaMzrtIfpVQw7xVlRNkfRU6VDJH+hD7DFxRdKOaKzIbj/NVF3iIqCo0xj+aGRr8yupPSlOIXydI1Chof1p5eH9m1kM2N7+1CO0VtikMalKoQettfDoZ3kE1y1GlD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
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

On 25.09.2025 09:48, Zbigniew Kempczyński wrote:
> On Tue, Sep 23, 2025 at 08:39:26PM +0530, Balasubramani Vivekanandan wrote:
> > There is a difference in the MEM_COPY instruction structure starting
> > with xe2 based platforms. Fixed it.
> > 
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> >  lib/intel_blt.c | 126 +++++++++++++++++++++++++++++++++++-------------
> >  1 file changed, 93 insertions(+), 33 deletions(-)
> > 
> > diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> > index 71ed891c3..1a8808688 100644
> > --- a/lib/intel_blt.c
> > +++ b/lib/intel_blt.c
> > @@ -1800,17 +1800,32 @@ int blt_fast_copy(int fd,
> >  
> >  struct xe_mem_copy_data {
> >  	struct {
> > -		uint32_t length:			BITRANGE(0, 7);
> > -		uint32_t compression_format:	BITRANGE(8, 12);
> > -		uint32_t compression_enable:	BITRANGE(13, 13);
> > -		uint32_t rsvd0:			BITRANGE(14, 14);
> > -		uint32_t dst_compressible:	BITRANGE(15, 15);
> > -		uint32_t src_compressible:	BITRANGE(16, 16);
> > -		uint32_t copy_type:		BITRANGE(17, 18);
> > -		uint32_t mode:			BITRANGE(19, 19);
> > -		uint32_t rsvd1:			BITRANGE(20, 21);
> > -		uint32_t opcode:			BITRANGE(22, 28);
> > -		uint32_t client:			BITRANGE(29, 31);
> > +		union {
> > +			struct {
> > +				uint32_t length:		BITRANGE(0, 7);
> > +				uint32_t rsvd0:			BITRANGE(8, 8);
> > +				uint32_t compression_format:	BITRANGE(9, 12);
> > +				uint32_t rsvd1:			BITRANGE(13, 16);
> > +				uint32_t copy_type:		BITRANGE(17, 18);
> > +				uint32_t mode:			BITRANGE(19, 19);
> > +				uint32_t rsvd2:			BITRANGE(20, 21);
> > +				uint32_t opcode:		BITRANGE(22, 28);
> > +				uint32_t client:		BITRANGE(29, 31);
> > +			} x2;
> 
> xe2?
> 
> > +			struct {
> > +				uint32_t length:		BITRANGE(0, 7);
> > +				uint32_t compression_format:	BITRANGE(8, 12);
> > +				uint32_t compression_enable:	BITRANGE(13, 13);
> > +				uint32_t rsvd0:			BITRANGE(14, 14);
> > +				uint32_t dst_compressible:	BITRANGE(15, 15);
> > +				uint32_t src_compressible:	BITRANGE(16, 16);
> > +				uint32_t copy_type:		BITRANGE(17, 18);
> > +				uint32_t mode:			BITRANGE(19, 19);
> 
> If I'm not wrong mode is not used on gen12 and it is in rsvd1 [21:19].
> 
> > +				uint32_t rsvd1:			BITRANGE(20, 21);
> > +				uint32_t opcode:		BITRANGE(22, 28);
> > +				uint32_t client:		BITRANGE(29, 31);
> > +			} gen12;
> 
> I think you may use 'xe' here.
> 
> 
> > +		};
> >  	} dw00;
> >  
> >  	struct {
> > @@ -1859,9 +1874,22 @@ struct xe_mem_copy_data {
> >  	} dw08;
> >  
> >  	struct {
> > -		uint32_t dst_mocs:		BITRANGE(0, 6);
> > -		uint32_t rsvd0:			BITRANGE(7, 24);
> > -		uint32_t src_mocs:		BITRANGE(25, 31);
> > +		union {
> > +			struct {
> > +				uint32_t dst_encrypt:		BITRANGE(0, 0);
> > +				uint32_t rsvd0:			BITRANGE(1, 2);
> > +				uint32_t dst_mocs:		BITRANGE(3, 6);
> > +				uint32_t rsvd1:			BITRANGE(7, 24);
> > +				uint32_t src_encrypt:		BITRANGE(25, 25);
> > +				uint32_t rsvd2:			BITRANGE(26, 27);
> > +				uint32_t src_mocs:		BITRANGE(28, 31);
> > +			} x2;
> > +			struct {
> > +				uint32_t dst_mocs:		BITRANGE(0, 6);
> > +				uint32_t rsvd0:			BITRANGE(7, 24);
> > +				uint32_t src_mocs:		BITRANGE(25, 31);
> > +			} gen12;
> > +		};
> >  	} dw09;
> >  };
> >  
> > @@ -1887,18 +1915,32 @@ void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
> >  	mem->copy_type = copy_type;
> >  }
> >  
> > -static void dump_bb_mem_copy_cmd(struct xe_mem_copy_data *data)
> > +static void dump_bb_mem_copy_cmd(int fd, struct xe_mem_copy_data *data)
> >  {
> >  	uint32_t *cmd = (uint32_t *) data;
> > +	uint32_t devid = intel_get_drm_devid(fd);
> >  
> >  	igt_info("BB details:\n");
> > -	igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
> > -		 "[copy type: %d, mode: %d]\n",
> > -		 cmd[0], data->dw00.client, data->dw00.opcode, data->dw00.length,
> > -		 data->dw00.copy_type, data->dw00.mode);
> > -	igt_info(" dw01: [%08x] width: %u\n", cmd[1],
> > -		 data->dw00.mode == MODE_BYTE ? data->dw01.byte_copy.width :
> > -						data->dw01.page_copy.width);
> > +
> > +	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
> > +		igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
> > +			 "[copy type: %d, mode: %d]\n",
> > +			 cmd[0], data->dw00.x2.client, data->dw00.x2.opcode,
> > +			 data->dw00.x2.length, data->dw00.x2.copy_type,
> > +			 data->dw00.x2.mode);
> > +		igt_info(" dw01: [%08x] width: %u\n", cmd[1],
> > +			 data->dw00.x2.mode == MODE_BYTE ? data->dw01.byte_copy.width :
> > +							data->dw01.page_copy.width);
> > +	} else {
> > +		igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
> > +			 "[copy type: %d, mode: %d]\n",
> > +			 cmd[0], data->dw00.gen12.client,
> > +			 data->dw00.gen12.opcode, data->dw00.gen12.length,
> > +			 data->dw00.gen12.copy_type, data->dw00.gen12.mode);
> > +		igt_info(" dw01: [%08x] width: %u\n", cmd[1],
> > +			 data->dw00.gen12.mode == MODE_BYTE ? data->dw01.byte_copy.width :
> > +							data->dw01.page_copy.width);
> > +	}
> >  	igt_info(" dw02: [%08x] height: %u\n", cmd[2], data->dw02.height);
> >  	igt_info(" dw03: [%08x] src pitch: %u\n", cmd[3], data->dw03.src_pitch);
> >  	igt_info(" dw04: [%08x] dst pitch: %u\n", cmd[4], data->dw04.dst_pitch);
> > @@ -1910,8 +1952,15 @@ static void dump_bb_mem_copy_cmd(struct xe_mem_copy_data *data)
> >  		 cmd[7], data->dw07.dst_address_lo);
> >  	igt_info(" dw08: [%08x] dst offset hi (0x%x)\n",
> >  		 cmd[8], data->dw08.dst_address_hi);
> > -	igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
> > -		 cmd[8], data->dw09.dst_mocs, data->dw09.src_mocs);
> > +	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
> > +		igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
> > +			 cmd[9], data->dw09.x2.dst_mocs,
> > +			 data->dw09.x2.src_mocs);
> > +	} else {
> > +		igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
> > +			 cmd[9], data->dw09.gen12.dst_mocs,
> > +			 data->dw09.gen12.src_mocs);
> > +	}
> >  }
> >  
> >  static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
> > @@ -1923,6 +1972,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
> >  	uint32_t width, height, width_max, height_max, remain;
> >  	uint32_t bbe = MI_BATCH_BUFFER_END;
> >  	uint32_t *bb;
> > +	uint32_t devid = intel_get_drm_devid(fd);
> >  
> >  	if (mem->mode == MODE_BYTE) {
> >  		data.dw01.byte_copy.width = -1;
> > @@ -1945,19 +1995,29 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
> >  	width = mem->src.width;
> >  	height = mem->dst.height;
> >  
> > -	data.dw00.client = 0x2;
> > -	data.dw00.opcode = 0x5a;
> > -	data.dw00.length = 8;
> > -	data.dw00.mode = mem->mode;
> > -	data.dw00.copy_type = mem->copy_type;
> > +	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
> > +		data.dw00.x2.client = 0x2;
> > +		data.dw00.x2.opcode = 0x5a;
> > +		data.dw00.x2.length = 8;
> > +		data.dw00.x2.mode = mem->mode;
> > +		data.dw00.x2.copy_type = mem->copy_type;
> > +		data.dw09.x2.src_mocs = mem->src.mocs_index;
> > +		data.dw09.x2.dst_mocs = mem->dst.mocs_index;
> 
> s/x2/xe2/
> 
> > +	} else {
> > +		data.dw00.gen12.client = 0x2;
> > +		data.dw00.gen12.opcode = 0x5a;
> > +		data.dw00.gen12.length = 8;
> > +		data.dw00.gen12.mode = mem->mode;
> > +		data.dw00.gen12.copy_type = mem->copy_type;
> > +		data.dw09.gen12.src_mocs = mem->src.mocs_index;
> > +		data.dw09.gen12.dst_mocs = mem->dst.mocs_index;
> 
> s/gen12/xe/

I have posted a new revision. In the new revision, I have retained the
name as still gen12 because it is how the pre xe2 platforms are referred
in the igt code, check files lib/intel_device_info.c,
lib/intel_cmds_info.c.

Regards,
Bala

> 
> Rest looks good, so with above nits addressed:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> --
> Zbigniew
> 
> > +	}
> >  
> >  	data.dw02.height = height - 1;
> >  	data.dw05.src_address_lo = src_offset;
> >  	data.dw06.src_address_hi = src_offset >> 32;
> >  	data.dw07.dst_address_lo = dst_offset;
> >  	data.dw08.dst_address_hi = dst_offset >> 32;
> > -	data.dw09.src_mocs = mem->src.mocs_index;
> > -	data.dw09.dst_mocs = mem->dst.mocs_index;
> >  
> >  	/* For matrix we don't iterate */
> >  	if (mem->copy_type == TYPE_MATRIX) {
> > @@ -1983,7 +2043,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
> >  
> >  		if (mem->print_bb) {
> >  			igt_info("[MEM COPY]\n");
> > -			dump_bb_mem_copy_cmd(&data);
> > +			dump_bb_mem_copy_cmd(fd, &data);
> >  		}
> >  	} else {
> >  		remain = mem->src.width;
> > @@ -2017,7 +2077,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
> >  
> >  			if (mem->print_bb) {
> >  				igt_info("[MEM COPY]\n");
> > -				dump_bb_mem_copy_cmd(&data);
> > +				dump_bb_mem_copy_cmd(fd, &data);
> >  			}
> >  		}
> >  	}
> > -- 
> > 2.34.1
> > 
