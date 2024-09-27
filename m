Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E647CEBF79
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 06:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A2C10EC1A;
	Fri, 27 Sep 2024 06:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9J6I4H3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E7010EC1A
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 06:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727417762; x=1758953762;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5+e2mW/GD7ZrED/qygl1gAG/Zt63bgIQ0xvyw+0a3Vk=;
 b=G9J6I4H3VUsu+vxZsskIfOkVCpcGaSc90GnwOVbFOAtG+5ux3Kp7Udn+
 nFWunmQnVCL4J0f7Ef6x5NFoq45ErDXomsJ9CBnNUp/3BdCipO4uFYjdC
 fCLCRylxeP2Da0yGON4iPOcF35gZo8y7mMStWEs9l8pRz2a5OyNdGRz/P
 ZJG8Tc14ZlseNkXP2SLIaU+o8UXH9lnfa5SVPAsiS/DVuYbh1Vpc6TmyK
 RqFM34xXd7LMHnTz47iXSUD6XPQWMUk/yzeC6eprAaq0mILyb7j5Yy1RR
 KVP6E75nEVAKGCAOaczPTim+zsZpl6P8xC6QcG6Hrw6wom7TdlhlSJHY7 A==;
X-CSE-ConnectionGUID: sib/dC6JSUuVLdaoXVYrCQ==
X-CSE-MsgGUID: esT3RG8GSgCq2y3mXmZm3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37131445"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; d="scan'208";a="37131445"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 23:16:02 -0700
X-CSE-ConnectionGUID: ulkRSyc6RmO0jYy9cQIbmQ==
X-CSE-MsgGUID: uXUgJm1HQEafkjb2c9Y+Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; d="scan'208";a="73217122"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 23:16:02 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 23:16:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 23:16:01 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 23:16:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiUoYPolG+srPKEuRsgPo7LDfUxQIwBY+FnWLlSWVTYCKTkCQis2h6kJZZiJWBg7jCHPnycgn0B5fmSjhZW55uqCb3D+zTDisvxF/nXJVyL3jLTXVJ4FitEgQoG6Z7VIXgbcXTUsnjqwyEdAXEnthe4c3TYJmID6/nFWCO7yn32YLHLdjxi6BJ8Jn9HpTWbH2SKlVXmL2UMLWs2jFSI5z68qIYlCKTR5DuzzlW1S0YlB0qw27qFuWRPsds8ceayh16VCSceR5Y5uhI4e5Z7KciD+OAPsxqwZoq911gZ98eeR75S6GJAeLpseng+apri+Duu4yNrBU5zimKJPAVHzjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+e2mW/GD7ZrED/qygl1gAG/Zt63bgIQ0xvyw+0a3Vk=;
 b=suWqLaXipmbJ4Wu5X7ZOCInIBOoCPa84ORGv+8rC2XzAtxZ9SALLAxBIb+t3by6hg/2bX1CBo3nzjEy3iko95UqbGiHBdFbfpHYRACXnCOC+NkZx8TTEImP508pl1mZ2bH+3cyfTm5FNj1KjIduLHXZaWsjlc/5nAcqm0DSa7J8hos6df6m0GN48dMn1ewptdsU+8IR9Lt7wY3hVHdIE3y0EqATHglQnu2rvnalh6kyBkgMU5bdAH5Gcq4IHZjrrzeOTmm3mxBF/khW4DZmPeLqbYD4A7Y4g5jWZ/Dc77hDu3lJt0sGQVTe2r3pbhkTAtsEgY4DJ/2Ry6GvCaxOHNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by SJ0PR11MB4877.namprd11.prod.outlook.com (2603:10b6:a03:2d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Fri, 27 Sep
 2024 06:14:58 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea%7]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 06:14:58 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>
Subject: RE: [PATCH] tests/intel/xe_sysfs_timeslice_duration: Add test to
 validate timeslice duration
Thread-Topic: [PATCH] tests/intel/xe_sysfs_timeslice_duration: Add test to
 validate timeslice duration
