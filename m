Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5A7C83F07
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 12:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F36810E01F;
	Mon,  7 Jul 2025 12:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CeOMCQS4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FD510E01F
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 12:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751892841; x=1783428841;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rIsdOlhYrYQENN4SqoVHsRFQSUyxGu12+cMTu4EL9jc=;
 b=CeOMCQS424YlPVFC5emcaXistTF72Of53tRBat6zLH106cNm/K/cf2s7
 GTbSHbguFNsmLjTs51sQgHr2xN26awjqKHuE4lLySaUHQ+zsekIC2qfVi
 ZVoq7u3mU/qAmKD4A6sp85bc5AKH473YuXxf2HjGxQnzmu0HSMFNFM1CN
 CvCWN7fL5Q3LfzsuyWk77lEva8ReO171oJZFa57z+3vYslfW16VaBiden
 rkz3NQtIX1tk0pluqihZoHhUcjfmgd6G30Hpg9SasvgngOn4Vc/qoWWy2
 A4w3kn7mpuc4Kjs3al40j/C7XmhVdfvCZ52WQXclXDP+PbTkVMJsTPjdp w==;
X-CSE-ConnectionGUID: vhfwQn8rSoibDlw9LsBRzA==
X-CSE-MsgGUID: HAGxjpc/SESglKNnObExcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="71691776"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="71691776"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 05:53:51 -0700
X-CSE-ConnectionGUID: X7hPVrpsRyuQYZw1Oktvnw==
X-CSE-MsgGUID: uoMgP4CuQrme78lVDTYlVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="154617581"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 05:53:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 05:53:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 05:53:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.83)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 05:53:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUlQy2up06n9BeDQA2rVC4E/Pk5PDQU1XDyIIUUdzCCkWiw2h7RFlh/aFQBCGxH9Fb6wJbYvWwP7BJgkUweuFXVXkYFCZZlRT84nqNuzJwToIn44GWfBBQOMXtRVGDwOgmXepPa+vjYjERA5wPGH3OR/uhUzZMwP8dykLGbvTdiI5841VOX5nP3NlFM11Js+PD9Q2Q9zhYCu/EO8QX/5vHB8I3gC759hmkDXDjb3znpLAcBxvAem84dHFSvH0EJjoO6Z6Q3IL9JAMpDgVpM09HjPBCd99TusAOgaYUWudpkgF4pzjTCyYnLmSywarDXV9AkNuqYN1Js1LsQXiI0IRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jWrGSvpTLdtay9jmxJOv++GaYbSCGFwtrhPBq2onQE=;
 b=DrdktGYFiw8GqAi3ptRcpMq+9hjkVeyQp7noayUT+ze77DbBhVT9SgqctltOfgpv0Rks98pWvLAyz82mw2DMiFaMnqqAxW0nm/y2CYu8RhC8SVwOU2Qu/0OC4EUpXFC19uQQJEG/C4Mq78B4PzVQcmC6CWHmJuMaaUCgJVBFEev2J872lmnC7kHKAo6rqFxuX3rhYPPGNgS5cJMK8qmou9IISqOYPtl2j07Ke9Vmx10/TNiKWs6bTyuRWr/PP68nuOL7pUA+h1A5mS5rFS4CDgcKHck4VX3y9kkSKVNPdypuI8vw6aOljkiWb3LTGDTEqBoBmfyj9YTMAaxF6SXMjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA0PR11MB7816.namprd11.prod.outlook.com (2603:10b6:208:407::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 12:53:48 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 12:53:48 +0000
Message-ID: <717d13c0-2b02-4bf9-adb2-d4a268fbec61@intel.com>
Date: Mon, 7 Jul 2025 18:23:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/kms_cursor_crc: optimise cursor crc on
 simulation
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Santhosh Reddy Guddati
 <santhosh.reddy.guddati@intel.com>, <igt-dev@lists.freedesktop.org>,
 <karthik.b.s@intel.com>, <arun.r.murthy@intel.com>, <jeevan.b@intel.com>,
 <pranay.samala@intel.com>
References: <20250702091643.967483-1-santhosh.reddy.guddati@intel.com>
 <20250702132102.s55zwxhq3j4fmdmg@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250702132102.s55zwxhq3j4fmdmg@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::23) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA0PR11MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: 1327fe86-6300-48db-c040-08ddbd5550b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UExBUm5yV3ZMcUN1Nzl1NkxBQ0t0SkpkVzVPdHhFWVFoWjNWS05tWnc4Rjd2?=
 =?utf-8?B?L2EvVXNmVCtkSXVjWlpSUzV2OEZpazh5eTQ4Y0hYR2t6eWJjQkhPWC9aZDh3?=
 =?utf-8?B?YmdEZk1zeEdZa1lEU1FSd2RZQ2RZd1NoWXJBdnlWMnlVTE5Ra2Zxd1h1Ym1p?=
 =?utf-8?B?MDBPc2t5TTJoaTVOUVRaeHRsUEhWM296Nk9oQTB6S05BVTJLNmttRnBvT1dW?=
 =?utf-8?B?Rm9USWFSRVhZYVlhSUlFd2JEc0NIWjlHWHdnZDI0Rnh4Z1FUZTRvY0tIakgr?=
 =?utf-8?B?T1FCSVNYZVRDVER1OXdpUWtmamhiZmdNdVV4aXNLcXRVcEExUGxaS01ib2xH?=
 =?utf-8?B?MlQyWFI5QlRxUFRvRDZBZGhuWmU5azJjNURJZURtaWpGT0JZaGRwVGVJaDdS?=
 =?utf-8?B?ZEZqUnY5SlhJbXUxMHhJVWxhTm5BWU1tV1J1SFpPdXpuNHM3RDlOd3NPdFg0?=
 =?utf-8?B?UWg3bk4zVVpWMXIydGE5dmdCTmtqS0FnM2NrRXZJMDNVN0NwS3pFelpSc0JN?=
 =?utf-8?B?bTNmV3BCazgxbUFLRFBRYzV2eldWQURlYnRPc2x2SDFSMW5ZWkkvdTJDREIz?=
 =?utf-8?B?SVMvK0QrbHUrcDFycGNlVkJlb1FyaVpzK3kvSG5vT1padU1oRFVTVUJ6bTFG?=
 =?utf-8?B?VHYwZ3RQOFFkeExBQVpoQndOUks4SHZXZUhwdDZib3NzdVVoOS8zVHV0eXdO?=
 =?utf-8?B?ZVY3aEYwVTlkbUVLdWVsVGF3RmRBaGpCTjNUOFlhZU1hL0ZBcEZRTkErQXhB?=
 =?utf-8?B?MTVid3pHUmNZOTFBSFJMMW52dE5iN1BlNWQxRFdYTUVPcjQ0ZXRHcDFkTmdL?=
 =?utf-8?B?UFJneXdTbWkrTDRTcHhKbEo4TDJpaGpJRnBkUVZLbzlqTEZUY3l1bmFHZUhi?=
 =?utf-8?B?R1RrbUNtSjRBT3pxZkplcDc5Y1p6SVNqMzZ3Qi9DWVVtV2pnRmJ1cG1EN0Y5?=
 =?utf-8?B?SmpDajR6RmM2ZUdTVHAvb2pZZ3lrbHJSQmlMOFpsRWExams0YXdGZ1JhdTB2?=
 =?utf-8?B?N3ArbnhxN2prY2cyNTFnZWtEMU1acXBnb0VUWHJYMGdnOXhiMFppZ3UzVUdh?=
 =?utf-8?B?MUQ0clNleFdQVHNTd0t5TFl2UXBEb0F2MU5kYWRBZ3BmTC9USWR3VVE2UUdN?=
 =?utf-8?B?RmQ0YjhZMldkK1drTERqRHVXbXF5Mms1WG1NcmRaSGRwOUlRMFNOZUlueDBW?=
 =?utf-8?B?TzhlUWNlL1BzUnRXR1RxRnk2NjRYMEdTaUtRdVZuVlhkK2MzOExQNHZrci9G?=
 =?utf-8?B?MytTTzRQbkNUYWpIM0UvTWltUTdJQmIzdDZCLzJwcmZkNXZheURSWjVSVTFo?=
 =?utf-8?B?RnArTUxoa04vT2dPMjlzV2w3eTFkKzMrYXc2amtuRXRhQVc0ZXM0SDBTT0Rx?=
 =?utf-8?B?aFZWeFg3b0ZlSCtDa3ZodllnN0I1U2kySEN4OXpPOGFva2tiUUoxVmhRZzFu?=
 =?utf-8?B?eDNYWXVrZEg1d0JsK2s5K2dnS002Z2lBbEgxSHFCU21oYUtVMmZtODJUenZI?=
 =?utf-8?B?M1o2RFRYZUxkajRQa2VrTzZpRkY2ZkdITlhMUnhuVXAvSmpUWCtsV2kwR3lM?=
 =?utf-8?B?NHlaMHF4bHQ4a0QyRUthNFhtd0l5TFlZV01nQ1ZnVW9BTHM3OVpNVVhna1RT?=
 =?utf-8?B?MXd3c09uamFQV3paaUwrUll3U25DL3JlcGMvdUY1U1IrQUhoK21WVk5MMnpS?=
 =?utf-8?B?WS80cHJEYUYvcDNFaUFwaGdZZm9TZnRKMjFhVFN5TXo5RDBVb3YrNXkyYm9V?=
 =?utf-8?B?VkFMZk51TU8wdlVtUEV5Y1g5QXJoN0owSUlEenZIQWxFV3hRZVNEV25tdVov?=
 =?utf-8?B?ZDJ3M0QyMDJnM3RqT282YlQ2d2xxK0tNK3FTTWJPTVdPWXA0TXA5NWxGa2RL?=
 =?utf-8?B?SE1WeVRXN1VwVFhNSnovWkVRT2FrU2dmWG12cnVRT28zTlN4SjlZS1FLdVN5?=
 =?utf-8?Q?5sNEQbwn650=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkhWRHFLMUpCZUVWWXBNZG85eEp5NkExeGJWY2Vyb3k1U09FSXVTWUhKTU5y?=
 =?utf-8?B?Y0FaVjNJc3FabkpmYjVpcjNRdFZjaFNiaHF1UUgxZUs5MTV0U3NDeGpramZ2?=
 =?utf-8?B?UWVRT3Q2QWNhb3hTTkZWVG40NnBIeVhLNWJIVkZOcGdxNzgrbHZIckhjY2Jz?=
 =?utf-8?B?ekZkem1Ta2Zaa2VGZ1pPVVFqbjJzSktyZjZQdGdpQlk3dUZvZGxHcmUxSTdz?=
 =?utf-8?B?aVdCeWRYQXFnQXU0cng4bkx1QlROR2t4emdIZWwzTWtKUGxLRitTdVg4bjI0?=
 =?utf-8?B?TlU5c3Q5Nk5TSXQ1UXhBMi9iVlVJekZPemFaSXRITHNJaVJwUE00YzhSTlIv?=
 =?utf-8?B?dVdtYUFhOWhiOWpDc0d1UXVXWWgrK05naVNweTBMSVNGK2hzaWtCZG1ZT2tO?=
 =?utf-8?B?aFU1VmN4d1RTUlpVTTVXRlpUa3JhTlRnOUxsckU5Zi92R2tIaVg4d3BVZUFO?=
 =?utf-8?B?czZ0bmlFK1BEQWIwSlNEajNjZHZUeGFSYjQ0NGF4Znl1SytkNk5CUEo5bWFM?=
 =?utf-8?B?QU5haE1UWmgyNS8xYy9ZZkpjdzVnVDNCQ3l4UFBvZ2pyTm0xbkRjaDBLTFI4?=
 =?utf-8?B?NkE3RFBueDlLZXRZLytBbHFmclE5NG1SL0hlUi9nWnpkWnQxdCtiK3ZJYmYz?=
 =?utf-8?B?bHE5blJZWFNKZjlUV3IyMC93Sjk3K0J5QTJ3bFk2Wktzd0R0NldQempYdno0?=
 =?utf-8?B?cC93TEtCZExVdGg1Q1NNQ0R4Y0ZWWDRsazRTaFNIUmprR2FMQ2lMR2VUYkR0?=
 =?utf-8?B?KzAxdWtQaE5xZlVrTUw5ellHSTlYVlI3bWYrZ214QVNHSjhmOEtRN3RYZVlJ?=
 =?utf-8?B?NlF6b2pwYTJWRVVQNzBsL1I1ZUtmK3UremNiVWZtTkdUekw0NVJUSUdLS1Rh?=
 =?utf-8?B?QUJhWEViSmdvQ2xSa2F5cDFsS0FDc3R3SGdoSlkwbUpXVlczVWY2MHB6Z0l6?=
 =?utf-8?B?UTU3eTM2QWVnRUVhejhOd1FodmdFb3g0NzEvKytaaDFvRURiYjB3RkZOdDBk?=
 =?utf-8?B?YjFuMExtR2NIVmp0aG9TdVVqbzc2bDdnam5tRFFBd0JsN2kvc1BRY0pocmxB?=
 =?utf-8?B?Q1RCUjZ2RGk0bUhFZ3pTeEhJSWF5aUJaR1g5MTgyMCt6M1NQQ0VvS2p0aGJs?=
 =?utf-8?B?d1d1UkxjWEFPVlY3bmMzWURWWkR3elRWUlpVbTcxUmFCQU1HTG8vVko4RUN1?=
 =?utf-8?B?TEUxNVliblJscHVvMW0yRFZaZ0xuNzcrMUsxYXJadnRDZE5BYVZ2ZW8rdWNV?=
 =?utf-8?B?Q3ZkSUJ4VlV0MFdVSzJZQmd1WGtsNzNMdzRsRmwxTkluSitYK3RBZm9IWjlv?=
 =?utf-8?B?Ui9XMnJjOXIycXhhNlJjWGpQNFFzOTZqQkQzeHBBQ1ZOYU9EOGduYWRwblVJ?=
 =?utf-8?B?b3JzY0NLUWw5aEVXczRuN0lBTVVMWWdzblhMTlVvKzJqNys2L0t2MmdDbENM?=
 =?utf-8?B?cDNObXdQWlRDZndwbXlkRmM4VXFSM214akR0SnFNVklyMjFZQktZRWZLZlJN?=
 =?utf-8?B?UjNqdWhXWUtlK1prVUVHanFqRjdUU0NxeWJDSU1KODVKU214S3E1dEphelNW?=
 =?utf-8?B?NkluOXBpOFJLMUxVeTJ2YUVubXF4NWxlczRJOWdiS2psK1BMZldNQ1NNWW01?=
 =?utf-8?B?M1RZY2JJU2lHUjBmL0hZRDM3ejZVaG5Vc2tYMTB1QTh1UEdTMDJwNnR1MVkz?=
 =?utf-8?B?UFEvcnNHdGpwOUpldzhVVzVYamZnTnJMa3UvUDBMTEppb0UvV3ZwQWtlbzJz?=
 =?utf-8?B?UHBoMHJoQjc3MmllZDRRWHZzcjRVQzhpeGhaS21xeUpZRmp0VVdYUGIwbnBz?=
 =?utf-8?B?R1hUMDMxc3NrYzVXU0k1YVdXNm5xVVZKZTVlRG5SY3JaQ1FwVTdSYzVlNkZp?=
 =?utf-8?B?dXhBWGh2SVNpTGFidzByZ2NOTXBlVFdJVWtzU2hNdnpBWXROK254R1BJcmlI?=
 =?utf-8?B?cWluaFhrYis5SGJTeTdWSEk1WjlzWVNWdFlNeW9ZeGJSa2tOT21sZ1lBM1JQ?=
 =?utf-8?B?OFJQcUdHNjdjemtMaERhNzhCenRTWTNyZlZheTNKRWwrTklPSWtmMjNNZkJ1?=
 =?utf-8?B?VGFSMDlWVHpJWmFBUzhieURmbmtIYkdWSnVwQzJObGgvVUFwM3RrVVBNU29v?=
 =?utf-8?B?Q3RyUm9qUE5zUkFscVdvQ2pnU1N4cjFuMzBRcm8yMHRaVDBLcml6TElxZlRo?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1327fe86-6300-48db-c040-08ddbd5550b4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:53:48.4510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02hksIrBRRqaHdc6M61IGH85g34FuS2UrWhkDZcnsVj6z3R4FYLQ8yAGdbs/TDCXApCtAkvQt/rPCgcvxOsZSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7816
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

