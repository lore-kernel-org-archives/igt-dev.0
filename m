Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0C9E81BBE
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 13:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630DB10E3E8;
	Mon,  9 Feb 2026 13:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EoIZD4og";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5B510E3E8
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 13:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770642397; x=1802178397;
 h=content-transfer-encoding:date:message-id:from:to:cc:
 subject:references:in-reply-to:mime-version;
 bh=Nbx+piGuoFJ9PJA3zAY4rrppbUmZOB6aH+UliArAqds=;
 b=EoIZD4ogmx+v7808xCdbIbzdCSFBOzw0h96jdRZUp4Slbz58A3F9YgIK
 0lOcUHTNfGliZCxZPnUZsvf/2SSG68XryrrxXRqWNcwgWE91jx2exdkxy
 h86DNBuQYGxuSh1TvQIzGKJg72fPm93ZQt9Ikcxh0oHX289x9YFSHeq6+
 njfNvfpARCV/Zs0Ra0CTv2414CzfYvu4WvLInb/k46vuFFKAl4XYTe05J
 RKz0M7iYSjKUKd39wtw/en5BiTStyH9YvI7JaIh9dchcijscGq0atq7M4
 MclGE/cYLB/8OwrEeu+ja3MvE/YJlW3iv8qVNtyOfGVLbJubZ7/ihOHSn Q==;
X-CSE-ConnectionGUID: gAnfa8vaT1KgCgbtk72TFw==
X-CSE-MsgGUID: L92P27FuQA2vfBthVYXhEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89335780"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="89335780"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 05:06:36 -0800
X-CSE-ConnectionGUID: hnnNy2zyTFiYPR7INGNIFQ==
X-CSE-MsgGUID: GktD1jKVS3GKJhuRnDfWnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="210752940"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 05:06:36 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 05:06:35 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 05:06:35 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 05:06:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5AwKvfbIN1dk3NZV9+PGFMDSC2tXecJZ9MeYQbG3QuMh4myHq8EVtTl1oIJ47PRn1eqfIIDCHthmfuvv3oZC2d/zDgZ/2b5TOH1jakzFcqyBbEigG0LLsJLijT5n0F5b4GaxAbETZP51gKgN7+asW3hrtn9uwaYLk3rQntY1FDh2B6HDEOythJiWJg7p4v9ltGzmKYThZSTNP8awFvoJUeeb5PZ8+Sa9nKq1KOu8+XQTDNlF0X6jDgpFfrN5yd7i0nVSX/T0pJQtSF9HNhmEPJBvBN9qnDNXyHPIVsKGPK4cbtuIpbk5r+bN+h7yvLanevWZiYNSFHg+ncGHp/r0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nbx+piGuoFJ9PJA3zAY4rrppbUmZOB6aH+UliArAqds=;
 b=dUX9W0U2+2A6lfWTyhmkyC2Mj8c2JGVxuOdx1cemts96d6hcu0bxwmdpzeJ6A9J/QGf6DodouXzWgv57ViSvTpkJmPDZzu9w6OhGPW8PCxUEqEHBw7zUkGRcho4D8zRSNG2R4wY3ogMUGofFYg7nqJ9AlO6vCf2ThQnWPrjpKtQQq9rs5DckCmBcQCtWkJjDZmophl22lXVzPDCz+fVJKvqNeZCrS1JDTUhjZVFO3fv4fW0JeN2oMxHMaOYy/8j5l2RhyKrdAhPRyEPfaOWBxHt8EK2c2ciOzoJwMqwoYd36Ayx6qgnZp63b9Kn5WNf0b5K9En7i/J6KsEQlPoT/BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH8PR11MB7965.namprd11.prod.outlook.com (2603:10b6:510:25c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Mon, 9 Feb
 2026 13:06:33 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%3]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 13:06:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 9 Feb 2026 14:06:43 +0100
Message-ID: <DGAGCIVEVQDJ.3B9IXXUQY383C@intel.com>
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Mohammed Bilal
 <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <jeevan.b@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>
Subject: Re: [PATCH i-g-t v7 3/3] tests/chamelium: Rename connector_test to
 connector_subtest
X-Mailer: aerc 0.21.0
References: <20260203034546.1516152-1-mohammed.bilal@intel.com>
 <20260203034546.1516152-4-mohammed.bilal@intel.com>
 <DGAFJ1S14QEP.2ZFLOW6QKXKZR@intel.com>
