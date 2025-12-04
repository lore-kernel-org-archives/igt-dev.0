Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D55D2A53B
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 21:12:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004DB10E1D0;
	Thu,  4 Dec 2025 21:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lWGDLYQV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE2210E1D0
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 21:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764882736; x=1796418736;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3IbDZRVnYuwTtEn201ExfpHcV2ClhAs0zs2XbVBgads=;
 b=lWGDLYQVUf5P2vPjSn3+DEJcFKIhAvC74vPqwOfb6aEKnc9MoSrch6IM
 DQxFHADzrPSDsuuF1iuoM2MFx0t/ZImunN4979TxRoK3bP9KLeCT6MX/b
 e5lkTip0ND4tTkNaoqAcbmtS/+crBkKMFC5iBWo2gu2MtK0viEc5dm0mG
 bJRUIj8rIdUZmw/4Gn/SGDbsuh+58oqmGNJ6FOj5v5WfZPCx4MqQjw4Zh
 0lRqQ80SC5C6+r6esGtfmf18fyj6Hmy9/5ahp92PT9tFoNzKbT2FpN8Ce
 2Eix2VWzp8NTxwkZlqm5Op7HFyeJX6FCyu9RKO+0UmSPZx6TUVuUx5q+f A==;
X-CSE-ConnectionGUID: SX0Xs4YITVKv1xElBhMSCw==
X-CSE-MsgGUID: 6HvWMu68S5eUkEgqXieuXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78380836"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="78380836"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:12:16 -0800
X-CSE-ConnectionGUID: 92xZJ8RwQeCuEPjCPBxuEg==
X-CSE-MsgGUID: /fZhlEv8Qlu/qKhf51HS5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="194370354"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:12:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:12:14 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 13:12:14 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:12:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8fEejiEy52eaW2qD8Gu45BPgOP53DgS1yhdttkl0kti9nV9NFHycquec2wFOvhuVOEuvRqLAx96R3gmfswWs+xypKo5lj47KcYF/vlLbuJ6ghn3lBd+9S/O0GlqUrTqRo3BNSU5t/QbnfCCLUvQb3NfJQAZGzHUeDK+biOxUV1nqUweXnEOXWTMzdOReYjEAl9Gh8v5SJSYoszjohBWSIgz8BscQo7aNGbrNiZT3ZjHpehnD3qCFZAVd6gDxXFDvGDrwiiHj6zIFS8298k8HOQAcmwdj2njtjQ/HQVatiQgRacNIcN1opD+BeIjKrDS7QoHdm7LtTU8an5R437yjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IbDZRVnYuwTtEn201ExfpHcV2ClhAs0zs2XbVBgads=;
 b=MFEkhdOSSvbt22S+IAAL4KZkC++dOhZq7EYV5x9q8uezSbVZwcc7f03v3YSF1sHffZpaiUdDcY4snArxwKqw/9WBANGwPpzfnbGlgqi1D4NB6xL6e0hUrXiT3+vwTS376QHF1f77ycVdNPHHHrFjE038R0sqDTYpSCwxJVC15XabY7wwl4qq1EM47VRCZREj02cYe3Rd9qgULYByuEY8P/8z886UzFQ7Kw3kyceP+XmGgk+RqUrsTmVjibF3ZiZL0emPeYTue5+vtKlyVhqzeOnalFS975+ft/PDh3Fp6LpYICfYb52W/0Zk1vSJip38flnl5aQjpIzG0J4DM4KXFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW3PR11MB4729.namprd11.prod.outlook.com (2603:10b6:303:5d::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.10; Thu, 4 Dec 2025 21:12:12 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 21:12:12 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 18/19] tests/intel/xe_exec_multi_queue: Keep group
 active in exec-sanity
Thread-Topic: [PATCH v2 18/19] tests/intel/xe_exec_multi_queue: Keep group
 active in exec-sanity
