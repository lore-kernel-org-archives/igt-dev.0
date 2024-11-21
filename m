Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9413FD78786
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 16:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FFD10E9CB;
	Thu, 21 Nov 2024 16:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcHvCo3u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DCF10E9CB
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 16:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732205684; x=1763741684;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9e/tfup88RFr0tRwyzHaF/JKAQQtAoHHlIm4YKt3dxA=;
 b=gcHvCo3uCOdJbB+vCFgQqnCBQamDIln+/gtR8sWI/D8Tsf+1RqbpjL49
 Z34VCtSrjNAWJemOUUoyHURwiUt+DgkPfqkPJhQrXNXOcZw04YDL+e8eL
 LY0Ovb/M1fMJFTfxsAQqn410QKS4EXZx8mJXzhA58d7zl9cP7KMxc+5u0
 gZ6PKELe8tBS6Nad24+jJK37uhzC7ZRVirgBiCgou7ZKMG1dVjhPhiJng
 8tGP6wGmzE0Panhq1sxSj4PO+jbBmvdE5GQcLTirmNQulLjFiSGt9/56G
 ts5ZXPvQO2yP3bTXR2lS2xN/eJiIlMAlNPprT1h+GEji9NywKySyVyKx+ w==;
X-CSE-ConnectionGUID: 0Mk3RwNpTdaRQUD58W9jCw==
X-CSE-MsgGUID: B+EbnHWER1ur608s08PhzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32572679"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32572679"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 08:14:44 -0800
X-CSE-ConnectionGUID: KnMf90pkQ5+nipOsIGowNw==
X-CSE-MsgGUID: ZWXUb+ePTp28Wi5cITS9Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="113575560"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 08:14:43 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 08:14:43 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 08:14:43 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 08:14:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ET7cGNTBHpptbnS8WbaiiFMCo83k9c5tfjs4bVyw+X9GQMPoGdKHAqgg5pumM1N+8Jg3xRZbD2fyah12/NKUWJ26VMiXKMinbhv/R4sjuwBo5Yh+jmfv9Ale48uEljkhc9J5G2UMf/sgw5ILjexoaGVRVPx55mooFYM3Em0N7/qBABHc1ZZfOamTh0MIYBhreTSOpHDRuyp7eTY2sSy4+vPT4sUhSvwo8n3P/jmMy9hQ/1eVKWGJfn8HLWxnBhr1WDNu+0JnpqdW8aywJ7Sg2Boxw87PWfmsfn78W/pHyFMi3tUrpgnuD+QrmBjIgIfThket6fbLsFXqOEjAGS0+6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLEQmcV5LUwb7gzqvwUIXqKB1Trican3NNsT9ZtO594=;
 b=N6g7TQJ562+LK952SNkEy7C7i7z8HpU0kMquOIOMWLfvflcot13YBWnk1TycFyvNSlocYITfIJShoghwBi1KP6t4IF59QDBsxo9TR9QQZMa7A9wgX0ELrJr8xEWZgIxDtVlTVLSHUOtXWbdg2lZcIGFjCwdJAjkDLhbNU6mQL7du5b0furPtMIa3SOHauX+Q2Ba26JCMa7XHX09uyPMYUAoeVTWmHHyET+FmC5sJJ3a9W94wZqkyHq048UkuZHvgL6qF1K+LdFurZl5IdS3awFdZDwQLbDFd6kNh4Ny0wC6HNZ304Bk1YM8ttTP8cTORF2ifQ2xJhQdf/rPbwAf1Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by IA1PR11MB7871.namprd11.prod.outlook.com (2603:10b6:208:3f5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 16:14:39 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%3]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 16:14:39 +0000
Message-ID: <c03d8285-1a74-499f-b93d-8214131a5d19@intel.com>
Date: Thu, 21 Nov 2024 17:14:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/4] lib/gppgu_shader: Add read D32 from ppgtt
 virtual address
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <christoph.manszewski@intel.com>, <jonathan.cavitt@intel.com>,
 <mika.kuoppala@intel.com>, <dominik.grzegorzek@intel.com>