Thread-Index: AQHbEJqTm2fvFHa4XUq65TApvDV3QLJrJdoA
Date: Fri, 27 Sep 2024 06:14:58 +0000
Message-ID: <MW3PR11MB4748740DACB001E747F82278AE6B2@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240927051112.1801791-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20240927051112.1801791-1-sai.gowtham.ch@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|SJ0PR11MB4877:EE_
x-ms-office365-filtering-correlation-id: 9f9b2c29-c811-4f10-549a-08dcdebbb68c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K2ZDQ2VNaHhiRFBJaTZVakcvaWJYUEhueEVQeDQ2NDJOVmlZRVoxRXc1bzlD?=
 =?utf-8?B?VSt3QVVFZlVpUXZvVGIxUWNvdUxEaGMxQ0NxcG1IR0tUZVNrbnNyOVk0TVhH?=
 =?utf-8?B?SkRUenlxMjdrUTVVZGl4NGh2c2ZrTVRQUlpzTENWeThjTHlieUJ0Tkh5Y1Yz?=
 =?utf-8?B?L3VGWmlmY21ROHV3S1ZINkRyeXhNaGxNdXhuVXJ3SnU1d2E5OXVVV1dVcUtM?=
 =?utf-8?B?aFdGV2tpdlhIUmtsY1FmS1BLblVHdUF6TEdLQzhVZUVwbHFPc0VpVGZQR0w0?=
 =?utf-8?B?UHlGakhreE9uVEExV1BreEpYVU9rVUErYjN6dUYyTEs1T2ZzeHV2ZmVJZEVQ?=
 =?utf-8?B?OVgzalZXUm5Id20yQ0NmODFyUjJGRTdDMUk3RjN4eFphamxqeElNUkNPUTdC?=
 =?utf-8?B?bU9SWWpZbFRBamJYQzc5QU1IWXM4Z3J4QTZvRkxnTmJSRi9wb2NyVTlPMCtZ?=
 =?utf-8?B?Ry9YVGJsVUhYYUxiK1VTSUw3aTRjZU1wdE8xNW1xaS9Na3J5b20wdEE4clk0?=
 =?utf-8?B?M21zZXQ3SGxYbW8zdUw1dExvTFVvbWxXK3pWQjAyNnpFZldSNzJBd3lFR3lj?=
 =?utf-8?B?N1BwVCtBZkQrSkwwa21oellTUWUxWTVoZkJEUXZQdlBGT1dRblA2SUtnaXZL?=
 =?utf-8?B?TUtYd25rQURMUWdUUEVMN1pLdlI5SGx2MklaOXJyeVdyZXVrM2lERVhKTkl3?=
 =?utf-8?B?NlZtajdEYU1XVTZSNThWT2xTaXZFejdLMkJkaVVFMjA1azJqd091S3VTcmMy?=
 =?utf-8?B?Njlmb0NtQlVnLzFnckZmMnNya3pWUlFCMWoxL0VTQzFVbG4rYmczdWs2Q3pZ?=
 =?utf-8?B?Q1A3bWV1TC9rSU5zdjFXMk5SMlA1YnpzYUsrY1BCNHgvVThveTQ4YnYzZmV0?=
 =?utf-8?B?cGd4N0dtWDk2VE83Um9yM216djFtUlRLRUdDS3J3NjZ6dUdvMGJhVTJ6WkJs?=
 =?utf-8?B?dEhlWmhUeDlZYVdHUXRNUUw2RmZ6R3ptbnNreTdGLzVWY1d4QXIzS2NHY2Fm?=
 =?utf-8?B?UlAyL1FPcnBzaHpqN1JYVFB4ZWJQbStPeXhXN2hCYmFaSnJiS1Q4QXMwb1hx?=
 =?utf-8?B?eGZzbjZ5MXFGcUJCZFFYOTRtdGROc1dZclI1TElrRk9jZkJyM3ZzY2d5d3dM?=
 =?utf-8?B?WituZjhrTTBFTjVxRDBsMlRJdnNWOStWbDRaU2lZaGtudkFhcUJiRDMrb2Zi?=
 =?utf-8?B?cUtUenBhNGk2WmVjMnQrTHlGemF2MzZ6UURRcmtKellKM28zUC9lV1JMSUpu?=
 =?utf-8?B?U29lQjNwVXFYNVhUeHdFNGpIbzVTK01uWkE4WnpLN3lrdmxSbHdremdXTTBR?=
 =?utf-8?B?a1ozOVpFV0ZSV0lRSE0yL0xMSkxjLzNMM28zczlLMjdDNDBWb3d5bzNTL2ZE?=
 =?utf-8?B?aHlvT2FwUzk2aEtDQk9rWnZqMVBiVnpsSzAzTjhxb1FtcURaQXUyUGRROWZL?=
 =?utf-8?B?WlZHTUJvRWpwMERxWkZpN3JLbjBnZHhCUzN1eTVucUQycERFNk9pZGxxRXN5?=
 =?utf-8?B?N2tiNGFUWCs0Q0k0MVNjQlc4blR3ZWxwcW00VmNzbmFZVmVReVkrOUxnRStE?=
 =?utf-8?B?MWN2OWs1ZFpHZWVQQ1M2UW1TNi9DMTA3bEx4MERIaEV2bS9ENE8rVGg1Y3pH?=
 =?utf-8?B?ZXVZckZnMDRPTjlNVUdkOUUvRnFyRFd0SE9VeFNQUW1MZVB3OHRYUDZaMlF3?=
 =?utf-8?B?WEZIR2xRdituQ3NuWitMaGpsTmRva0JLaGd6c0cwOWV0TDEzdVVtVVE1SXVP?=
 =?utf-8?B?ZG41STE2YmtNKzVhS3hWZk5Deko4b0syeXVMWkJ3ajlnWVN1ZXFLeXhlTE9D?=
 =?utf-8?B?enlZSXlWT3RBbW5nOHN4QT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0IvRWZCcC9CZU1XcHZQR1NETDZ3bmdhY21UdWhvdzJQZ3gwZHpOVzVjS0M1?=
 =?utf-8?B?TzNoU1dHZW5RZjhKanY0b25IeGd5QmpvNDFzbFhYbGRNY2pHTkZDelk5UnlV?=
 =?utf-8?B?MHNjSkRYNmhKbTVZQjR2alVqeWRKaWxiUFIzQ1RXeWlRZzU5Tjhla0UvQ3Iv?=
 =?utf-8?B?V2hEaUtFN1Z5UUhpYkdCbUpkc3JmSXkxSGFJa1k1RjBBWWdNZmRZUUN5V3lC?=
 =?utf-8?B?TnhVTWcrUGllT1EwU2VPWTBwTXZZdllkSnY1bVFIc0YxdDQxdXBzb0JHdUtP?=
 =?utf-8?B?RkttMGdZMTVmQlJlTkFGUVZVQzNaVlpIUExiWS8zZG5GSEhIbU9BWUpQQVd6?=
 =?utf-8?B?K0ZWYzQ4amdLUDBtSHZUekRCMkZ4L1ZtK25tZmJkZVcwZ2h6NjJSTUFNZ242?=
 =?utf-8?B?RlVmcTZHcFIzRkJxTVloajdzdW1rLzgxSS8xVkxyZ0xvbElFakUrZ1JSSlNt?=
 =?utf-8?B?VHdwbHRVcmlpeHh0TzNtRDJyQlBIRVZENmFwUGNlTS9rSUt1SlFuSVBTeGNI?=
 =?utf-8?B?OUdsbmlxUW9JN3JkQ2g0RDVuWG8xVytlY25VK212SWJSTmoxQ28xVnREcWxv?=
 =?utf-8?B?ODNLL1J2RVZvVGlhMHNFN3hVTHBGQzlvelFZc1hlQUxoTDFRYkc3bTM1ZlRh?=
 =?utf-8?B?UEtWNUF0VEVRRkJQeXpOdlk5YWp6ckxPVW9sblphek5qekRGYmc2KzFOZW9u?=
 =?utf-8?B?WWIvYTQ4cDFlL2dYeTYwS2FML3dGem02VU1BK2E3MFBmeTlVUDBkemhmOG1T?=
 =?utf-8?B?OFJJREhkdEszcUpMcmZpdzVPMWRXMTlQbGhVMExNT29NbG1IaU9raUdiSEow?=
 =?utf-8?B?ZTJ5ZktEY2RieFRqbWh3N0JORFUwdXliTmZYUXloSmtWUUlTSkwvcWh3bFJD?=
 =?utf-8?B?MzNsMTlGRlFzdHNMZEVjN0ZCbGNqTnV3NzJVaklwRVpyN0VqK0hxbWwyNTV5?=
 =?utf-8?B?ZEFnbVRiUzBnV1ltdkdra2VYdTZpVUpEVlpMbG1KSHdQTVVKenlKbU9OclpJ?=
 =?utf-8?B?ellOa1o3Qm12V3lwUG8xVXV1c2hDNzNjanZCQi9qL2pmMDVLRkpYakdUa3JL?=
 =?utf-8?B?b05ZRll6MytIT1FUZVR6WThZenVsYWNWVFZGVWJWd0JTejd6WWxad3ROQ2cy?=
 =?utf-8?B?SWJHbk05dkxjbk9KRngrRmtPd1Q1cU5BYjJ1TTFxcm1ucDFLTDI0YTB1MDg4?=
 =?utf-8?B?QUZyMTUxcUhaUjJRb2dkNTFYVEIrWURyWm1qQXd0RUJBblVmMThJRmFpTGx0?=
 =?utf-8?B?Q2JqcWRzZGI1SFhCVTFmN2h6clRZd0FsQmtsaWNlOWFjbzJQemk5SFJqdURF?=
 =?utf-8?B?R3BEbnRiN3hYZkNCUjNpekdjNExiTUM3ZFpmOFp2VmZsL2FXYWgrdVdyWFI4?=
 =?utf-8?B?OVhGcmhNTS9JVEszS1JnYmhKWTg3cFlRTm1yb05NKzZnczVMUWhBTWQzMjB6?=
 =?utf-8?B?S0oyaTE1Vld6M1BtRXB2U1NIS3VPbXBnYUVmR3RhOW5qNlVMM1Awck1RdE4r?=
 =?utf-8?B?Sk50NzdJNXBqQUxwUmpMNjZ3MTZ3c2I2ZU8ySlg4b3lMNFkvWHc3MFU1eGIw?=
 =?utf-8?B?ZHhQUXBOUlhDUnlGZkRQeUQ2eEJqMzhQVTYwVVh6bDJkYkkzN1l5RHpRT3Mz?=
 =?utf-8?B?ajBydzNia3NQRURlaytReElOeU53UEp2NmhDaG5wUU1lN1hVNFhWVkljRjgx?=
 =?utf-8?B?Vnd6L0VtMnY1ZGdGWDVxaHJ0QmFXSkt2bzlLTHJxKzNreXJKWTdyZGxxVVNF?=
 =?utf-8?B?b28ycjNtT0MzbTNNLzVEanc1Ylc1QVE0NTVzVmVIT3REOFo5NHlMTlJXTFg5?=
 =?utf-8?B?NnVFMnMvVGdLTmd6UHFGV0RMQ1VjUTJ0R2FELzl6RFpKckd6WHl0aVFkNm4y?=
 =?utf-8?B?eXlGMmJ1SUxqVjE1UnlQWnJYSlFHTFpoRFplazY0Yk1yejRJSkdnNUhjOXNC?=
 =?utf-8?B?aEtXcXJGUVkxUnY0eFArczg1N2ttTllNZVhWRHhaWTRRK05ydEZJSFZNbFVs?=
 =?utf-8?B?V09DNTcvN1Z4aVNuOHNqMEwzTklRK1R5d0xpL3ZqVWtCNUVHbXVhK0pWUXFm?=
 =?utf-8?B?bTVaelRqMTFTendNajRrVTA4WmpqUFl0WnZHOWZvVFZrMWhkNmFIZG1CcHcz?=
 =?utf-8?Q?qlBCQVtXVFN1V0BV8xWi3twFH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9b2c29-c811-4f10-549a-08dcdebbb68c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 06:14:58.2447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oGWmw6u2JgPscSAmfvcWyJhoDaYVICbLhLqucZS3gGZEX5r9Kc94bzQHrmM+C/qEHJMpdMGdIM7Xm2MlB0hgmbP3Kxw+1OXKY4mHW0CnqNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4877
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IHNhaS5nb3d0
aGFtLmNoQGludGVsLmNvbQ0KPiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciAyNywgMjAyNCAxMDo0
MSBBTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IENoLCBTYWkgR293dGhh
bQ0KPiA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3Rz
L2ludGVsL3hlX3N5c2ZzX3RpbWVzbGljZV9kdXJhdGlvbjogQWRkIHRlc3QgdG8gdmFsaWRhdGUN
Cj4gdGltZXNsaWNlIGR1cmF0aW9uDQo+IA0KPiBGcm9tOiBTYWkgR293dGhhbSBDaCA8c2FpLmdv
d3RoYW0uY2hAaW50ZWwuY29tPg0KPiANCj4gVGVzdCBjaGVja3MgaWYgdGhlIGV4ZWN1dGlvbiB0
aW1lIG9mIGEgY3R4IGlzIHdpdGhpbiB0aGUgZ2l2ZW4gdGltc2xpY2UgZHVyYXRpb24uDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBTYWkgR293dGhhbSBDaCA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29t
Pg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL3hlX3N5c2ZzX3RpbWVzbGljZV9kdXJhdGlvbi5jIHwg
MTk0ICsrKysrKysrKysrKysrKysrKysrKysNCj4gIHRlc3RzL21lc29uLmJ1aWxkICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTk1IGluc2VydGlv
bnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9pbnRlbC94ZV9zeXNmc190aW1lc2xp
Y2VfZHVyYXRpb24uYw0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3N5c2ZzX3Rp
bWVzbGljZV9kdXJhdGlvbi5jDQo+IGIvdGVzdHMvaW50ZWwveGVfc3lzZnNfdGltZXNsaWNlX2R1
cmF0aW9uLmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwLi4xYTVk
YmZlM2MNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9zeXNmc190aW1l
c2xpY2VfZHVyYXRpb24uYw0KPiBAQCAtMCwwICsxLDE5NCBAQA0KPiArLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IE1JVA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDI0IEludGVsIENv
cnBvcmF0aW9uDQo+ICsgKi8NCj4gKw0KPiArLyoqDQo+ICsgKiBURVNUOiBzeXNmcyB0aW1lc2xp
Y2UgZHVyYXRpb24NCj4gKyAqIENhdGVnb3J5OiBDb3JlDQo+ICsgKiBNZWdhIGZlYXR1cmU6IFN5
c01hbg0KPiArICogU3ViLWNhdGVnb3J5OiBTeXNNYW4gdGVzdHMNCj4gKyAqIEZ1bmN0aW9uYWxp
dHk6IHN5c2ZzIHRpbXNsaWNlIGR1cmF0aW9uDQo+ICsgKiBGZWF0dXJlOiBTTUksIGNvbnRleHQN
Cj4gKyAqIFRlc3QgY2F0ZWdvcnk6IFN5c01hbg0KPiArICoNCj4gKyAqIFNVQlRFU1Q6IHRpbWVz
bGljZV9kdXJhdGlvbl91cy10aW1lb3V0DQo+ICsgKiBEZXNjcmlwdGlvbjogVGVzdCB0byBjaGVj
ayBpZiB0aGUgZXhlY3V0aW9uIHRpbWUgb2YgYSBjdHggaXMNCj4gKyAqIAkJd2l0aGluIHRoZSBn
aXZlbiB0aW1zbGljZSBkdXJhdGlvbi4NCj4gKyAqIFRlc3QgY2F0ZWdvcnk6IGZ1bmN0aW9uYWxp
dHkgdGVzdA0KPiArICoNCj4gKyAqLw0KPiArI2luY2x1ZGUgPGZjbnRsLmg+DQo+ICsNCj4gKyNp
bmNsdWRlICJpZ3QuaCINCj4gKyNpbmNsdWRlICJpZ3Rfc3luY29iai5oIg0KPiArI2luY2x1ZGUg
ImlndF9zeXNmcy5oIg0KPiArI2luY2x1ZGUgInhlL3hlX2lvY3RsLmgiDQo+ICsjaW5jbHVkZSAi
eGUveGVfc3Bpbi5oIg0KPiArDQo+ICsjZGVmaW5lIEFUVFIgInRpbWVzbGljZV9kdXJhdGlvbl91
cyINCj4gKw0KPiArc3RhdGljIHZvaWQgc2V0X3RpbWVzbGljZV9kdXJhdGlvbihpbnQgZW5naW5l
LCB1bnNpZ25lZCBpbnQgdmFsdWUpIHsNCj4gKwl1bnNpZ25lZCBpbnQgZGVsYXk7DQo+ICsNCj4g
KwlpZ3RfYXNzZXJ0X2x0ZSgwLCBpZ3Rfc3lzZnNfcHJpbnRmKGVuZ2luZSwgQVRUUiwgIiV1Iiwg
dmFsdWUpKTsNCj4gKwlpZ3Rfc3lzZnNfc2NhbmYoZW5naW5lLCBBVFRSLCAiJXUiLCAmZGVsYXkp
Ow0KPiArCWlndF9hc3NlcnRfZXEoZGVsYXksIHZhbHVlKTsNCj4gK30NCj4gKw0KPiArc3RhdGlj
IHVpbnQ2NF90IF9fdGVzdF90aW1lb3V0KGludCBmZCwgaW50IGVuZ2luZSwgdW5zaWduZWQgaW50
DQo+ICt0aW1lb3V0LCB1aW50MTZfdCBndCwgaW50IGNsYXNzKSB7DQo+ICsJc3RydWN0IGRybV94
ZV9zeW5jIHN5bmMgPSB7DQo+ICsJCS5oYW5kbGUgPSBzeW5jb2JqX2NyZWF0ZShmZCwgMCksDQo+
ICsJCS50eXBlID0gRFJNX1hFX1NZTkNfVFlQRV9TWU5DT0JKLA0KPiArCQkuZmxhZ3MgPSBEUk1f
WEVfU1lOQ19GTEFHX1NJR05BTCwNCj4gKwl9Ow0KPiArDQo+ICsJc3RydWN0IGRybV94ZV9leGVj
IGV4ZWMgPSB7DQo+ICsJCS5udW1fYmF0Y2hfYnVmZmVyID0gMSwNCj4gKwkJLm51bV9zeW5jcyA9
IDEsDQo+ICsJCS5zeW5jcyA9IHRvX3VzZXJfcG9pbnRlcigmc3luYyksDQo+ICsJfTsNCj4gKy8q
IGhpZ2ggcHJpb3JpdHkgcHJvcGVydHkgKi8NCj4gKwlzdHJ1Y3QgZHJtX3hlX2V4dF9zZXRfcHJv
cGVydHkgZXh0ID0gew0KPiArCQkuYmFzZS5uZXh0X2V4dGVuc2lvbiA9IDAsDQo+ICsJCS5iYXNl
Lm5hbWUgPQ0KPiBEUk1fWEVfRVhFQ19RVUVVRV9FWFRFTlNJT05fU0VUX1BST1BFUlRZLA0KPiAr
CQkucHJvcGVydHkgPSBEUk1fWEVfRVhFQ19RVUVVRV9TRVRfUFJPUEVSVFlfUFJJT1JJVFksDQo+
ICsJCS52YWx1ZSA9IDIsIC8qIEhpZ2ggcHJpb3JpdHkgKi8NCj4gKwl9Ow0KVG8gQ2hlY2sgc2No
ZWR1bGVyIGNvbmZpZ3VyYXRpb24gcmVsYXRlZCB0byB0aW1lc2xpY2UuIFdlIG5lZWQgdG8gc3Vi
bWl0IHR3byBqb2JzIHdpdGggc2FtZSBwcmlvcml0eSBhbmQgDQpzY2hlZHVsZXIgd2lsbCBwcmUt
ZW1wdCBjdXJyZW50IGpvYiBvbmNlIHRpbWVzbGljZSBleHBpcmVzLg0KDQpUaGFua3MsDQpSYWh1
bA0KPiArCXN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpod2UgPSBOVUxMLCAq
X2h3ZTsNCj4gKwl1aW50MzJfdCBleGVjX3F1ZXVlc1syXTsNCj4gKwl1aW50MzJfdCB2bVsyXTsN
Cj4gKwl1aW50MzJfdCBib1syXTsNCj4gKwlzaXplX3QgYm9fc2l6ZTsNCj4gKwlzdHJ1Y3QgeGVf
c3BpbiAqc3BpblsyXTsNCj4gKwlzdHJ1Y3QgdGltZXNwZWMgdHMgPSB7fTsNCj4gKwl1aW50NjRf
dCBlbGFwc2VkOw0KPiArCXVpbnQ2NF90IGFkZHIxID0gMHgxYTAwMDAsIGFkZHIyID0gMHgxMDAw
MDA7DQo+ICsNCj4gKwl4ZV9mb3JfZWFjaF9lbmdpbmUoZmQsIF9od2UpDQo+ICsJCWlmIChfaHdl
LT5lbmdpbmVfY2xhc3MgPT0gY2xhc3MgJiYgX2h3ZS0+Z3RfaWQgPT0gZ3QpDQo+ICsJCQlod2Ug
PSBfaHdlOw0KPiArCWlmICghaHdlKQ0KPiArCQlyZXR1cm4gLTE7DQo+ICsNCj4gKwkvKiBzZXQg
dGltZXNsaWNlIGR1cmF0aW9uKi8NCj4gKwlzZXRfdGltZXNsaWNlX2R1cmF0aW9uKGVuZ2luZSwg
dGltZW91dCk7DQo+ICsJdm1bMF0gPSB4ZV92bV9jcmVhdGUoZmQsIDAsIDApOw0KPiArCXZtWzFd
ID0geGVfdm1fY3JlYXRlKGZkLCAwLCAwKTsNCj4gKwlleGVjX3F1ZXVlc1swXSA9IHhlX2V4ZWNf
cXVldWVfY3JlYXRlKGZkLCB2bVswXSwgaHdlLCAwKTsNCj4gKwlleGVjX3F1ZXVlc1sxXSA9IHhl
X2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2bVsxXSwgaHdlLA0KPiB0b191c2VyX3BvaW50ZXIoJmV4
dCkpOw0KPiArCWJvX3NpemUgPSB4ZV9iYl9zaXplKGZkLCBzaXplb2YoKnNwaW4pKTsNCj4gKwli
b1swXSA9IHhlX2JvX2NyZWF0ZShmZCwgdm1bMF0sIGJvX3NpemUsIHZyYW1faWZfcG9zc2libGUo
ZmQsIDApLCAwKTsNCj4gKwlzcGluWzBdID0geGVfYm9fbWFwKGZkLCBib1swXSwgYm9fc2l6ZSk7
DQo+ICsJeGVfdm1fYmluZF9hc3luYyhmZCwgdm1bMF0sIDAsIGJvWzBdLCAwLCBhZGRyMSwgYm9f
c2l6ZSwgJnN5bmMsIDEpOw0KPiArCXhlX3NwaW5faW5pdF9vcHRzKHNwaW5bMF0sIC5hZGRyID0g
YWRkcjEsIC5wcmVlbXB0ID0gZmFsc2UpOw0KPiArCWV4ZWMuYWRkcmVzcyA9IGFkZHIxOw0KPiAr
CWV4ZWMuZXhlY19xdWV1ZV9pZCA9IGV4ZWNfcXVldWVzWzBdOw0KPiArCXhlX2V4ZWMoZmQsICZl
eGVjKTsNCj4gKwl4ZV9zcGluX3dhaXRfc3RhcnRlZChzcGluWzBdKTsNCj4gKw0KPiArCWJvWzFd
ID0geGVfYm9fY3JlYXRlKGZkLCB2bVsxXSwgYm9fc2l6ZSwgdnJhbV9pZl9wb3NzaWJsZShmZCwg
MCksIDApOw0KPiArCXNwaW5bMV0gPSB4ZV9ib19tYXAoZmQsIGJvWzFdLCBib19zaXplKTsNCj4g
Kwl4ZV92bV9iaW5kX3N5bmMoZmQsIHZtWzFdLCBib1sxXSwgMCwgYWRkcjIsIGJvX3NpemUpOw0K
PiArCXhlX3NwaW5faW5pdF9vcHRzKHNwaW5bMV0sIC5hZGRyID0gYWRkcjIpOw0KPiArCWV4ZWMu
YWRkcmVzcyA9IGFkZHIyOw0KPiArCWV4ZWMuZXhlY19xdWV1ZV9pZCA9IGV4ZWNfcXVldWVzWzFd
Ow0KPiArCWlndF9uc2VjX2VsYXBzZWQoJnRzKTsNCj4gKwl4ZV9leGVjKGZkLCAmZXhlYyk7DQo+
ICsJeGVfc3Bpbl93YWl0X3N0YXJ0ZWQoc3BpblsxXSk7DQo+ICsJZWxhcHNlZCA9IGlndF9uc2Vj
X2VsYXBzZWQoJnRzKTsNCj4gKwl4ZV9zcGluX2VuZChzcGluWzFdKTsNCj4gKw0KPiArCXhlX3Zt
X3VuYmluZF9hc3luYyhmZCwgdm1bMF0sIDAsIDAsIGFkZHIxLCBib19zaXplLCAmc3luYywgMSk7
DQo+ICsJaWd0X2Fzc2VydChzeW5jb2JqX3dhaXQoZmQsICZzeW5jLmhhbmRsZSwgMSwgSU5UNjRf
TUFYLCAwLCBOVUxMKSk7DQo+ICsNCj4gKwl4ZV9zcGluX2VuZChzcGluWzBdKTsNCj4gKwl4ZV92
bV91bmJpbmRfc3luYyhmZCwgdm1bMV0sIDAsIGFkZHIyLCBib19zaXplKTsNCj4gKwlzeW5jb2Jq
X2Rlc3Ryb3koZmQsIHN5bmMuaGFuZGxlKTsNCj4gKw0KPiArCXhlX2V4ZWNfcXVldWVfZGVzdHJv
eShmZCwgZXhlY19xdWV1ZXNbMF0pOw0KPiArCXhlX3ZtX2Rlc3Ryb3koZmQsIHZtWzBdKTsNCj4g
Kwl4ZV9leGVjX3F1ZXVlX2Rlc3Ryb3koZmQsIGV4ZWNfcXVldWVzWzFdKTsNCj4gKwl4ZV92bV9k
ZXN0cm95KGZkLCB2bVsxXSk7DQo+ICsNCj4gKwlyZXR1cm4gZWxhcHNlZDsNCj4gK30NCj4gKw0K
PiArc3RhdGljIHZvaWQgdGVzdF90aW1lb3V0KGludCBmZCwgaW50IGVuZ2luZSwgY29uc3QgY2hh
ciAqKnByb3BlcnR5LA0KPiArdWludDE2X3QgY2xhc3MsIGludCBndCkgew0KPiArCXVpbnQ2NF90
IGRlbGF5c1tdID0geyAxMDAwLCA1MDAwMCwgMTAwMDAwLCA1MDAwMDAgfTsNCj4gKwl1bnNpZ25l
ZCBpbnQgc2F2ZWQ7DQo+ICsJdWludDY0X3QgZWxhcHNlZDsNCj4gKwl1aW50NjRfdCBlcHNpbG9u
Ow0KPiArDQo+ICsJaWd0X3JlcXVpcmUoaWd0X3N5c2ZzX3ByaW50ZihlbmdpbmUsICJwcmVlbXB0
X3RpbWVvdXRfdXMiLCAiJXUiLCAxKSA9PQ0KPiAxKTsNCj4gKwlpZ3RfYXNzZXJ0KGlndF9zeXNm
c19zY2FuZihlbmdpbmUsIHByb3BlcnR5WzBdLCAiJXUiLCAmc2F2ZWQpID09IDEpOw0KPiArCWln
dF9kZWJ1ZygiSW5pdGlhbCAlczoldVxuIiwgcHJvcGVydHlbMF0sIHNhdmVkKTsNCj4gKw0KPiAr
CWVsYXBzZWQgPSBfX3Rlc3RfdGltZW91dChmZCwgZW5naW5lLCAxMDAwLCBndCwgY2xhc3MpOw0K
PiArCWVwc2lsb24gPSAyICogZWxhcHNlZCAvIDEwMDA7DQo+ICsJaWYgKGVwc2lsb24gPCA1MDAw
MCkNCj4gKwkJZXBzaWxvbiA9IDUwMDAwOw0KPiArCWlndF9pbmZvKCJNaW5pbXVtIHRpbWVvdXQg
bWVhc3VyZWQgYXMgJS4zZnVzOyBzZXR0aW5nIGVycm9yIHRocmVzaG9sZA0KPiB0byAlIiBQUklk
NjQgInVzXG4iLA0KPiArDQo+IAllbGFwc2VkICogMWUtMywgZXBzaWxvbik7DQo+ICsJaWd0X3Jl
cXVpcmUoZXBzaWxvbiA8IDEwMDAwMDAwKTsNCj4gKw0KPiArCWZvciAoaW50IGkgPSAwOyBpIDwg
QVJSQVlfU0laRShkZWxheXMpOyBpKyspIHsNCj4gKwkJZWxhcHNlZCA9IF9fdGVzdF90aW1lb3V0
KGZkLCBlbmdpbmUsIGRlbGF5c1tpXSwgZ3QsIGNsYXNzKTsNCj4gKwkJaWd0X2luZm8oIiVzOiVs
ZCwgZWxhcHNlZD0lLjNmdXNcbiIsDQo+ICsJCQkJcHJvcGVydHlbMF0sIGRlbGF5c1tpXSwgZWxh
cHNlZCAqIDFlLTMpOw0KPiArCQlpZ3RfYXNzZXJ0X2YoZWxhcHNlZCAvIDEwMDAgIDwgZGVsYXlz
W2ldICsgZXBzaWxvbiwNCj4gKwkJCQkiVGltZXNsaWNlIGV4Y2VlZGVkIHJlcXVlc3QhIVxuIik7
DQo+ICsJfQ0KPiArDQo+ICsJc2V0X3RpbWVzbGljZV9kdXJhdGlvbihlbmdpbmUsIHNhdmVkKTsg
fQ0KPiArDQo+ICtpZ3RfbWFpbg0KPiArew0KPiArCXN0YXRpYyBjb25zdCBzdHJ1Y3Qgew0KPiAr
CQljb25zdCBjaGFyICpuYW1lOw0KPiArCQl2b2lkICgqZm4pKGludCwgaW50LCBjb25zdCBjaGFy
ICoqLCB1aW50MTZfdCwgaW50KTsNCj4gKwl9IHRlc3RzW10gPSB7DQo+ICsJCXsgInRpbWVvdXQi
LCB0ZXN0X3RpbWVvdXQgfSwNCj4gKwkJeyB9DQo+ICsJfTsNCj4gKwljb25zdCBjaGFyICpwcm9w
ZXJ0eVtdWzNdID0geyB7InRpbWVzbGljZV9kdXJhdGlvbl91cyIsDQo+ICsJCQkJICAgICAgICJ0
aW1lc2xpY2VfZHVyYXRpb25fbWluIiwNCj4gKwkJCQkgICAgICAgInRpbWVzbGljZV9kdXJhdGlv
bl9tYXgifSwgfTsNCj4gKwlpbnQgY291bnQgPSBzaXplb2YocHJvcGVydHkpIC8gc2l6ZW9mKHBy
b3BlcnR5WzBdKTsNCj4gKwlpbnQgZmQgPSAtMSwgc3lzX2ZkLCBndDsNCj4gKwlpbnQgZW5naW5l
c19mZCA9IC0xLCBndF9mZCA9IC0xOw0KPiArDQo+ICsJaWd0X2ZpeHR1cmUgew0KPiArCQlmZCA9
IGRybV9vcGVuX2RyaXZlcihEUklWRVJfWEUpOw0KPiArDQo+ICsJCXN5c19mZCA9IGlndF9zeXNm
c19vcGVuKGZkKTsNCj4gKwkJaWd0X3JlcXVpcmUoc3lzX2ZkICE9IC0xKTsNCj4gKwkJY2xvc2Uo
c3lzX2ZkKTsNCj4gKwl9DQo+ICsNCj4gKwlmb3IgKGludCBpID0gMDsgaSA8IGNvdW50OyBpKysp
IHsNCj4gKwkJZm9yICh0eXBlb2YoKnRlc3RzKSAqdCA9IHRlc3RzOyB0LT5uYW1lOyB0KyspIHsN
Cj4gKwkJCWlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pY19mKCIlcy0lcyIsIHByb3BlcnR5W2ldWzBd
LCB0LQ0KPiA+bmFtZSkgew0KPiArCQkJCXhlX2Zvcl9lYWNoX2d0KGZkLCBndCkgew0KPiArCQkJ
CQlndF9mZCA9IHhlX3N5c2ZzX2d0X29wZW4oZmQsIGd0KTsNCj4gKwkJCQkJaWd0X3JlcXVpcmUo
Z3RfZmQgIT0gLTEpOw0KPiArCQkJCQllbmdpbmVzX2ZkID0gb3BlbmF0KGd0X2ZkLCAiZW5naW5l
cyIsDQo+IE9fUkRPTkxZKTsNCj4gKwkJCQkJaWd0X3JlcXVpcmUoZW5naW5lc19mZCAhPSAtMSk7
DQo+ICsJCQkJCWlndF9zeXNmc19lbmdpbmVzKGZkLCBlbmdpbmVzX2ZkLCBndCwgMSwNCj4gcHJv
cGVydHlbaV0sDQo+ICsNCj4gCSB0LT5mbik7DQo+ICsJCQkJCWNsb3NlKGVuZ2luZXNfZmQpOw0K
PiArCQkJCQljbG9zZShndF9mZCk7DQo+ICsJCQkJfQ0KPiArCQkJfQ0KPiArCQl9DQo+ICsJfQ0K
PiArCWlndF9maXh0dXJlIHsNCj4gKwkJZHJtX2Nsb3NlX2RyaXZlcihmZCk7DQo+ICsJfQ0KPiAr
fQ0KPiArDQo+ICsNCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL21lc29uLmJ1aWxkIGIvdGVzdHMvbWVz
b24uYnVpbGQgaW5kZXggZTVkODg1MmYzLi42MmJkZTM1M2INCj4gMTAwNjQ0DQo+IC0tLSBhL3Rl
c3RzL21lc29uLmJ1aWxkDQo+ICsrKyBiL3Rlc3RzL21lc29uLmJ1aWxkDQo+IEBAIC0zMTYsNiAr
MzE2LDcgQEAgaW50ZWxfeGVfcHJvZ3MgPSBbDQo+ICAJJ3hlX3N5c2ZzX2RlZmF1bHRzJywNCj4g
IAkneGVfc3lzZnNfcHJlZW1wdF90aW1lb3V0JywNCj4gIAkneGVfc3lzZnNfc2NoZWR1bGVyJywN
Cj4gKyAgICAgICAgJ3hlX3N5c2ZzX3RpbWVzbGljZV9kdXJhdGlvbicsDQo+ICBdDQo+IA0KPiAg
aW50ZWxfeGVfZXVkZWJ1Z19wcm9ncyA9IFsNCj4gLS0NCj4gMi4yNS4xDQoNCg==
