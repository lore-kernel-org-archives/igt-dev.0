Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E774C3ABAC
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 13:05:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3752F10E68C;
	Tue,  6 May 2025 13:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1rl7grU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822BF10E68C
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 13:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746536744; x=1778072744;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ADO/OJsFAEiB2vNWl2Amegy5w0xWNAYBl70K+HDIw4c=;
 b=U1rl7grU4cemQ/zbOAAflMamqwmY90HcYMjZ7MhIfsKNTpJ5oNNHy1nJ
 k2pxLdwFMAj2O9QTR7a1L3YU8uwQ5VoZQuxhx0NTZ5iwE8jvVjXabq8R0
 Vc27wEeSUv7OzEAcO1EJAjrsGK8/n45xqpCBm/3ENOfNdIs0usWxACZd5
 j9qYWTHErHdIQA7Ygf0TJ3KX75k0uKImic3cj3h/htkGlPByfQYGB5hs9
 Vl9NHnEvmUX8JJ0afFKFEfQK68iFNyd8HJXbTsetmszFQi6KYrM/tRAu9
 ABddgQvfGxSX+DYJfOMoBHeV/KopM8JrUbZHIgEAA/0xIvyGoDpxoOd9k w==;
X-CSE-ConnectionGUID: 5o9y4WxNRJmOMDLjYRK2mg==
X-CSE-MsgGUID: k9ME7u9YShahdlpBtRM0Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="65612186"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="65612186"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:05:44 -0700
X-CSE-ConnectionGUID: kBBqPtdzR46tqSQ3jzWlkg==
X-CSE-MsgGUID: kqBI+4dFThGLsbPgx5G89w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="139676414"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:05:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 06:05:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 06:05:43 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 06:05:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJ68QGFs4f0eVvbq31xxutu4lDnHM92y2cUhiUNB+lF2G7w7LCxIuzIhnBji5ruusLOjj+IZK56qs59uRORmYfdlK3rEyedqk3ZQgahg6OJig1s1KVzf3MfRsn/Z6CvVb2/A4v4Jf1Ptwzkv9NIORs3wqMslM1BtFLfSMXtUxXcxy4i8LrcUZkxCo6LyLu3x1hIxPhB22pNMjwH0lFDxkpatq4U9ZWmXwnYdWg5U+qLfypVDbsPeMK0UkB1YeH8ZGrT1vySi+zrcDuNOa8PLjJXEkwzSeN8KDuvaFxruF+Z+p4QZdqGAOI8ENQMUYA4MGqFMbS5s/G7BdCEm3DYHxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcdxMPLZXdXs/3GoInNTkPTtIW9cpOxH11+C20SeGl8=;
 b=Ilb9sTrOdJyC2R4pakn8RQHmq1YKYQsDAcsGUBeQWT1YuwF5nrwTevlrmN4vh3tMA5tT/IDLNAsQVbbhSbmr4M7LRXzlprqkPodbhIteAcBLoEnsJDJCC9GdXBgcQVtVneJwOSKFlfvXFmmKb7raMxSkuKb6ss7xClmb+2U1dofCKx7BR6NEbNohpUDlp6bH3DyKWB8Uph98YNIvNc8KN2LHIqGgOpQbTRyhks9C6sd/K0LduxPa+TtzyCVHjBjRJlbQ+tLIUM93DbtEqnIrDJ0/4Wz5Zo03g/NYRFmdJZq4uidVo4M+W/sJe0zxn9QaRs5fW04bip/ymJEBYnRDuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MW5PR11MB5930.namprd11.prod.outlook.com (2603:10b6:303:1a1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 13:05:34 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 13:05:34 +0000
Date: Tue, 6 May 2025 13:05:23 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>,
 <zbigniew.kempczynski@intel.com>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v10 1/5] lib/igt_device_scan: Add support for the
 device filter
Message-ID: <rp7irnoimkt36g7uey33gd5mv27zon3kjkiq2f56wwgtn2hod5@qoghw6wmmzbd>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250430070824.3012927-1-soham.purkait@intel.com>
 <20250430070824.3012927-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250430070824.3012927-2-soham.purkait@intel.com>