References: <20241121122230.451423-1-gwan-gyeong.mun@intel.com>
 <20241121122230.451423-3-gwan-gyeong.mun@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241121122230.451423-3-gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0003.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::9) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|IA1PR11MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: cc2265e2-3c42-4261-1f05-08dd0a47997a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjlaeDN1a1dmVlNubkZFdzdxWGhjNHJlNDk0dzBFa2tSMzJVUnovUEVvak00?=
 =?utf-8?B?cjBIRyttcWdRcFkxSmpLTlJsZHJtMWZzQkVKT09YaDlheHR3OEs0dlEvVmRp?=
 =?utf-8?B?N3RsZzcxUmhGWXd1T3htUW5CcXlOZ2pWU2RzZTR5aFRMVjkrbDBWV2RwNkNn?=
 =?utf-8?B?SERsSHlUMWNQUUZFdEtyUG9ZenAxb0ZGMzFEU2JVUUZFOXFjUk02S3k5cnBy?=
 =?utf-8?B?d20ycEhEeisyQzZBZS8va1k3R0FkVHJZdlU0R0NFYTJMdHB6YnU3aUQ2VmhM?=
 =?utf-8?B?TzF2WVhUc1dEMmZuV0tQTFZzOUNLTXdLblI1YlZYSWZjek5kQ3hzUkhhbEJZ?=
 =?utf-8?B?b01uVktGcVFla3BwT0FnelpZbVFMam1XNStnNU4zaTJ2bkY5c2tuMHIwNG1I?=
 =?utf-8?B?RzdLZHBWakduZmlUK2c4VDZoQjU0eXljYmlFMEFsaWtRaVlTaWkraTIrNVg4?=
 =?utf-8?B?TGU0Qk9GVDlBMlg2R0dXRzFydTBIV2xuUGdkeENUT0xzQUxCNlFDMndKYzdS?=
 =?utf-8?B?MnRxUUlVc2lMZlZTOEhtbnZqdGJxdER4QUhlMXR6aU5US1hiOEkxYVYrS2xX?=
 =?utf-8?B?eGR2UnBsTkFlSXp3cGVrckRyQlRETzh2dnl0QzhmWnc1OVViZk5UTk1heFZm?=
 =?utf-8?B?RVJmcit5OFUySUoxTXExcG8zenQzRkVVZ29CbitNRGdUU2RLdGJDcU1VNFpq?=
 =?utf-8?B?eE1IcThQVVMzUlhhUXBYSzhLQkNhRUQrMkRGOE5DWGdtM3R1OE91T3BsLzRB?=
 =?utf-8?B?UDQ4SFRzaVkrTThBOVhKOCsyWUhnak9DN3dRWk1CV0htdHJMZlk3S3VSV3NH?=
 =?utf-8?B?ZDlLNEhKNi9oY3RyVWs5YVdZMFZ1d1hKYmVZNDcrR2NmWk1SUngzRys4eU5m?=
 =?utf-8?B?dG5xUVk1emFpY3dBd3lxemhhYlpUdWk0T1ZoclpmV3FSZnpUZ1pLcSszc2Vt?=
 =?utf-8?B?V2J2K1lxMGpUUUN0Snp3YlhDWjV6aFNPKzFBUFNKc2k5VURTMk9ydW9lNWd3?=
 =?utf-8?B?WS9mbmhJMjh1RmlTYlBmeWdBclFUazNiblovWFBCTlUwMUNOQXFJZVZlZ004?=
 =?utf-8?B?VThoNmFkRFkzTk5COGczL3FocXhRZlBOTXByNlhmUUFDbjhiM0FoYktRRmk4?=
 =?utf-8?B?c2dVMDVVMDBodWRHZjVjckFIWWVEY1l5dUpvSWE2T0VjU2hFcXdWbEo5UVBT?=
 =?utf-8?B?V05OVEdmbG5NQURPd2xicVFzdUsyb0NvYStINWhsQVc1b3BOTWN6bEtEdlVx?=
 =?utf-8?B?eGhudHZmZUNsZXd5bmc1Q1pWcWs4akhDQUdrYmhHSXlaTHpZNnpLUDhFK1Ur?=
 =?utf-8?B?bFdWSG9NZER5NHBBZFArcDdIbmVhZ2xNMXpjd1VJN3RTNXFnV3FRZGluRGR4?=
 =?utf-8?B?OGZoNCszWXE1WkpVT244VWw0eitoNkRkd042ZUdtK1IzS0Y3dTMrRVBzcUpa?=
 =?utf-8?B?bU4rdnNsckU5bUJRNmdiTmN4b0ZMc3ZsRzdYcjkva21TMWl1SzVNaWhhazBr?=
 =?utf-8?B?K0hxYm5lRHoySGRlU2JQNURGc1N2RzVQemxHckNFRTJqWElHWFZ0R2kzUFpQ?=
 =?utf-8?B?Y0h5K0J1YW4xMEdXRXVqT2pYT2NxZnoxaWJiK0FwemJFM3ljRmoxdElCc1pr?=
 =?utf-8?B?ek4xMDdXVFVPdEpvaVYzZ3BjemN5WjlvbHRQWENzWC9yYjU5WU1ldWFDNFRT?=
 =?utf-8?B?NlhJNUg4b2xuVUJwR091Ti92bS9veDdpcWhTZDBMbXp3MHQ1WGtHMEUzWm11?=
 =?utf-8?Q?ns+hyrqPjskaZHMlkeuLK2dHHvn/4OzHTLcgf7L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmZWNEtrbWx6S0JERnhGQWU5WGY1M09yWHoyQVQ3c1JZRDNJYzlkdWNqL3JJ?=
 =?utf-8?B?MXpSOWh3L2RiMVZrUS9iZFh2Y0E4bk5BZGVpMmNmTk9qNTc0QklIWHRxYU5J?=
 =?utf-8?B?R0Jra0dTSWVqbVQveitUSFg0TFVDQVJIbWh1dGlTcUVkcmhUeklqR1ZGNWtG?=
 =?utf-8?B?ZE9EbW9CMVB3NSs1Yllib1NMcnBSbUY3V2ppaW02UzFXR21kMzR4M2dYZXYw?=
 =?utf-8?B?dG1jOGdacksyV25UNnI4SDNYNnBSL252bGlOTmp2MjVlNG9aV0JsTCtxN05F?=
 =?utf-8?B?bXNMZ0wxemQvNERFaWRyQUxROG1FOGNNdkY0dGJOQ1Nxck1DSFYzZUZSVGNM?=
 =?utf-8?B?dVJveENndjhMYjZOaWlTUXNKY3Z3RUxPdlErUkZkSzhnSXF0SGFGZHF2UGF0?=
 =?utf-8?B?K2l1aytyMDZ4OTNTUk5xSW9aSjZ0c0JHNUUyekZtVVE1N0tXYWFkVklrdzIr?=
 =?utf-8?B?eDMxQTdNbE0zUkhmb0pZKzNUVG1uWWlsL1V6aU11M1hoRy9BaStubkY1UCs3?=
 =?utf-8?B?MFpvKzI0Y25OZ2NNalEwdm5hOHBCUzg3ZDFUNEVVWklKd2MvRnBBVFBTZUw2?=
 =?utf-8?B?Q1g0YU1XcjNrYTY2QzhLWVJNWXNTRUJ2eDA0ZzBZekFBYkFOODk5bndFaG82?=
 =?utf-8?B?Q1Qvd20xT1VsQWJoOEhCVUF0K2g4emVZWVdDek9WOWFrU1k4ZXFWa2Y1TjBC?=
 =?utf-8?B?SGhZRkR0anVYbkhKcFBQakRTbzBlOUVrTVdsMlE3VzRXbjd3MXlJd2RNT0JI?=
 =?utf-8?B?MHBFOXVoMUF3LzFKSlZCY21pQUx4bjRzblNvNUNOSFpYRGN2WGNtMCtYaHhC?=
 =?utf-8?B?bTdlbXdzUjJQUmtPK051ck5kT1A3R0hiODhzRlhWSG0zUkJqNUhOMWxWaVB5?=
 =?utf-8?B?SUM4WFU1TzUxNTJMNGtWaHVQbXl2L2JuMGR5MG5zWXk1YXBxaldOVS9ZTmRG?=
 =?utf-8?B?SXRFQm9LZ3BlMHU2SVN4M1YxM2pQbXFjSmV4R0lKQUxCS0RpbmxYUC9ZbGhp?=
 =?utf-8?B?eXZPRWt0QVMrUmo5MDl0N2dUcWhuSURBSURMT1BPT2ZkejlOMVd6YjRKYzJm?=
 =?utf-8?B?eFRZMEs3U3RSZ0I0TFgvOVNnNENBLzRMbzVkRUVxUzFENis2djNiQnZCVjdj?=
 =?utf-8?B?ZVZFeWxHci9RdXc1czlwVWtBaWw3OVJxK0xNYXJoM1NKNldPMnBGWFRDY3ls?=
 =?utf-8?B?UWcvSnBLTGN3ZDNsVi9wZ0hBMTUvMDByTkF5TzVUb0dTSFVZWVdZUXlNWjY2?=
 =?utf-8?B?U29DYTUrQUlFZytRMFovOGFkMmUxN3hPR2xiSVg3NFI5bzRqaUd1SVkyc3c3?=
 =?utf-8?B?R2ZCTyttTFh0a3pRYVNvVVVSejRvQ2k4Q3RFL0pwbjhkNEZ6c1Z4QzlRTWFS?=
 =?utf-8?B?cmZjaUI4UDZFemNhMmp4Z2V1a0JmanFYSmpzRkNjSjZpOE1yQmc0a3M0a2Nu?=
 =?utf-8?B?dmhPTjhRekNJNmZVNGlZTS9HRW1SWXhvdHhKVkdYbFRDV05zYkMvKzNYMldH?=
 =?utf-8?B?b1FjdDdzUXdxNk4rcENNdHNWNldmdHhSNVFVMnBlaVFKa0lVdUJsMCtqWWF2?=
 =?utf-8?B?N3I3OTNEaG95M2k1NC96SmZYKy9MQzJ5NlZmbVJVRHYrV1cxSjdLZHh5V2lW?=
 =?utf-8?B?cWFlT28yTFNscGhDUnY3elBVd3Bkb3dFb2k5ZVJtdExMMjR2MHVUNXhGRk53?=
 =?utf-8?B?cUpLenhOaG1QWFJ1dEFyRDJqOTBWb2RDdks5eHZNQ2ppTDlWVmJoVGtzQjl1?=
 =?utf-8?B?Z01wQm5vaVJFelVWMGtIUnEzZmpqNk1iS2gvaS9PUmY3VEZjcVE2MWVRQ2pv?=
 =?utf-8?B?eHdJMWVRVFp6K0ZxNzVmMzVyYksrNlFpWU5JalplTTRDTU1TQTNPT3RpRkQv?=
 =?utf-8?B?ZnBMbVNYY2RNaUx3Y2ZneERwV211aEczTzFIL29rdnZ3QlJ3alkzbTcvcEdS?=
 =?utf-8?B?dHZJSUJSYm5wRlcxS3E5OUpvTGJ2aFNXNWNuc0N4OTV6VDFraU9NSEpZNzF6?=
 =?utf-8?B?ZzR6S2RsWVgrd2hGNzQyUk5sV1RtSDRmUmZRRDRZQ3F2dE93a3FiL3RpQ09E?=
 =?utf-8?B?OFd5RWRDM2duUHlGM3ZUaXE5bVUxUHZBYjRzbW1QSzFtZkxNTC9JYXI2c1VH?=
 =?utf-8?B?TlpoSXhyWDZHN2FJUVB5dmQzNUxGZHRNK3FCa2RPNkRQb3UvWDZWeDFzR05D?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2265e2-3c42-4261-1f05-08dd0a47997a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 16:14:39.2939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nan90SPt0O4PzsnGdQ1L2acelpVlFnZ7k+gh+UUTZR52CATAgeCgtrKsJfZa0C4TvsAdbh0xKtZVkUXh0htw9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7871
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