Hi Santosh,

On 02-07-2025 06:51 pm, Kamil Konieczny wrote:
> Hi Santhosh,
> On 2025-07-02 at 14:46:43 +0530, Santhosh Reddy Guddati wrote:
>> Reduce the number of test crc iterations on simulation to avoid timeouts
>> on simulation.
"on simulation" is repeated and looks awkward. You can rephrase it
"Reduce CRC test iterations in simulation to avoid timeouts."

With this fixed. Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>>
>> V2: Avoid usage of extra variable to check run_in_simuation (Pranay)
>> V3: Initialise max and avoid unnecessary bump (Kamil)
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
>> ---
>>   tests/kms_cursor_crc.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
>> index cacd2402c..8a465dc6b 100644
>> --- a/tests/kms_cursor_crc.c
>> +++ b/tests/kms_cursor_crc.c
>> @@ -490,10 +490,15 @@ static void test_crc_offscreen(data_t *data)
>>   static void test_crc_sliding(data_t *data)
>>   {
>>   	int i;
>> +	int max;
>> +
>>   	struct {
>>   		igt_crc_t crc[3];
>>   	} rounds[16] = {};
>>   
>> +	/* In simulation, we only run a few rounds to keep the test fast */
>> +	max = igt_run_in_simulation() ? 4 : 16;
>> +
>>   	/* Make sure cursor moves smoothly and pixel-by-pixel, and that there are
>>   	 * no alignment issues. Horizontal, vertical and diagonal test.
>>   	 */
>> @@ -502,7 +507,7 @@ static void test_crc_sliding(data_t *data)
>>   	cursor_enable(data);
>>   	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
>>   
>> -	for (i = 0; i < ARRAY_SIZE(rounds); i++) {
>> +	for (i = 0; i < max; i++) {
>>   		do_single_test(data, i, 0, true, &rounds[i].crc[0]);
>>   		do_single_test(data, 0, i, true, &rounds[i].crc[1]);
>>   		do_single_test(data, i, i, true, &rounds[i].crc[2]);
>> @@ -510,7 +515,7 @@ static void test_crc_sliding(data_t *data)
>>   
>>   	/* SW test */
>>   	cursor_disable(data);
>> -	for (i = 0; i < ARRAY_SIZE(rounds); i++) {
>> +	for (i = 0; i < max; i++) {
>>   		do_single_test(data, i, 0, false, &rounds[i].crc[0]);
>>   		do_single_test(data, 0, i, false, &rounds[i].crc[1]);
>>   		do_single_test(data, i, i, false, &rounds[i].crc[2]);
>> @@ -526,6 +531,9 @@ static void test_crc_random(data_t *data)
>>   
>>   	/* Random cursor placement */
>>   
>> +	if (igt_run_in_simulation() && max > 10)
>> +		max = 10;
>> +
>>   	/* HW test */
>>   	cursor_enable(data);
>>   	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
>> -- 
>> 2.34.1
>>