X-ClientProxiedBy: VE1PR03CA0012.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::24) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MW5PR11MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: af4143db-2e83-4005-4898-08dd8c9eafb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0l6dE9TbXc4Mkx1enZKd05TWEJ5NTRnbnp4S1J3dlBlMXYxYTM4T0JocnZx?=
 =?utf-8?B?clkwM2tmWHVlUjRIa2NxYjR4Um1iVzlPTDl2VE5tcXBwM05WQXlXbkd6cGVR?=
 =?utf-8?B?YnM0QW04dUtWWmVqN0IvYU1wQUZZbWVhY3hPOTVhTi9Hc2tGc2IvOFJyUTRB?=
 =?utf-8?B?NXpvdGtMdUdsRTRJN3lkQmpWUEt6cjM5MU9yc3doS2FodjE0U2tFNW1kZlAw?=
 =?utf-8?B?T3FET2RBMHoyTEg3azhweHc1Y01Od1BoUHJodHF3eTJaSDhRcWJHaW1Xc0pS?=
 =?utf-8?B?ZXpnMkp1NkZZY2xrNXFVUmlCb29EQm40Nlg3ZkJrd1dYeHRKSE45NWY4RWcz?=
 =?utf-8?B?V1IzWGFwWFUyNHducVRUMFdWbjVQL0tpRExldUZUTDQvY2dPdVZETHJZK2k1?=
 =?utf-8?B?cnl1S2hjUFhLdTk0ZUFmeVNKUzdkWVdvcWZYWk9Ncmx3bmxDTHVmUzViMmtz?=
 =?utf-8?B?WW1kMHM0V0ZQTmZIU0tPZ0lFWEk0dnRtQ2xwQjh6Q090empOYXh4T3dtZmMy?=
 =?utf-8?B?bXU3OGJrVGtpbk1ITXlLc21pWS9WQ2Y0WGFsWUxVRTQweGlCUyt5SFQ4NDV6?=
 =?utf-8?B?Wm8yMTJmcEgrVFZQQlJBN0hhUUZtZEQ4QW1nWVNtQUNkbnVhcUx6aHIwNVhz?=
 =?utf-8?B?UkpqdUJvb2RDVHdSb2RnZDlzd3FDVzdBL1ZLc09pZkF2S3I1V1VQSjExa01L?=
 =?utf-8?B?Mm1SNWtKREpuaTN2ak9nRGVZUU9jeDlMdXZnNHVmdjEveStSRXJldEtwK3Ur?=
 =?utf-8?B?Y2xIVGxDUFIwSG11QmpLT2V1M0lCcDZnOGluQythTlJ0QnVRd2NEUkJIR1JJ?=
 =?utf-8?B?c1Q2YW9RTFVvQnl2TlRlNXh2VzBycHBDWDdJT2I3WTlhSlV1d3Bqak1VUlRM?=
 =?utf-8?B?TnZoSFZjWTBHdk5KcDhkWnUvY2RlMU94MmkwVUg5QjRoZ1BWUXdHYkRZV1li?=
 =?utf-8?B?Wjk5aEhyT1g4WlRhZ0pNK3Y1bExtandveG41dWkycmxMeWJUUUZ6UVRpc0VD?=
 =?utf-8?B?bVFXL21WVEx3V3RWWGk0aHpKZndmUDVJYzM4b21KQXpXekw4YndCZFpudlBE?=
 =?utf-8?B?NjljYVJhYmd2L2xDeFYrRks2QUFHN3VxdFlaMnV3Y1FEZ2VuZ3I5bXk0cXJ2?=
 =?utf-8?B?ekpOcUJUTzJ1MzdWQldmRUpRQlVKRHVaVmswcGxyQzdjMUZzVnd1cnNETlI3?=
 =?utf-8?B?TjVSdFVRTHZKaWxxVmtpOVhjRXJkeEx1VzdSeGQzRjk3QXJ0akE1WGZBTmlh?=
 =?utf-8?B?TjhsZ0kxb2Ftais5VzBYeFJQQlArbkdEZ2ltZ2xpMmRjdzB4YXFKenM5ekUx?=
 =?utf-8?B?UnV2T2dyN3hMZ3F0a3lUazNqZHp0QWdWb2tldWdHWkNvMVpvQXM0T1BMQms3?=
 =?utf-8?B?VUlEcU1HMnVJeDNJNXJKQ2dUeC9aSldMQXRORXFNT0N3dFJDY0hLWFVmb3V2?=
 =?utf-8?B?eFpKODhGbFJGL1lTNmd5blJyUno4SDExcVpETFBYeWFscDNZa3pRRW5OOVZp?=
 =?utf-8?B?Yms5UE8vZVQ4ZTgxY0twV2U3T3VjLytZS1lwR3p3WUwvWlhKS3BCczNEak1J?=
 =?utf-8?B?cFVtNVQ2YllZbk9IU2FZSC9IZXZHQWtJZHU2SG0yOXJmQTc2RHJwcWNic3lG?=
 =?utf-8?B?KzFsOXNhQ2ZJamV2VXI3S3FpeFF4N1VzTzNta2hJVDg4SkhBMldBeUs0dm13?=
 =?utf-8?B?cmhxNnROdWZDMTFrSm43eVNESTNOeG50dWU1S1NmQUdIWG9Ca0l6TUtUNjBP?=
 =?utf-8?B?ZkUrMHRWL0s5NmM4Um9TY1J5MTNKZ2JnM1NMVXpWc0ZsOVdqNG9Ebi9GWG5B?=
 =?utf-8?B?ZVpGcGZ5TTVQSFBaL2gzMHBBOWllUlNydnB1V0tvM3NaaklyVjBaakpmK0po?=
 =?utf-8?B?QlYzU3FnY3ZsUWg2aVZVNWo3MFRGaURTOUJTbS8xTjc5N1JWRW0wS3JBVzFU?=
 =?utf-8?Q?63fulULvj+I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGMrNFVlaUM4c2xUSUhQeTkwY0VQMFRxVTIxazJoWDFnYlNJenpiamhLem1B?=
 =?utf-8?B?ZmRWVDZ1MlpjNDBSeDB3cTlab1J5dm51WXNmZ2x2MXo1a2loYnhSNzE2UXZk?=
 =?utf-8?B?dE8xZ1R6dlBmY2w3dmtrNWtQaWVDM3A1bzVHUjdQdEo2QzZPcFNoaUZzQ1l4?=
 =?utf-8?B?QWZSeXB6RkM0a3praEhlY1V4cnkrdnIvSEFOSWVncGV6UG9JMllVMUlFdVBK?=
 =?utf-8?B?dmxsaXJWb1NmN2J3NmN4NkNnckJlQWhqWldmOEVxNzVkdzZuOFFrZzV0SzQw?=
 =?utf-8?B?R0tNNEVyLzJhWXY5V3Q5Z0kxZ0Izd0FjVFJvSXJPZFhUeTd6RGFzbWIyR2xO?=
 =?utf-8?B?R1pnT1g0OVVWeVhyc1BrYXJsMmRHQjZnVHJKSnRzUC9xbkxsN0wvMnBKaFlG?=
 =?utf-8?B?clJWWEdKeW8xNk9MRjJMSFZYdmdFdm1pODBpRENZam1abTRlMkhROWY1M3Vk?=
 =?utf-8?B?anUzREVqbVdRYzhieVpZN3RaSEk0blhESGlxUzVnU2RURWZNQTVxOG16L3po?=
 =?utf-8?B?Z0Jram15R2pjcG0ybG5iSVQ1dEZPNVZabkNaU0k5bENQdFJ0bDFLZklRRDdp?=
 =?utf-8?B?STFaVjZzUktIcW9aY01VdlJPVVozMXFPbDdVTXZkSk5jcStpaFFMR25VWXRa?=
 =?utf-8?B?cEw5VkUrdHBsL3R3alBjbUdIams5ZjdFWG9xc0JYZzVBRWprVTdNL1dwMU8w?=
 =?utf-8?B?akpSQVZPcUNhMEJxdVlTdXRaY3JVUVpJMytNSFFMVXFkMi93cE1yazFQMEpV?=
 =?utf-8?B?L2NwZ0RlRDJlWWVLLzZaemJTMmhiQnhGYkJRNGdLcTFJbnN5N3c4NlZhZENO?=
 =?utf-8?B?OVRTc1JKODNqNERIbEg1eU92U3R2RlJidnlvMm9IR1RjTzIwUlcrZjNrS0ZM?=
 =?utf-8?B?Q1FwUUpDOWpOOGFWM3RMaTh0aG03RUFSOG5jWE9zQWd6Zi9zU1k4d2tvVDBR?=
 =?utf-8?B?eVRmWkJwQ0FuRjYxMHFOWDltRGhRZjhwVUFCS3dYTDVNSTIxNmZuaEZKb3hE?=
 =?utf-8?B?NkIyMTJnWjZ0a2FRSm1ndnpTU2ExWS9nRWhTRTdyNitpcW51a1paM2hFZHVh?=
 =?utf-8?B?UDhBU1RJaEwxRmNtSG9GTjdUWmlmclFZUlZZdVA2VTBSOVYrUUhCaUtpZjBL?=
 =?utf-8?B?cEEyM21qajJvSXh2T0JteGdQOUFVSFltR1hraVZlYnRYMGVjRHdIOWlXenAz?=
 =?utf-8?B?NHJqVnZSdCtBaEFxUmY1cEFRMm4zM0Q1VlltNForYVYzTlNxMm9wY2RUWFNk?=
 =?utf-8?B?Q05PN21yTlpDTno1WEZlRGNmTjdZaTM5eG95RXA3eXZqTmNYNFJtWXJNcVFh?=
 =?utf-8?B?RHRBaEJJdHZLZjFEbGxrcWk5NDBVUkVzVUxCdE1QaVV0eDVlUEZOTWdmYXhE?=
 =?utf-8?B?ZGd6cTg2S1llUnlVdmZ0VWM2TW9vWGVzdlNyMkdQRHJkRlVNdWVFRXdGM1l3?=
 =?utf-8?B?UFk1dklMNGJsYXUwVzVKWmw0cTNabTZyV216RUZOMC9KVlVqWks4Ymcxdmwr?=
 =?utf-8?B?UXIwS3Brd1VXRjNRWWxMRzl5N2VDOVFGUTV1S28zMGZCYlRicGJrZGJlZUxi?=
 =?utf-8?B?Zko4VGVRcENxV0tpbFZQQ0draGw2VElqeHNyVCtMSDkvOVZnNWxNaEYwM3Y1?=
 =?utf-8?B?YzgvTjBHZEJwMWp6TW1KTHBDVnZXdHV4cGdIK01oRk81aGVOKzc0OUtMQjV2?=
 =?utf-8?B?ZVVhRHZ1R0wzdklOU3B4bVVIWnR1S2pmbzJZZDg4eDlrYUZ5eE5JQkFobUdl?=
 =?utf-8?B?ZHFQb1VUcUVPL3pvYWdPTGNCN1VXZW55V250Wk03bzNNVGZQcDFhUUJlMXZB?=
 =?utf-8?B?dFZLUlRCOWdUeDRObDQwRm4vamt4R0YwS2JYMlRkZXVISnBEemNBMUh1ZGN6?=
 =?utf-8?B?Z3lXa1Q1NCt6ZlA1K2xzR0R4dHc0T2dzWlRCaTFQNGFDb3JqcTdIcFBDMzVQ?=
 =?utf-8?B?b0duTHRFdklsNEY2Zitna2txdXE4ZytZckVFVjlsbGhOcVJYVjhmWWExUHY4?=
 =?utf-8?B?emRMblprejJmQmc3VERXbzkzU3VBMTF3S2JqNHdQTGVVRklxRng5L1BQaHRp?=
 =?utf-8?B?dWlMd0hrQzBYYktQcjlad2xHcUFhWm5IR212anhITU5IZzl5UzR4MmVwWHFC?=
 =?utf-8?B?RVVqU1RCcFQxZ01PZFk2UnY3ajAzbGlpYjBlcHEvTnZQOC9tdG02aTUvbHgr?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af4143db-2e83-4005-4898-08dd8c9eafb3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 13:05:34.7652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWWVAIQ1u63QJyjhgJQKvXfafLE/XTe83jMDPdw0ep0iR3VbeY+IqxKd7/CbNxcUQ2SKtaQHDd6o0EjWmWAEt+8u3pvC2QJGQrh62mB8imc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5930
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