In-Reply-To: <DGAFJ1S14QEP.2ZFLOW6QKXKZR@intel.com>
X-ClientProxiedBy: WA0P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::29) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH8PR11MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: df60e6f9-622c-49d2-d3d7-08de67dc0c5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzFjTllmT0hWQ3p6UWNJNVFMVFdUZTVvNENaTC82UmlOTUxXNXprSEZ0YWRY?=
 =?utf-8?B?b1cvY0tJQjh1TWJKTUhDNXl1RmxlZnQveSs4bVR3Z1ZzZFRIalJLenNhRGJZ?=
 =?utf-8?B?SSs0UHljalQwWTFxbVUweDZkK00yL0RUZTdsUklBZzF0cm5qc20vQjNmalhK?=
 =?utf-8?B?UHBqSDI5dGJFbXVyYVZra1doVUk5ZHF3NzhxcGE5VElQY3M2QTVkc01sZG1I?=
 =?utf-8?B?aVk4amg4dG1DZzBTT3VidHFrU2VCR0RuZ21DWjA4RkZZZzZab3A1bER5ckl0?=
 =?utf-8?B?ZmYzTUhId2ZwK2pabFp6WTgxcmVMN0Z4MVZJbE8ybUhSL3RhSzVhMUF1aFlP?=
 =?utf-8?B?ZWgwY2RqUFYrUkRUOVpkMmoyR2F1dnQyUU0wUjhRZFJEUUNnN1FFY29HMUI3?=
 =?utf-8?B?amxad0p6Ly9ydVdaa01xR3BaZVJxRXY4SklCVmdsN1JUTmp0QTlNcktNTHJT?=
 =?utf-8?B?djJucGJTTkZYbTNDMURsVDdlenJXRHlRWDN5QmdLVXNqL3poUkw5SFUvcm5Q?=
 =?utf-8?B?S1F2c3g5cEorU2xmMGdORmIvblRqWVo2bDFweUYzN2Ftdk8zRThXbE85aXBB?=
 =?utf-8?B?ZUVJM2c0SjNWSHNSWTFtTnpPMVFaRy92cXZDSXEwUytiY3U1Ky83dWMzRmFv?=
 =?utf-8?B?RWk1UVlzSlVmK0RaelVvRGlJVHJTQWJZckEzMWVVcHJndTlBWExkSlZUOEVz?=
 =?utf-8?B?aU9JLzd6ZzRuc08yUTZBbmFWbjFJOU80N2h4NlZjUDRsTWRQbmFSRVFTTEdT?=
 =?utf-8?B?WmxDUVRqTEMrejM2VWdxd244MFl2WFZMS3JLY1E5OThGZGRSSFMzZzVjR1N0?=
 =?utf-8?B?ZHpGYUsvY25veElKc25RNnpZWFNSR1hoRzExQ0xMZDJDemltWXRncmhUOWdO?=
 =?utf-8?B?Y0p6TU1KZS8zNWJXcjFXU09Zc0tpaTRTbnp4V2pEUmdYWW5KZDVyc0xTSTdS?=
 =?utf-8?B?RzUyL2lrRGw0NlU4ZFdUVjNzaUpnUG9td2pnWjFqemRCK3pxTEcwaFdqRUxo?=
 =?utf-8?B?UXF3dVN5Sk5kMUhDWlNqeWRoVjljOWVLUjVmV1dnZEEzdWtQL3I3UFVQVGp5?=
 =?utf-8?B?QlNhN0tvZEswdWJwUmpQd0c2VmFhWkJxYWxrWFBRTGo4SUlzVVIrMXpOSVVk?=
 =?utf-8?B?Wk9WYTB0VDFqV2tVblU2WEsvWEZhclEweDBHMUhtK2E5UWNaNk5Oc3o1bmlm?=
 =?utf-8?B?eDV6M2w0b0U1Qjl4TFJKUXcrbzlXQ09nZ29JbGJHaUQ5QXdzYzloTWNPMUdY?=
 =?utf-8?B?aGhhTGkwcUkxS1JMYjNyRzdxNGtXeGU2dHhhb2xYaGpuUFJsNnJMTFFMelNl?=
 =?utf-8?B?aG1WaUNkT2cxZXFiQldVcytSdnpJd1U3TGEwTGhqdVJxZEMrcDdqdlp0RWdu?=
 =?utf-8?B?TThQTVE2Y0wrZEVOS2JEa1UxWHRqM3lKY2I3d08wYVdIZkRkaVlqa0ZISGt0?=
 =?utf-8?B?QTVXQnpmaVdIQ2NUUldtbGRKTGpHdkM2dlhsMy9zTE1VdUR2R2xzUXA1UmR1?=
 =?utf-8?B?a1pGUW1ocHZ2enZXUjhQWDJGT0dEZXJEUmtHaDdWbFcxQ3FLVzNFUFRieWJ0?=
 =?utf-8?B?cU9vMGFkald1MUt6dnVVc200cXd6eDhIUG1PcFJRcGYvemhtdjZqNWdKWUdz?=
 =?utf-8?B?WDF5SEtCeFczRWpaeHlWRzlVU0FOS3VsU043OHBuSDlhN1AvY1d3WUVGa2h1?=
 =?utf-8?B?Qk9RQ2paOWF6UTgyMXYxZm5aRTQvQUJiWVVZNkJtS3p0VEx6UXdNblYwY2ZE?=
 =?utf-8?B?eWhDOVMxMnBkeEltenEvdUFXRzNDUjhCMHA4eE1mOG5xT1lmSjJxaDhXVlY3?=
 =?utf-8?B?T1pWczRia2RvL2I4Y1BsNlpKSUdjekhhR1I1bXFxZnR3RGRrVDJVME9vUXg0?=
 =?utf-8?B?WTZFOUFqT1E0SUlXSVFERDUxVzdnRDFreGVSVFJqNzRNQ09tTXF2TU9QTEhR?=
 =?utf-8?B?M3lmYmpISXc0Zk1iTDUyUVExSmlZMUR0U2d0cGRtYjdUNHdvYWhDemlrTmI2?=
 =?utf-8?B?TndlaWUyajFPR0phWEl5R1JKSjMxcHQydWpEeTgzTk1HTm1JV3VTNzRpbk9C?=
 =?utf-8?B?Y3BBWW5sKzNPOVhLbzl5aUhKTVdQT2pXSUFSWjNvTm1odk5rZmJQdUlWeE1N?=
 =?utf-8?Q?ROlA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEJVZVRrMjNlZ1lmaVpmSFpvVk1ranhLWnNXNWI0V0Z3QVJaOXh6Uk4xb0tG?=
 =?utf-8?B?bWw3TFpkQXVEbXVMbk0zTEVqd3pMTkt0ek1tSEgrWlpzMG5HdXhsRHpDdVFX?=
 =?utf-8?B?Tzg1ZHkzeVpiaGR0NlVsYkZxT2lXNzRMR2MxY3FHYkN3c0V0TE5lU2tOWHFv?=
 =?utf-8?B?VmRBVWM3cW5SRkxzNkVuQzBGb0R2RklmMktPSTNXalNIZG03UHg3bFdCeFho?=
 =?utf-8?B?bm5rS3NQcnZHYXJxQ0FaYngzd2ZmbmVnZEpHcEZjem5IeFFaeEJWVGQ3WWNv?=
 =?utf-8?B?UmVtaVdMZ2FRQlI3MFc4OVR5OWRQaWVzZkp5ZG5ucXdOaTlnckdpZHFHZHdH?=
 =?utf-8?B?SCtpeUM0YWJhR3hWNEtWUzYrT1VEb3hHOUhOd1RTUVJQeVBmeFZIRWkxVFZr?=
 =?utf-8?B?K0E4TWsvZDNrL0Y2L1VGUzJKYVduZ0RCNnptSmF2SWtFK0d4OVZOa1dmZVBD?=
 =?utf-8?B?VVdNWFRKM09ram1MZEo1Z0tIUG5VSStIL1NGMXo1L1dNbVVXRXJZc3NyYk5M?=
 =?utf-8?B?ZDBpR1ZZSGJlWWpBRGIyVWtBaGZlSVpqUVVlU0VmYXMrWW9Rc01selMvVi9q?=
 =?utf-8?B?eWVUUjlTa2kyWTRIbUl1WldkUVpFR3E4RnU5K3l1WWNrNTFoRFU0KzU1aHRV?=
 =?utf-8?B?b0FHQ0ZMZ3ZTNGpSOXlQN0plekpDWWJrSzF1OTFpVVFnb1RoaStObVZKdGtB?=
 =?utf-8?B?SHlHWFYzZzlIUTdJbGZubzNKSTduS050UnRlRXNyaGhEWXExblg3ZFJBT3Zp?=
 =?utf-8?B?Z2hydjFmT0pIbkh0dlBTSVorZnlQUmkvNTRaYlFLZ3M2TFMzeGF0aVlsRmJI?=
 =?utf-8?B?WmpNdjlDOC85ejBWbE8wS2xOQUl6YVZaeTlDL2tuNzFkZVcycy9LTmFKK0NB?=
 =?utf-8?B?NXhXellBQTlzM2hpaXFhY2lNaW5xendTWHFoYmZ2VzA1WTZLS081T1ljZUlK?=
 =?utf-8?B?bEtnTExEMEhjTzVFdTcyc3g3ZXVQbDNpdmkrTks1MXhkcGtYRlFCWFV2R1RJ?=
 =?utf-8?B?aWpLMTJ6WmhkZml5QmhHbEVNUWtsWVlOaFpjbjBiYS9UVlFCM2pLYndmcEpk?=
 =?utf-8?B?SWQ2c1ZnQzZVNnkvMDFkbDg5RkttUjBzc1pyQndKVlNyaTR0azdTVVRKMi9Q?=
 =?utf-8?B?NGF1M1Q4ZDloRjJIcGlnbnJWRXdMVS9PK0ppWVNuREdUSGhLYThYK0pJQUlz?=
 =?utf-8?B?NWhkMXFsK3NRb1FoalY2YlR2R0hpN0xzOFRMblhPQmxRNit5T1p3WndheWRx?=
 =?utf-8?B?cTdNVDhsRnRzY2JSc1crcmM3ckxQcWlNMEJXUFl0VDEwWnZPeDE2QVFyUGln?=
 =?utf-8?B?R1FDVFRpc2drYTJ5MVljZU5vdmhnOGRtYy9xTmJHV3gwakxialM1VjB5Vm5R?=
 =?utf-8?B?b25PMHQ0VkQxKzFKeUh5TitBSmk2bU1YVEtneXRHRjhsWWg0MFRJWEMwWVMv?=
 =?utf-8?B?MVJ1Sk9JMXhEYlJIc1pISHNCSk5xOFdYZkwyRnZydUV3RFVpcFYzNTN2NFlh?=
 =?utf-8?B?WG5Qc2pQeVZMUmhRUU45UFY2UjN6RzZ6RDlFVjhoUXBhRVE1em12ZGtCM1pC?=
 =?utf-8?B?dkRFWkNvV2tiRVR2YThNTVU1MnBnamlkM1ZuVHR4dTVkd2VSKzJ2bUFEaU1x?=
 =?utf-8?B?ejRRYzZVN3hmVTdZaVNHYXRRek1KdmxZMTZHNWFnbUorSGdYM1BlcnVQTjRi?=
 =?utf-8?B?M1N0ZHBaT25uVm1EdXVMTnN0RVVMWkdmL1B0bkR4cmpuRTlzNG4rVkpxUjhT?=
 =?utf-8?B?aWN1dWZFem0xUk5EVDJnYllpbVZTQWIwT1kweS9sZHlQK0tQZWxFWC9mTnFk?=
 =?utf-8?B?S2lYSnptTXZKTGdmcmFwUUZ5cTlBbFNHQ25kWXIwVXNKalF1ZktzNXNxeDUx?=
 =?utf-8?B?OGNtc1EwdjFFa2ZRTkFOZjJEZ3czb25zT081YXZHRGl1dHFCUzBDYUw2cmpn?=
 =?utf-8?B?d3FNdDlvemVLVHFFaHc4SStQdDhrK0lFUjFzSmJuMW1ZVEt6Sjh6TWkvcnYz?=
 =?utf-8?B?cEViMkpqQ2pVVVlsQWhvdkNSRzFHYkFTeXVtanRYWmEwbmRMTlBEMTlIR0Ez?=
 =?utf-8?B?KzZXOVhqMjhNOGFDR3M5WWlESisyTk5SNkIvTnRDSTJreG9vWkU1ZVRHZk56?=
 =?utf-8?B?SXUzQU40Y3lOYVFsNlJCK1hJTzBZRFJUeklpWTBtQ05wRUZHRU9OVzZ3bzlE?=
 =?utf-8?B?ZmUyWFkzdGFnSEFlVjZRQ2RDemJkS0pOMzBHWFFrV0EyT2FGbVhraVJsRDB2?=
 =?utf-8?B?SVZKMWlLN0FWaFRHMW5NaElzRDQxSmdMKzcrbTBUYUZudjNLSkpuRGhadXkr?=
 =?utf-8?B?aXlleGw2VUNuU1p4bzkrY0xBQlJUN2RBWkNRakJIUkhXWFYvWjREam8vUFI4?=
 =?utf-8?Q?aAYtyNDwLmEvIb4Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df60e6f9-622c-49d2-d3d7-08de67dc0c5d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 13:06:33.2729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfygO8hMf9/5UEwV/wJLfhfPgoqJNuPMUoGB6EZfvRrkPK0K+CWw6YE9HTg5zuGBQwvDAL3c7utBz7DDKIZAxGv3M2O5WVS3R69y7ISPCuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7965
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

On Mon Feb 9, 2026 at 1:28 PM CET, Sebastian Brzezinka wrote:
> Hi Mohammed,
>
> On Tue Feb 3, 2026 at 4:45 AM CET, Mohammed Bilal wrote:
>> Remove the old connector_subtest macro and rename connector_test to
>> connector_subtest everywhere, consolidating on a single macro name
>> while keeping the improved implementation that properly handles
>> connector iteration and skipping.
>>
>> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
>> ---
It's just a nit, overall patch looks good to me.
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

