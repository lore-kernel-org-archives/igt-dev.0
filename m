Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FF6D339AA
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 18:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFA410E267;
	Fri,  5 Dec 2025 18:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PfJOtjGj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F212C10E267
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 18:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764958222; x=1796494222;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kYTcH5YvXAfDmrqQYDVIcLHBSdA9PRWQqrpj43qrnaU=;
 b=PfJOtjGj0cXZQETyqI48dFK9JC24oMGw1jq83cugEvZMTDTsVyemTNZF
 rNHC0yufTEtCe42yQLu8bMpyEHYt6DN+92dnSXxwchqNUdMTShBIbkL3u
 V9lIDCf28Tyk+T94XzxWbOWSDXcgLy4SGacoHzouseQ0kJHOjrYyPEmtH
 JVQy2bKBDnrL/N+sGhA6OmF8+DUtPWLMaBShCHxPorI2+D9MYZNcTcyFb
 ZnPBWvn0uCS8oWuFOfORmCmz+VV+te7wCREiScmdmWJXfRXen5xUAa+E4
 nh+z1h+sfppl/LrzpmwsPZqD5Q20GaHuAlZ2v5nZecZl7JM1TXp5yxO4J g==;
X-CSE-ConnectionGUID: RUmcQr1uTrSFAuDoP/ey4A==
X-CSE-MsgGUID: hcg9nGjnTV2YAm+UvelJSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="89648502"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="89648502"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:10:22 -0800
X-CSE-ConnectionGUID: KffLXO90QKuGrdQanRWPXA==
X-CSE-MsgGUID: EkCjgoKdR++YIVxDkUXpNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="226005621"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:10:22 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:10:21 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 10:10:21 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:10:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5ui9oEAkWNtRUiL1ddbEg3b2GVmwAbCzwbfNYoClkYsnxkE7oOpYf9qGmQ0QWnN46UN2YZjP9KVt0gKb7AYigaS/39uySuTcS3jcjfrleuYoxv9LygR5vyFic+3AMZm4fYrHCQ6A2xGA0/q/EwwHfuOsCfZliroAfm1iA3j720XBktQ3Mwxe1Xw7eXL1uiYjD4zz0+SsnSnv4mgPuX347DvY0hlsPaErkHElChAQ576X0qd3k9d/XaKOojBYDlC/nmAr0eEDPii3uUPVDUWlvYIHGIwd2FRpHqSMH604LRGJOXh+/Bpu7Je0aAYxI78fZETBQOJuKhsHg2d+OQPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYTcH5YvXAfDmrqQYDVIcLHBSdA9PRWQqrpj43qrnaU=;
 b=BcsudId2gxw/5V9EIxYBWk4vFihOTKnGVzU4AymBK9W3EzL4WkP5oogvM1Fh5bORG+gzIcYtGML7quw2bxHq/+gLconaVjWZMJAY/jDv/Yu9PZTlDyBcJTphtYzDA0uJpzKpemMzJwrwYyVmTq9keLP5APiLynFny8hYUVYQzgia3ycnc+qEnnPqRSCseo3LILBFmdz8GLRVFzSdsW+JwSHr/qx/k7zd56k61xlChBwhua0oA40rGfK8uW+vtvSkKt05w4+5ZeY25EAT5WcmpLds4S+JYiu1H4yIAQZb6NtzbXmrSu85QOzAO5/WnxoYy3Ylm55IcduDi5tRkkr4tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA4PR11MB9083.namprd11.prod.outlook.com (2603:10b6:208:569::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 18:10:19 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 18:10:19 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 07/19] tests/intel/xe_exec_multi_queue: Add multiple
 placement test
Thread-Topic: [PATCH v2 07/19] tests/intel/xe_exec_multi_queue: Add multiple
 placement test