Hi Soham,

[...]

> +	if (filter->data.card) {
> +		char crdop[5] = {0};
> +
> +		if (sscanf(filter->data.card, "%d", &card) == 1) {
> +			if (card < 0)
> +				return &igt_devs.filtered;
> +		} else {
> +			card = 0;
> +			if (sscanf(filter->data.card, "%4s", crdop) == 1) {
> +				if (!strcmp(crdop, "all"))
> +					allcards = true;
> +				else
> +					return &igt_devs.filtered;
> +			} else {
> +				return &igt_devs.filtered;
> +			}
> +		}
> +	} else {
> +		card = 0;
> +	}

I rearranged the code a bit to make the i look a bit more
concise:

if (filter->data.card) {
        char crdop[5] = {0};

	if (sscanf(filter->data.card, "%d", &card) != 1) {
		card = 0;
                if (sscanf(filter->data.card, "%4s", crdop) != 1)
			return &igt_devs.filtered;

		if (strcmp(crdop, "all") != 0)
			return &igt_devs.filtered;

		allcards = true;
        }
}

if (card < 0)
        return &igt_devs.filtered;

I believe it is logically equivalent. I ran a bit of testing via
lsgpu tool and did not notice any changes from your version.
I thought that we could reduce the number of "else" blocks and
decrease indentation a little bit. Let me know what you think
and if you could include this part in your patch (or if you find
that this suggestion is bogus and does not make sense ;) ).

> +
> +	igt_list_for_each_entry(dev, &igt_devs.all, link) {
> +		/* Skip if 'driver' doesn't match */
> +		if (filter->data.driver && !strequal(filter->data.driver, dev->driver))
> +			continue;
> +
> +		/* Skip if 'device' doesn't match */
> +		if (filter->data.device && !is_device_matched(dev, filter->data.device))
> +			continue;
> +
> +		if (filter->data.subsystem && strcmp(filter->data.subsystem, "all")) {

I see that you added a neat comment to most checks around here,
except this subsystem filter. Do you think you could add
"/* Skip if 'subsystem' doesn't match */" comment here?
Or, if you deem that suggestion excessive, please drop the
comments from the checks above - these ifs are quite
self-explanatory.
> +			if (strcmp(filter->data.subsystem, get_prop_subsystem(dev)))
> +				continue;
> +		}
> +

Best Regards,
Krzysztof