Thread-Index: AQHcWpr9se01aHQ/m0mD3EGGoe0j97USEBgA
Date: Thu, 4 Dec 2025 21:12:12 +0000
Message-ID: <26b2cf18f060b325af52f7f7dac460fb42f9e9d1.camel@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-39-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-39-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW3PR11MB4729:EE_
x-ms-office365-filtering-correlation-id: e8ee170b-0911-48a3-f88d-08de3379cb07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RStISlhZRlRrUWs1Q1BpaHpzSUN5MWRTSzB6T0hDMjRBSGkwMW13OWxTeTFZ?=
 =?utf-8?B?TW1zdXdEZ0FUclY0bkdRb2pJTm42QmRFUkhTMlE3S2tTMFVDdHZkRUsyRmFJ?=
 =?utf-8?B?R0t1TmZHRVAvV0xHMTZobmVud0tkLzBscVJjQjBJVzJucVk0UFc1Nk8yQ0ZH?=
 =?utf-8?B?SkNaZE9EckJqUEQ1UWtId295M2dqTFh4aWRrcUU0VTUxSmdMQ21pcWY2cWFZ?=
 =?utf-8?B?WFpHdWVPNER6cUkrejB2Q2Z1MTNPQ2MrenExUjBqdUxNS05GOVFka3VYZUJk?=
 =?utf-8?B?Qkt1UW53aHdxL0xxWFBXQUhabzBhUUJoY2JzQ1VuM0hUc29SU2l5WG1kMExR?=
 =?utf-8?B?V243UVgxOGVLYUpXY2YzWjNlUWkxVUpiSitQNWlKL2ZGcWJhRFM0WFhsZ3VN?=
 =?utf-8?B?U0dWcktBbXB0ZFNCTkNUMWVGdTNKQy9Nb1BRRE9JR0FURzQvMlRPbVhIUUpi?=
 =?utf-8?B?MFROQlZBK3ErZzNrUDh3RFNiV3pUbzhNZFgzZy81N04wNHROdkF3SGZrdyt5?=
 =?utf-8?B?ZGRpa2ZhdFNZbFpzNUZ0dnBubXJHakpaMm5Nc1lFSkhqQVdXeUdyYm1tcVY1?=
 =?utf-8?B?S2dDdGRCdDBuMUdtajhkK3p1Ty9ISkdYTVpIbVh0S0IwZHAreWFUTjI0aUlT?=
 =?utf-8?B?d2hJd3MyR3p0RHVDUUFPNnRia3JvOXV2bW1aMDVBVHJ1K2RnYW95MnAwdUN3?=
 =?utf-8?B?QXVnUUJtZlcwOHRCdEs4TEVZNmdVTk9zcWUyYlNkQmR4SzhwRE1tQzZPZ0xW?=
 =?utf-8?B?SmNtNGtxSTFFVkFRWU1iTHUxNzJQMitjRkFxRlhxN1BJeU9ydnlVaE1BWVRj?=
 =?utf-8?B?eWhWSDVTelFRL0hYejVwOGpwZkJhTERGSHltQlBPNlYyTC9pUzhBQXlETnlB?=
 =?utf-8?B?WGIwdWU1RjJLb2VvN2ZIU051c21XSDd1R2pldlFTNmdBdDFkNzFXRDcyVFN6?=
 =?utf-8?B?TXUxelVmZGlXSEk1UEs1MFJWWTNwMVVaMVJOckZtVTg2OVdoVHJrd3FIMTRz?=
 =?utf-8?B?TFhJQzl2cmlzNm44Zk54WE1mRUkzZjBhRFJodnE1SCtHQzJvZVJ3YjUrMi9U?=
 =?utf-8?B?SUtZUUhLTEt3Tm9kZmNtNmpyZjdVdTRpR2Z6Uy9TbTBjT2dyM0FMUXV4Tm1n?=
 =?utf-8?B?bDlLb2QvNG1HVXJMUWQ4UUJwVGFHR0paeGdTSURMK0NOWngxbENWRzYrZFdJ?=
 =?utf-8?B?NlZiYkkzMkpFWHNTOUZDSlZlamFCRXdqdWdubldFWlpCcU1WNUhLTkM0VUUw?=
 =?utf-8?B?d3VSUENlVFZLRTArZUloOStuOEw3WEplTlFBRzRyZ3ArZjNhdDZNYy9SOWhl?=
 =?utf-8?B?c3ZidkRva2EyZG1sZGRJN2gxd0JuMnAvaVdtQkhPSTB4WjFMTGpQL05zd2ZP?=
 =?utf-8?B?M0MwK2JBYnZncVFCUTZHaXpFSEY5dExoZ21oU3gvVHhsNk8wR1BIdFl3amJY?=
 =?utf-8?B?bWxQcXl5UGR1WUg4TDFROU9abWUwYU9sTHgxelk4QVhsYTRZaUU3ZTNWUkJH?=
 =?utf-8?B?TmpabkJ5QTlOeGs5NHB1blJMSlMreVl2d1RIZEhNWmVzZENtcG1xNW1HdjM3?=
 =?utf-8?B?WnZ3N2JyNE0wN1NYbzJGWDhFd3ExS2cwSGY5WmxZTXNpcG12eFcveWNjMitj?=
 =?utf-8?B?aHMyZ3dYZkRpS3lodloxK3dIWnlCU0k2aG05L3ptWlQvZlFINTNBSHFraE41?=
 =?utf-8?B?akNMUXJnbDNrSlJCK3gxNlhOUVRQNFRjb2w5UURFbkIyd1dlcXRDTjh0RXFL?=
 =?utf-8?B?V2hidlJHdTlGTkcwK1dzK3FmQkxzbUVQMTRxc2FFcVJwcXZNcWVsL0h0RU05?=
 =?utf-8?B?aDV2TmJ4MVNiTFJoblVnRUtHZlpmblBSR1l5eFRyZ2V4MStKY0RQUTFmMDVi?=
 =?utf-8?B?UjhFYXd6emFMWkU4OUxjdkUyM1ZsOUllNG9wSTdZa0dPVEpmVmRSdG1DUncw?=
 =?utf-8?B?S0RwWGhrVlZ1eGxMYjRBdS9SazRYSW8zakgyMWFDbHpvTTFmbVBTdDhhQ1dK?=
 =?utf-8?B?aHo4bE50QjJsaXNoS253N1dkMW9rc2VZdVFBM0ZvcEc0OVd3VXE5T01ia0xL?=
 =?utf-8?Q?6U1OA3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zk1VZkVDZ0thY01CWUtmYmU3TjE3Unc3cTk3UjlrSmR5SFBWdU1UaVZROXpH?=
 =?utf-8?B?NEY4SUdFVWhNMllYMG5aTUJucVVMV0tHcWx5VGUyWnZzd2tFWEpmM1FKZXQx?=
 =?utf-8?B?OWR3YWpUSGg0WmlYUytHY3gyRFNMc3ljeURnaTJHeHAvaUxpa1pVVkF6TFZE?=
 =?utf-8?B?VnUxT1cvT0FoUFE0Q3BFOFo2UU5PSDJaeEo4R2J6M3dtTitlWTJpUEhOU1Fy?=
 =?utf-8?B?UTVLYndrVHZucUtyWVNSUDFNNlFNMjRjSVlELzRrWFFlcXFIcXZqOCtWOWt4?=
 =?utf-8?B?SzM5b3lHcjdOc1MxelZYUnRZeHFFQ3lWYjE3KzZQWXQ3MTBmTFpQb1dmV25X?=
 =?utf-8?B?L1lnTWN5N0RBT0lGcjRrZy9hMnNPcTRMYTV3SU9IK3NqMEM5NVVVRTIwS1pD?=
 =?utf-8?B?UlJCbVQxWG8ybHptSEhyZXBDNU1heFVlcmlsR3FaQ2E0Q1gvbTN6VzliUmdE?=
 =?utf-8?B?ZmVlS2pYS293VzVuSXRMb3B4YUxUMCt5eW9iSEhoNlN2bFllUGU4Y3kzR251?=
 =?utf-8?B?QlRlZ1Y2eDBQRkM1YU9GVWljWmJrcUs1ZWZXdGlVblQzTnQ5MFM0SG1sNTBO?=
 =?utf-8?B?WGVYdVdiVGh1enJwZTluSHZoZ3JkZDJNRmFySFVibXk0M2tDN3QzT2ZZa2wz?=
 =?utf-8?B?NjE4TnFCekZVeWRWT25xNGtCWGdCVW1HM0xPdHI3aCtkNjNRUjF6VlRSVEFK?=
 =?utf-8?B?cHdMcTJzV0JXMFRrNFRuT2NHNEQzMmM2TkdjK0Q0QkVJeERDaHFSaFlrL2xT?=
 =?utf-8?B?dFg5RXdjMDdsUnIvVFh4OTJYOWNQaVAvSzlEV3Q5ZlBFbEg5Q0ovbXdPM1pB?=
 =?utf-8?B?ZDdNaFNOVVN0WFlQeUlrdGwyaUR6eXVTc1JxdnpTY29SNENaZUl6azdReEU2?=
 =?utf-8?B?dStZdVQvU1UzamQ4TmlyTlB2akxWZUN0Y0I5eFFNN2pBWk9FdlpvamdCNGtK?=
 =?utf-8?B?NGtqVzVTTm1Kenh6UDhkNy8xK3VBdHBXYk1Fdk1MNXBoSy9FaVNCd0RGQ2dW?=
 =?utf-8?B?YW9xVFl0cHMweGdjR1V1bHdabjUxOXdzenRoTXpVOVA5MEFYWW5OVGNvK0Rl?=
 =?utf-8?B?ek1rMnh5RGZaWHhaemIyWnVrb1k1MjJKNFlDOVg2MU9mTk1TNXd2VG4zOUxH?=
 =?utf-8?B?YUFZWWk3Z3BMSEhWQTlDWVVxank0dkdGaFVtZkFqWkVvTkdxOVYrWGgzVUsy?=
 =?utf-8?B?NzJLTm96VnV5dVlXcFhNcC8vWXQ3bVFMYkJhYlI2K0gxSGJqTTdwRWVud1Yz?=
 =?utf-8?B?bzgwS1VYNk94V2crazh5ckxVb3ZvWm9WcFc5LzB0ZkhFVkNZbG8zeGVINDVG?=
 =?utf-8?B?UHFscGZOQXVPVExuZk4xUkRnMGx4VFlKcmdvMGxtWmNaMUl6RjAvSkNCSGxo?=
 =?utf-8?B?aXE3VEtUNW0zcmQ5Tmp1TmVocmdLRnpMSDk0elUrbWRaR2xxekFIRmhSTXVZ?=
 =?utf-8?B?YXp1c1M3Vi9mRGlTaExpWkJZVUhuMDhSdnJLdWdzRHk5Z3JFZzVZNXlXVlg5?=
 =?utf-8?B?Y2syZjdsZVFkOTAxcWlRYnV0TTZ5RVFRMk9meGcxQ2R2bHYzcG05ZVd6NDNV?=
 =?utf-8?B?RFRPK0RtZTRlL0VHeU9ySjdnSkpBUjVKU2hkQm90bjd0bXdzYTVCTHBjbldz?=
 =?utf-8?B?ZlROb2hyQTBGOFBtdE5ZeHJleWZrMlozaHlZNUl5MXJEbHVKK0pVbTlTYXA5?=
 =?utf-8?B?NjlVM1pDTnF0TWhEbElIa1B6Y0pCazFnZlhaOWc3eU9IalgzWmhyYnlrM0t6?=
 =?utf-8?B?dlNnU2YxclJkMFZYVnJRM09wcUtJNVlnY3dXaU1hc3dZeEVqM1ZEVXNDZ2xs?=
 =?utf-8?B?eHA5SFVlam5UYXlhM2MwQ0M3S1R3eWdaVVl5Mk93TXZqRUszaVhRS2FwME1o?=
 =?utf-8?B?N1p5bXZzTWtlcXdDQTZIRk1kQ043THBibSt6UkNHbFArVkZiV0ZYM1YrVGRr?=
 =?utf-8?B?b2xYQXJ6cVo5ZHFSbXllNFYvSFNKcTIyRWFYRDFFQ21PZ0RxMFVKMStNUjNF?=
 =?utf-8?B?QUZFem90YUFwcXNCYWxyRVNIb1Z4eGp1eWx2Vmxna0JzNXhoTVFlMmJVUUxG?=
 =?utf-8?B?c2c3OGtreURDSjlGUnlISXQ4QWpVZVUxUDJjTW9jQzVRNkFxNm5mRmEzZjBG?=
 =?utf-8?B?QVlObGtxRVNGQ2xnZzRHQVpPbmpsdjNrM2xKYTY1SVdnaytSYkxET01JMG9F?=
 =?utf-8?B?aEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFCB1F6E0255604C8F5AC6F9CA4B96A7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ee170b-0911-48a3-f88d-08de3379cb07
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 21:12:12.3429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t4mvBTQmtJysioELfNbHjEFxDnyM/mIgN5GZl6k7Ca7U7cpTdjZmE9nHU5awJIMU0Lukj0leMEIrmMFy9tZnDZVBksogtdYJF7afM6xpklo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4729
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
dXJhIHdyb3RlOgo+IEluIGV4ZWMtc2FuaXR5IHN1YnRlc3QsIHZhbGlkYXRlIHRoYXQgam9iIGNh
biBiZSBzdWJtaXR0ZWQKPiBvbiBzZWNvbmRhcnkgcXVldWUgYWZ0ZXIgY2xvc2luZyB0aGUgcHJp
bWFyeSBxdWV1ZSBpZiB0aGUKPiB1c2VyIHNwZWNpZmllcyB0aGUgS0VFUF9BQ1RJVkUgZmxhZyB3
aGlsZSBjcmVhdGluZyB0aGUgZ3JvdXAuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmlyYW5qYW5hIFZp
c2h3YW5hdGhhcHVyYQo+IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4KClJl
dmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgoKPiAt
LS0KPiDCoHRlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYyB8IDI2ICsrKysrKysrKysr
KysrKysrKysrKysrLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9x
dWV1ZS5jCj4gYi90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMKPiBpbmRleCAyODhl
ZjllZDguLjE0NDlmYTk0ZSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRp
X3F1ZXVlLmMKPiArKysgYi90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMKPiBAQCAt
MjY4LDYgKzI2OCw3IEBAIF9fdGVzdF9leGVjX3Nhbml0eShpbnQgZmQsIHN0cnVjdAo+IGRybV94
ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwgdW5zaWduZWQgaW4KPiDCoMKgwqDCoMKgwqDC
oMKgfTsKPiDCoMKgwqDCoMKgwqDCoMKgdWludDY0X3QgZXh0ID0gdG9fdXNlcl9wb2ludGVyKCZt
dWx0aV9xdWV1ZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoGJvb2wgcHJlZW1wdF9tb2RlID0gZmxhZ3Mg
JiBQUkVFTVBUX01PREU7Cj4gK8KgwqDCoMKgwqDCoMKgYm9vbCBrZWVwX2FjdGl2ZSA9IGZsYWdz
ICYgS0VFUF9BQ1RJVkU7Cj4gwqDCoMKgwqDCoMKgwqDCoGludCBpOwo+IMKgCj4gwqDCoMKgwqDC
oMKgwqDCoHN5bmMuZmxhZ3MgPSBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTDsKPiBAQCAtMjc5LDkg
KzI4MCwxMyBAQCBfX3Rlc3RfZXhlY19zYW5pdHkoaW50IGZkLCBzdHJ1Y3QKPiBkcm1feGVfZW5n
aW5lX2NsYXNzX2luc3RhbmNlICplY2ksIHVuc2lnbmVkIGluCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBzeW5jLmhhbmRsZSA9IHN5bmNvYmpfY3JlYXRlKGZkLCAwKTsKPiDCoMKg
wqDCoMKgwqDCoMKgfQo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgdm0gPSB4ZV92bV9jcmVhdGUoZmQs
IHByZWVtcHRfbW9kZSA/Cj4gRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0xSX01PREUgOiAwLCAwKTsK
PiArwqDCoMKgwqDCoMKgwqB2bSA9IHhlX3ZtX2NyZWF0ZShmZCwgcHJlZW1wdF9tb2RlID8KPiBE
Uk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERSB8Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfRkFVTFRfTU9E
RSA6IDAsIDApOwo+IMKgwqDCoMKgwqDCoMKgwqBib19zaXplID0geGVfYmJfc2l6ZShmZCwgc2l6
ZW9mKHN0cnVjdCB4ZV9zcGluKSk7Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqBpZiAoa2VlcF9hY3Rp
dmUpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG11bHRpX3F1ZXVlLnZhbHVlIHw9
IERSTV9YRV9NVUxUSV9HUk9VUF9LRUVQX0FDVElWRTsKPiArCj4gwqDCoMKgwqDCoMKgwqDCoGZv
ciAoaSA9IDA7IGkgPCBOVU1fUVVFVUVTOyBpKyspIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGJvW2ldID0geGVfYm9fY3JlYXRlKGZkLCB2bSwgYm9fc2l6ZSwKPiB2cmFtX2lm
X3Bvc3NpYmxlKGZkLCBlY2lbMF0uZ3RfaWQpLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+IERSTV9YRV9H
RU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklTSUJMRV9WUkFNKTsKPiBAQCAtMzI5LDE0ICszMzQsMjcg
QEAgX190ZXN0X2V4ZWNfc2FuaXR5KGludCBmZCwgc3RydWN0Cj4gZHJtX3hlX2VuZ2luZV9jbGFz
c19pbnN0YW5jZSAqZWNpLCB1bnNpZ25lZCBpbgo+IMKgwqDCoMKgwqDCoMKgwqAvKiBEZXN0cm95
IHByaW1hcnkgcXVldWUgKi8KPiDCoMKgwqDCoMKgwqDCoMKgeGVfZXhlY19xdWV1ZV9kZXN0cm95
KGZkLCBleGVjX3F1ZXVlc1swXSk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqAvKiBWYWxpZGF0ZSBz
dWJtaXNzaW9uIG9uIHNlY29uZGFyeSBxdWV1ZXMgZmFpbCBhZnRlcgo+IGRlc3Ryb3lpbmcgdGhl
IHByaW1hcnkgKi8KPiArwqDCoMKgwqDCoMKgwqAvKiBWYWxpZGF0ZSBzdWJtaXNzaW9uIG9uIHNl
Y29uZGFyeSBxdWV1ZXMgYWZ0ZXIgZGVzdHJveWluZwo+IHRoZSBwcmltYXJ5ICovCj4gwqDCoMKg
wqDCoMKgwqDCoHhlX3NwaW5faW5pdF9vcHRzKHNwaW5bMV0sIC5hZGRyID0gYWRkclsxXSk7Cj4g
wqDCoMKgwqDCoMKgwqDCoGlmIChwcmVlbXB0X21vZGUpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBzeW5jLmFkZHIgPSBhZGRyWzFdICsgKGNoYXIgKikmc3BpblsxXS0+ZXhlY19z
eW5jIC0KPiAoY2hhciAqKXNwaW5bMV07Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgZXhlYy5leGVj
X3F1ZXVlX2lkID0gZXhlY19xdWV1ZXNbMV07Cj4gwqDCoMKgwqDCoMKgwqDCoGV4ZWMuYWRkcmVz
cyA9IGFkZHJbMV07Cj4gLcKgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydF9lcShfX3hlX2V4ZWMoZmQs
ICZleGVjKSwgLUVDQU5DRUxFRCk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlmIChrZWVwX2FjdGl2
ZSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9leGVjKGZkLCAmZXhlYyk7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3NwaW5fd2FpdF9zdGFydGVkKHNw
aW5bMV0pOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9zcGluX2VuZChzcGlu
WzFdKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHByZWVtcHRfbW9kZSkg
ewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfd2Fp
dF91ZmVuY2UoZmQsICZzcGluWzFdLT5leGVjX3N5bmMsCj4gVVNFUl9GRU5DRV9WQUxVRSwgZXhl
Y19xdWV1ZXNbMV0sIGZlbmNlX3RpbWVvdXQpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB9IGVsc2Ugewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWd0X2Fzc2VydChzeW5jb2JqX3dhaXQoZmQsICZzeW5jLmhhbmRsZSwgMSwKPiBJTlQ2
NF9NQVgsIDAsIE5VTEwpKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHN5bmNvYmpfcmVzZXQoZmQsICZzeW5jLmhhbmRsZSwgMSk7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiArwqDCoMKgwqDCoMKgwqB9IGVsc2Ugewo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfYXNzZXJ0X2VxKF9feGVfZXhlYyhmZCwgJmV4
ZWMpLCAtRUNBTkNFTEVEKTsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiDCoMKgwqDCoMKgwqDC
oMKgaWYgKHByZWVtcHRfbW9kZSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN5
bmMuYWRkciA9IHRvX3VzZXJfcG9pbnRlcigmdm1fc3luYyk7Cj4gQEAgLTM3Niw2ICszOTQsOCBA
QCB0ZXN0X2V4ZWNfc2FuaXR5KGludCBmZCwgc3RydWN0Cj4gZHJtX3hlX2VuZ2luZV9jbGFzc19p
bnN0YW5jZSAqZWNpKQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqBfX3Rlc3RfZXhlY19zYW5pdHko
ZmQsIGVjaSwgMCk7Cj4gwqDCoMKgwqDCoMKgwqDCoF9fdGVzdF9leGVjX3Nhbml0eShmZCwgZWNp
LCBQUkVFTVBUX01PREUpOwo+ICvCoMKgwqDCoMKgwqDCoF9fdGVzdF9leGVjX3Nhbml0eShmZCwg
ZWNpLCBLRUVQX0FDVElWRSk7Cj4gK8KgwqDCoMKgwqDCoMKgX190ZXN0X2V4ZWNfc2FuaXR5KGZk
LCBlY2ksIFBSRUVNUFRfTU9ERSB8IEtFRVBfQUNUSVZFKTsKPiDCoH0KPiDCoAo+IMKgc3RhdGlj
IHZvaWQKCg==