Thread-Index: AQHcWpsEL3MoSFXVTEmvh6k4EvpG/bUTb50A
Date: Fri, 5 Dec 2025 18:10:19 +0000
Message-ID: <b746a524e14034ea2ae32ae41b7039e9043158c6.camel@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-28-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-28-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA4PR11MB9083:EE_
x-ms-office365-filtering-correlation-id: ddbc651d-6012-42ef-94e2-08de34298cb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RFFkRFNMeWh3aEhGTFFpcDRBUWw4V1l3YmtSOVhZQlc1ME1OOStxbmNUekhN?=
 =?utf-8?B?R0I3RWhXTjVxeXRETW44clBFeTdUM1NRSXRpY3VReFhIS1k1bHU0dUNQZ3c2?=
 =?utf-8?B?QTI4NFlVU3luUGNaUXB5MkpoWkN5VzhPeXNML0J6d25QNUZNVVV5YjR6aGdO?=
 =?utf-8?B?TTFuc0FWTHBYaHhzSHhqWjg5L3hjU2Q2RWRUeEowMEZmdXhvTEY5U1EvY2VQ?=
 =?utf-8?B?WVo0WFM3c2FlUmxxa2hOeHFsSzloKzNDK3JCdHE2UzdvNnpaRnRFd25LeGJR?=
 =?utf-8?B?TUxTSnJVS1VCd3lFdUY2UEhmdDR3TG1sQ0RraVFBVzFhV3ArY09zNzBYN1BS?=
 =?utf-8?B?OFkrUkJwSmo1WC9McnMrcDBOUFlCS1EzVm5XV2x3MStXVWszaFp5Zzl1YVVv?=
 =?utf-8?B?WFViMXNVMUUvaFlQZU1Eamp3T3JLc2xKekY3OStaSnhKc1hNUEIwMDlOMGJM?=
 =?utf-8?B?bGlCNXI5d0dtY1ZWc24wQXBWbGh6SFByWFV1TUdtRUlLbGVzdlB0WkJXYkly?=
 =?utf-8?B?YVg0NWtvQ0Z2dDM0NmtGWUlwbnpKZGRvZG4ycEVHbDY5Z3lzSmJoNFRMNEww?=
 =?utf-8?B?QkFuYkROWlcvUCtLSWptaHJtaElCbU5lcmMxbmVUb2hweDVmMmNBUm9iYVRz?=
 =?utf-8?B?d0I3YnExd0psbk8vSkNYVjVNaTVWNDNNOFlaSVJjL2doS1Nld1N2SnVEbzNI?=
 =?utf-8?B?elRRN2tZenFZb0ZSUUx3Q2FXRVdONXFaZEc3MndLdVBKS05ab1hySExkam84?=
 =?utf-8?B?eE9QdzB6aHdDRHJzbERKN1BQYWRSY1h6MlYvc0FVU3J5WTFra2JsTGhvdUda?=
 =?utf-8?B?czNFT0RQTFRsbW5VU0gwNDg3Z1V6MUZWUzBrcStEUGJtZGREbDNNQ3I0b0Nz?=
 =?utf-8?B?NHhNaTJEeDB3aE02V3FKb2tFRklCYzk5aGlZeTA5cFBrL0dRMG5VZFlKd2pF?=
 =?utf-8?B?TGVJYmZvM005TnEyOXcyYyszZHdEaTROVmNXSVZ2eGN4b2tLTkpQWGJNY0Yy?=
 =?utf-8?B?aTNsMzhMMWsyVDBRZi8xVjlyVEMrak9CZ3BGWjJweVFPclRWdXZ6UTR0bVky?=
 =?utf-8?B?QU5ydER1NXM5K1Azc3EycnFWVndsaG9VVHdXdWUyNm1YaVFaWkNreENXdDlT?=
 =?utf-8?B?L2d3ZHVMcHFMT3hkS1JST0pUdnFWak94NWNEa1c3ZzVoUE1NSU9WLytEMHhm?=
 =?utf-8?B?emtuWnFOMEROVXJTaUxtY21hbHdFbU1pUS9uQWtuWEhqbjJvYjhaOFI5eHFQ?=
 =?utf-8?B?N3BJc2ErQXZjdVYrbERNd3d4YkhEdTFFc1hUYkRoU003YnRIR1ZYK2ZvTVNn?=
 =?utf-8?B?T0xaMGpXajZuNExjOEI1alcxVnJmd3BCZjBWRGZVaUE3bkE0T1BGVkw5dTcw?=
 =?utf-8?B?N0xMOG40WkhvQ1FrYnliWE1PTDgvU2ROWENobEx1bmFEbjQ3TnA4RWhZcWhI?=
 =?utf-8?B?b3dOL3FqWFRzV0E0d3NaUnFMSUNEZ3VwZU1tZnhqZ1cxOXU0Smhkam1sWHEy?=
 =?utf-8?B?NUcwbzlxNm1QQzduYWhKL0E3UTl2eVZ4MGVNK0RrcW9LaFpyQ2gwSWNWdTYz?=
 =?utf-8?B?YWw1THY5SVcxZllRZmxRM29jMSsxQ1FBSjZZQlREWnc0R3hxYzZYWStOcG0r?=
 =?utf-8?B?bzAvK0xFaDZIWWhUMU9LMHpKWkFDRWsxc21sa1FxTkI2T0dBekxTc0pOWUtL?=
 =?utf-8?B?dkUxKzU0dUJPSjBtdWdwTGE2MUpOTFg1b3psVTdFcDJzTzJGVmpjemN4ZVd0?=
 =?utf-8?B?b3Y0MGVneEErSk5neFpKazAwV0M4TzJlUEJHU0x4WXhuQmgyZDQ5RDI4a0pu?=
 =?utf-8?B?NlZNT2NFeHJnaTdac2J3L0VJb3FKK3RFc2R6andVcXlFNHE3d0VFUUpkcEIy?=
 =?utf-8?B?SEcxdVRRelJMbXgxdzArUmI5TUJ5S0tUVFhUS0V5UjJKQ0kweFFVTm9NNWZm?=
 =?utf-8?B?UVEwNGMzTXpqTHY0UHUvNEFLNS95YkJGSk5PaGJNamExTjlLcmJvZjh6Z1hP?=
 =?utf-8?B?UDZGeHk2ZlpEakNzYkp2TEx2eWdxNnpXQmhOQTAvMkZyTjhPKytaVTBmTFNO?=
 =?utf-8?Q?6bNbBc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUR4a2xaSDI1YWVYaE5kaVB2OW4vZ2JDNUJjd01TKzgwL0VUMml3V3hkZnlP?=
 =?utf-8?B?b3dBcGwrMkwwZURadWdoSGtGOVVYMnhwRzlYYUM1N1kyaW4yRHJYTEkyVjEx?=
 =?utf-8?B?T2lieHZDc1NQS3U5d3R2Tm1yck41dW13QTVrOFhUZFNmd1NiS3RVVkFiN2Iz?=
 =?utf-8?B?VUptanRLNUJBTUc3M1ZuU1l3YW0yamZyUVVsc0lpMHkwQUttQk9vNVBJSk83?=
 =?utf-8?B?bnJWSWdsUmRqOFk0cS9CQW5zQzhBeUxjV29ES2JxMmNEbUY3VVZZT1AvcmtF?=
 =?utf-8?B?ZGZ2MDZqeEVhQWFnRk9JdW9Jb3hDMloyZU9QN284RG5GLzBJcFh4ZXdBc1ow?=
 =?utf-8?B?M2dLa3R5dUNxQVM1OEZyVmVmUHZvanJSVUFxOXNzZkhxR24zYm9qelMrTk1V?=
 =?utf-8?B?MUxWL2pjU3pkSWQ4cjNzemFmQWZvVW9lN3dSb0RXbjRUdXl0NjJFMWxpclBI?=
 =?utf-8?B?NWxaa3Ixcy9hZHVNakJwOVlGVTNVSGVQcTZqRSs2NEdEMi9HZkFXdlB2a3lU?=
 =?utf-8?B?S0N3bUdmTmcwSWZQV3NPMXQzb1VjdVZiMTZ4RHMveFpuSjNuQ1ExcEJ1QWU1?=
 =?utf-8?B?TTdQTHAwczJVU2FiM3ZqblplcG1BVXV4cnVVTWltZkdocjh6czUrWTk0bVhk?=
 =?utf-8?B?cTZRYTB5cTNmNkNqSkgzaXl3cWVpeS9vemJrcWpyL0RDVHJmZyt3ODdBZzly?=
 =?utf-8?B?WENUSlFBOXljQlg1eTRvaXRFbnNhM1BwNjB6WkFkNjhWOStYVGhQVHVjRWhE?=
 =?utf-8?B?V0tQVlEzNkhMTEoreVRXVDczdzlTYjNzcXBsWnBnSU05d21IQ2R0aWJnK093?=
 =?utf-8?B?SlozY2NsYlV1KzhUa2ZKbnhKd1JsNWZZS1phZXJMWFM5M3hsazdqYW1WalFQ?=
 =?utf-8?B?b3dHVTFRdElrKzdzMCtrMXlUQ0ZVTWY3UHI4WWpDbUNFdkRyWkRFa0Y3Uk5u?=
 =?utf-8?B?ekl2T0dGYmpUMVJlMGpLcmx6MXpLM2dTNGduT0xvdmVBRjNZVXN0WUVFOVZV?=
 =?utf-8?B?Zmp2UUJVZ2twTmRHNlVKcDJ2ODhMLzRnRzVHalkwRzFGN3NlcWtkeGRJeXRO?=
 =?utf-8?B?U3V5NDBSdjlNdWRmQVN1NjhSVHFBdUJqU3l2N28zZFVmZnVjWm1PUHJQTnZl?=
 =?utf-8?B?YXo0dHBCbExLUmZxelZ4WHRjQ0Vkajc1UU1OSlFlY2Y3dmxUU3N4Qyt0RmQr?=
 =?utf-8?B?NmRnZUNSQkRLYzhCNXF3ZC8wSlFrYzJpdXIxRVBZUnQ0Z2xxRmtmeVNDR01Y?=
 =?utf-8?B?QkpyRzR0MzZ4dHg2Y2Z6QVdBMmU4R0dpRjhydW9Zdk1XMU80N3N3RHJLbG9Z?=
 =?utf-8?B?OTdqNkY3b1JNdUlBTThMZW1Vd1V2dGpYb1E2d0Z4YWtSQVZmU2NMOHRzbEtq?=
 =?utf-8?B?KzBVQ0NrUWRUQmc1T20xQ3dXWll0RXZSM3JzY2F0cGhqbWplajJwT1hFbzJY?=
 =?utf-8?B?M1huclUwTTdVdTVvYW9jbGRiUnJVUGxOeFRIWTlUd01UTHVKc01Iem40Vkxz?=
 =?utf-8?B?QlVBcXcrN1BHZ0ZlS1k1MFlocHdIZ1JmdXNTZzAxS3R5OGxmd0lzY1RBL1R5?=
 =?utf-8?B?ZXNYTDRnZXdvaTdwbDVrNktGNmI3T2xjaFIrTTJOUldsd0FGYVo1SWVXc3NN?=
 =?utf-8?B?RUQ5OG5sMkovRlpZcWVyb0VmRk1mLzlTVmVyaWhOTkZtUTBjYmdETVhla2dN?=
 =?utf-8?B?ZkRWWktpUnlVbENkcUdQZGxDN2NXcUFwRHB2TllkTitpTUhML1l3S3piQ2hj?=
 =?utf-8?B?SDFtMGxzVnpVb0RlRFErWlZXbzRpZ3ZEYzBuMUFJY1UwZ0pMUFNHem1QbTBl?=
 =?utf-8?B?ZC92eUNwdnB2UWwwQ1czZUxHT2tCaElhOERlbENNb1V0Q1FOc2RTY3RPSW83?=
 =?utf-8?B?eTg2YkhObFpJN3d0YjdNMDdOYlQ4a2ZEWUxYUXRxU09SOVFldnpIRkZlSWc1?=
 =?utf-8?B?cVNIRG85RlUzS011Ull0RkVYY2M1T1RxTVFtSUh1YnByenEzaDgxbCtTUXky?=
 =?utf-8?B?UWEwWmNYMFJEK2VMa3ZHVjlPMVg2WGtwRTRNQXJpNXBzWTkwZGp2emZTYTBm?=
 =?utf-8?B?N2ExZHNIT3dPRGdyQkVKMUVGcW1qTmZSVm1lL1JUazNTdWlxOS9UcDh3VU9z?=
 =?utf-8?B?RzBuMndMODdGM1JEQjBBT0VlcUkzeDMyR0tGc1hkWnhyRjBzelJSRzBadnZj?=
 =?utf-8?B?V0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE09201ABADF764B9FCF9F074A69E2DC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbc651d-6012-42ef-94e2-08de34298cb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 18:10:19.1762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VFgP4uxQ8nW9mUQSN/r34eO1vFm/9/jPKVqqklFh+RUH4clwEnPFeJWuB15ZVXR09XlMn4zR5SX2LrjICe7TqDDccl9K4Io1/cqikRXDZj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9083
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