W dniu 21.11.2024 o 13:22, Gwan-gyeong Mun pisze:
> Create a function that adds the capabilty to read an dword size from a
> given ppgtt address. Use an Untyped 2D Block Array Load DataPort
> functionality of XE2+ with A64 flat addressing to direct accessing an
> entire ppgtt address space.
>
> For the read to succeed, the given ppgtt virtual address has to be bound.
> Otherwise a load page fault will be triggered.
>
> v2: Fix the function name to be more clear. (Christoph)
>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>   lib/gpgpu_shader.c          | 94 +++++++++++++++++++++++++++++++++++++
>   lib/gpgpu_shader.h          |  1 +
>   lib/iga64_generated_codes.c | 21 ++++++++-
>   3 files changed, 115 insertions(+), 1 deletion(-)
>
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index d9da35895..147df3a3d 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -897,3 +897,97 @@ void gpgpu_shader__write_a64_dword(struct gpgpu_shader *shdr, uint64_t ppgtt_add
>   #endif										\n\
>   	", lower_32_bits(addr), upper_32_bits(addr), value);
>   }
> +
> +/**
> + * gpgpu_shader__read_a64_dword:
> + * @shdr: shader to be modified
> + * @ppgtt_addr: read target ppgtt virtual address
> + *
> + * Read one D32 data (DW; DoubleWord) directly from the target ppgtt virtual
> + * address (A64 Flat Address model).
> + *
> + * Note: for the read to succeed, the address specified by @ppgtt_addr has
> + * to be bound. Otherwise a load page fault will be triggered.
> + */
> +void gpgpu_shader__read_a64_dword(struct gpgpu_shader *shdr, uint64_t ppgtt_addr)
> +{
> +	uint64_t addr = CANONICAL(ppgtt_addr);
> +
> +	igt_assert_f((addr & 0x3) == 0, "address must be aligned to DWord!\n");
> +
> +	emit_iga64_code(shdr, read_a64_dword, "					\n\
> +#if GEN_VER >= 2000								\n\
> +// Unyped 2D Block Array Load 							\n\
> +// Instruction_Load2DBlockArray							\n\
> +// bspec: 63972									\n\
> +// src0 address payload (Untyped2DBLOCKAddressPayload) specifies both		\n\
> +//	the block parameters and the 2D Surface parameters.			\n\
> +// Untyped2DBLOCKAddressPayload							\n\
> +// bspec: 63986									\n\
> +// [243:240] Array Length: 0 (length is 1)					\n\
> +// [239:232] Block Height: 0 (height is 1)					\n\
> +// [231:224] Block Width: 0xf (width is 16)					\n\
> +// [223:192] Block Start Y: 0							\n\
> +// [191:160] Block Start X: 0							\n\
> +// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 bytes)			\n\
> +// [127:96] Untyped 2D Surface Height: 0 (height is 1)				\n\
> +// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 bytes)			\n\
> +// [63:0] Untyped 2D Surface Base Address					\n\
> +// initialize register								\n\
> +(W)	mov (8)			r30.0<1>:uq	0x0:uq				\n\
> +// [0:31] Untyped 2D Surface Base Address low					\n\
> +(W)	mov (1)			r30.0<1>:ud	ARG(0):ud			\n\
> +// [32:63] Untyped 2D Surface Base Address high					\n\
> +(W)	mov (1)			r30.1<1>:ud ARG(1):ud				\n\
> +// [95:64] Untyped 2D Surface Width: 0x3f					\n\
> +//	   (Width minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
> +(W)	mov (1) 		r30.2<1>:ud	0x3f:ud				\n\
> +// [127:96] Untyped 2D Surface Height: 0x0					\n\
> +//	    (Height minus 1 (in number of data elements) of			\n\
> +//	    the Untyped 2D surface, it represents 1)				\n\
> +(W)	mov (1) 		r30.3<1>:ud	0x0:ud				\n\


No need to setting to 0 twice.


> +// [159:128] Untyped 2D Surface Pitch: 0x3f					\n\
> +//	     (Pitch minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
> +(W)	mov (1)			r30.4<1>:ud	0x3f:ud				\n\
> +// [231:224] Block Width: 0xf (15)						\n\
> +//	     (Specifies the width minus 1 (in number of data elements) for this	\n\
> +//	     rectangular region, it represents 16)				\n\
> +// Block width (encoded_value + 1) must be a multiple of DW (4 bytes).		\n\
> +// [239:232] Block Height: 0							\n\
> +//	     (Specifies the height minus 1 (in number of data elements) for	\n\
> +//	     this rectangular region, it represents 1)				\n\
> +// [243:240] Array Length: 0							\n\
> +//	     (Specifies Array Length minus 1 for Load2DBlockArray messages,	\n\
> +//	     must be zero for 2D Block Store messages, it represents 1)		\n\
> +(W)	mov (1)			r30.7<1>:ud	0xf:ud				\n\


Again maybe 0x3.


> +//										\n\
> +// dest data payload format is selected by Data Size.				\n\
> +// Block Height x Block Width x Data size / GRF Register size			\n\
> +//	=> 1 x 16 x 32bit / 512bit = 1						\n\
> +// data payload format size is 1 GRF Register.					\n\
> +//										\n\
> +// send.ugm Untyped 2D Block Array Load						\n\
> +// Format: send.ugm (1) dst src0 src1 ExtMsg MsgDesc				\n\
> +// Execution Mask restriction: SIMT1						\n\
> +//										\n\
> +// Extended Message Descriptor (Dataport Extended Descriptor Imm 2D Block)	\n\
> +// bspec: 67780									\n\
> +// 0x0 =>									\n\
> +// [32:22] Global Y_offset: 0							\n\
> +// [21:12] Global X_offset: 0							\n\
> +//										\n\
> +// Message Descriptor								\n\
> +// bspec: 63972									\n\
> +// 0x2128403 =>									\n\
> +// [30:29] Address Type: 0 (FLAT)						\n\
> +// [28:25] Src0 Length: 1							\n\
> +// [24:20] Dest Length: 1							\n\
> +// [19:16] Cache : 2 (L1UC_L3UC) 10						\n\
> +// [15] Transpose Block: 1							\n\
> +// [11:9] Data Size: 2 (D32) 10							\n\
> +// [7] VNNI Transform: 0							\n\
> +// [5:0] Load Operation: 3 (Load 2D Block) 11					\n\
> +(W)	send.ugm (1)		r31	r30	null	0x0	0x2128403	\n\
> +#endif										\n\
> +	", lower_32_bits(addr), upper_32_bits(addr));

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> +}
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index 18a4c9725..07ed0fe1b 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -87,6 +87,7 @@ void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t dw, ui
>   				      uint32_t y_offset, uint32_t mask, uint32_t value);
>   void gpgpu_shader__write_a64_dword(struct gpgpu_shader *shdr, uint64_t ppgtt_addr,
>   				   uint32_t value);
> +void gpgpu_shader__read_a64_dword(struct gpgpu_shader *shdr, uint64_t ppgtt_addr);
>   void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
>   void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
>   void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> index e97bcf042..721ac267f 100644
> --- a/lib/iga64_generated_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -3,7 +3,7 @@
>   
>   #include "gpgpu_shader.h"
>   
> -#define MD5_SUM_IGA64_ASMS a1ee0173014ab4cda3090faeca1cbae1
> +#define MD5_SUM_IGA64_ASMS bdc80eeb9a11b97ff51422a39f4623f5
>   
>   struct iga64_template const iga64_code_gpgpu_fill[] = {
>   	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> @@ -79,6 +79,25 @@ struct iga64_template const iga64_code_gpgpu_fill[] = {
>   	}}
>   };
>   
> +struct iga64_template const iga64_code_read_a64_dword[] = {
> +	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> +		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1e254220, 0x00000000, 0x0000003f,
> +		0x80000061, 0x1e354220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e454220, 0x00000000, 0x0000003f,
> +		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
> +		0x80032031, 0x1f0c0000, 0xf8061e0c, 0x00a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
> +
> +	}}
> +};
> +
>   struct iga64_template const iga64_code_write_a64_dword[] = {
>   	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
>   		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