T24gVGh1LCAyMDI1LTExLTIwIGF0IDE5OjU3IC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IFZhbGlkYXRlIHVzaW5nIHZpcnR1YWwgZXhlYyBxdWV1ZXMgd2l0aCBtdWx0
aXBsZSBwbGFjZW1lbnRzLgo+IAo+IHYyOiBSdW4gdGVzdCBldmVuIHdpdGggc2luZ2xlIGVuZ2lu
ZSBpbnN0YW5jZQo+IAo+IFNpZ25lZC1vZmYtYnk6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEK
PiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogU3R1
YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4KCj4gLS0tCj4gwqB0ZXN0cy9p
bnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMKPiBiL3Rlc3RzL2ludGVsL3hlX2V4
ZWNfbXVsdGlfcXVldWUuYwo+IGluZGV4IGRmNjA4MzVkNi4uZmRhYWY3OGM0IDEwMDY0NAo+IC0t
LSBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYwo+ICsrKyBiL3Rlc3RzL2ludGVs
L3hlX2V4ZWNfbXVsdGlfcXVldWUuYwo+IEBAIC0zODMsNiArMzgzLDI5IEBAIHRlc3RfZXhlYyhp
bnQgZmQsIHN0cnVjdAo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwgaW50IG51
bV9wbGFjZW1lbnQsCj4gwqDCoMKgwqDCoMKgwqDCoHRlc3RfbGVnYWN5X21vZGUoZmQsIGVjaSwg
bnVtX3BsYWNlbWVudCwgbl9leGVjX3F1ZXVlcywKPiBuX2V4ZWNzLCBmbGFncyk7Cj4gwqB9Cj4g
wqAKPiArLyoqCj4gKyAqIFNVQlRFU1Q6IHZpcnR1YWwKPiArICogRGVzY3JpcHRpb246IFZhbGlk
YXRlIHZpcnR1YWwgcXVldWVzIHdpdGggbXVsdGlwbGUgcGxhY2VtZW50cwo+ICsgKiBUZXN0IGNh
dGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QKPiArICovCj4gK3N0YXRpYyB2b2lkCj4gK3Rlc3Rf
ZXhlY192aXJ0dWFsKGludCBmZCwgaW50IGd0LCBpbnQgY2xhc3MpCj4gK3sKPiArwqDCoMKgwqDC
oMKgwqBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSBlY2lbTUFYX0lOU1RBTkNF
XTsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAq
aHdlOwo+ICvCoMKgwqDCoMKgwqDCoGludCBuID0gMDsKPiArCj4gK8KgwqDCoMKgwqDCoMKgeGVf
Zm9yX2VhY2hfZW5naW5lKGZkLCBod2UpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaWYgKGh3ZS0+ZW5naW5lX2NsYXNzICE9IGNsYXNzIHx8IGh3ZS0+Z3RfaWQgIT0gZ3QpCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb250aW51ZTsK
PiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVjaVtuKytdID0gKmh3ZTsKPiAr
wqDCoMKgwqDCoMKgwqB9Cj4gK8KgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydChuKTsKPiArCj4gK8Kg
wqDCoMKgwqDCoMKgdGVzdF9leGVjKGZkLCBlY2ksIG4sIG4sIG4sIDApOwo+ICt9Cj4gKwo+IMKg
aWd0X21haW4KPiDCoHsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xh
c3NfaW5zdGFuY2UgKmh3ZTsKPiBAQCAtNDA4LDYgKzQzMSwxMSBAQCBpZ3RfbWFpbgo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2Zvcl9lYWNoX211
bHRpX3F1ZXVlX2VuZ2luZV9jbGFzcyhjbGFzcykKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdGVzdF9zYW5pdHkoZmQsIGd0
LCBjbGFzcyk7Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqBpZ3Rfc3VidGVzdF9mKCJ2aXJ0dWFsIikK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZm9yX2VhY2hfZ3QoZmQsIGd0KQo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZm9yX2Vh
Y2hfbXVsdGlfcXVldWVfZW5naW5lX2NsYXNzKGNsYXNzKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRlc3RfZXhlY192aXJ0
dWFsKGZkLCBndCwgY2xhc3MpOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgZm9yIChjb25zdCBzdHJ1
Y3Qgc2VjdGlvbiAqcyA9IHNlY3Rpb25zOyBzLT5uYW1lOyBzKyspIHsKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlndF9zdWJ0ZXN0X2YoIm9uZS1xdWV1ZS0lcyIsIHMtPm5hbWUp
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZm9y
X2VhY2hfbXVsdGlfcXVldWVfZW5naW5lKGZkLCBod2UpCgo=
