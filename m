Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ECDC02195
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 08:52:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5364910E3F5;
	Mon,  3 Feb 2025 08:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifn0p+p3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C5510E3F5
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 08:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738572734; x=1770108734;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZpAFhLs7085rBfjSp5O8kG8FnqcEopy1wKBj8qaUMS8=;
 b=ifn0p+p3okrwHizWKtj6h/GuCc+roHwvKKaVcDTOvb9Gj5OMLPIme0SB
 qTruCesERi3cJssWBD+zFfhOM+6VnGiAcqv6DYCbV30VXpLPX5XlvdJl0
 a5eXw+PDIjbF23AJTLwz5vF3a2L+WLWxJjrfJF8B5AQC+TRuiH5SalwI+
 lG0z5QP1IZdJjgctqSeLS6iwptOPMi3WjXPOYiK6viGyhx7/msS7Y8XOi
 EZEMZuf5a2GE0aDQnJXfOGwAT9cKI2ulLZToZto/z+n6qx5TJ9LTJwN3i
 c3+uJuSQ5YbgJ0fL2QxqeqX14Eh9w0uV9+Mr0JMx529nUTnhUPUYwIuxd A==;
X-CSE-ConnectionGUID: w0CFiwkQS8+4R/MWQvQu7g==
X-CSE-MsgGUID: XPTFx3P/QVirWYmBsRc3gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38961755"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="38961755"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 00:52:13 -0800
X-CSE-ConnectionGUID: wKMpZkVJTgucGBnFOAk3Eg==
X-CSE-MsgGUID: 7Y1tA3y3ROizouOKGG5+mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147431333"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 00:52:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 00:52:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 00:52:13 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 00:52:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0Za13zmKFgf28CWAl4gzOsfoWNrYVHuvqeSiWGJlYX6GkYUNOfES8hBMrsErD7z7sTo2HcAsiZvrYlSkKerPszAfRpsFTBy/0Cr4hhmPoGxN3ar7bF2ThPbHQ++ddg7u29QlC2+78dvLMSoZuq/a0dBB21SSjRqCzPFj7O+4vnzp2rxK7vRhC98yvTSeStx3sDuENRAF8xI7CFD3GyFq8lZdrebV0Ri+xcKQDBzXAfwMcEj3UvqF3duoDZePOCQFY2BQzeYIWFOFXfsOBYok+Un9WDrtlvEapm9fUp3ui+MuQiaNoLvuV0Sa29mvl6qgMPm+lOTWnVE0nhVB9oCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpAFhLs7085rBfjSp5O8kG8FnqcEopy1wKBj8qaUMS8=;
 b=DZlGyp5EY/Zw56JHxpiS9Qqzjev4L7aO3zsAsBK9BxFzObuOsDcU6Fj6EA/2oJ81JVOsbagSs0864GoU2+jnQO6K0UMTYw+wxFKRkx4Fbw8MGwxAowIaZW7W7stYupRTolxd5DKRCU4JT0Wcdr39bIP4jCEAzLePFK3nplcS7lxXb+Q3YSIUA885F5H5zuBAe+sQGWB6oomiU2pcDr/VRhuGqHMvKUem58Sa4L3jxrkeeZLCef4Zc9g/qH7yW+Y5SVUfwF3rqNKTPaWmfaZ5fHRId/lpnTJbp/5b9RpYlj/s0KUNQhBJddlzxP0LvNhdBV5L0UoHxf6MOEfclxdyzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5686.namprd11.prod.outlook.com (2603:10b6:8:21::11) by
 DS7PR11MB6038.namprd11.prod.outlook.com (2603:10b6:8:75::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.23; Mon, 3 Feb 2025 08:52:11 +0000
Received: from DM8PR11MB5686.namprd11.prod.outlook.com
 ([fe80::164e:21c2:c4f6:7379]) by DM8PR11MB5686.namprd11.prod.outlook.com
 ([fe80::164e:21c2:c4f6:7379%4]) with mapi id 15.20.8398.020; Mon, 3 Feb 2025
 08:52:11 +0000
From: "Tahvanainen, Jari" <jari.tahvanainen@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_test_config.json: Add GPU excluded
 platform category
Thread-Topic: [PATCH i-g-t] tests/intel/kms_test_config.json: Add GPU excluded
 platform category
Thread-Index: AQHbde79xKI9V1SY8kiIvIbq2w76hLM1RaoQ
Date: Mon, 3 Feb 2025 08:52:11 +0000
Message-ID: <DM8PR11MB5686B7A5CA4056399E3A234498F52@DM8PR11MB5686.namprd11.prod.outlook.com>
References: <20250203034826.28283-1-karthik.b.s@intel.com>
In-Reply-To: <20250203034826.28283-1-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5686:EE_|DS7PR11MB6038:EE_
x-ms-office365-filtering-correlation-id: a684acfa-63b3-4fca-fccc-08dd44300c63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Rkl4RityZ09rQ3RrM1E2MnAwajJ6UFVYTXRVZ3NxQ0pIQlkwYjJES1dyL3hk?=
 =?utf-8?B?cnVYY3RkZEtIK0dRZ2xVejBRM1BYQU50U0prV2NMRWpySEYwWC9leGFOUVBF?=
 =?utf-8?B?dDdkV2NuTW5OR2xDNDg3TkxZeDVGeU90VVZnSm9IcmdSQVZQYUJVOWd3TUFa?=
 =?utf-8?B?NURUVWYvTUg3Y3VpVjV6OU1KRDRXRlZ3aTJQcE9Yc3FnOXJYREhCOHJnRmdW?=
 =?utf-8?B?dnJ4THVYQWc0dHlBb1pwS09zdWR5UXpCajJZcXVBRUljU0czbVkwSEo4SnNC?=
 =?utf-8?B?V01NNUJoK0MwTUVLSXU0cXVRRGZMVVpwSmt6aUQrZTlsaERzeXFac3ZIUFVS?=
 =?utf-8?B?aEE5WjlEcTJWcmpZR1A1SHd4Q0I4VGpRS0hsbDhOTFJqZ09CR3VpZTBHd2tw?=
 =?utf-8?B?eU0zR21NTjc0WkxQaVBWVnVvcW1PMElCaVdHNGg3cTR0OVBkMlpQOUdBS21B?=
 =?utf-8?B?SVk0OWhYYWtTL1Uxb0d3em80b1g3TkJCNkZxelhXTWRWamYrT2RrbzZOcnlO?=
 =?utf-8?B?aFFoUVdudTBSd2FnU29tSFZmOUFEWEt1dHo3V2U3S3kvZSsrREVMbnpocEo3?=
 =?utf-8?B?WHA1WElaMmJkZDkvNm5yN3hYeVZHYkNlS3EwUXd2MmxTMmdvY2RrNUdpRnJV?=
 =?utf-8?B?dXV3SWw0TGdCWEdtcXA1bEV1dEtldGdaN3FFc0Z1YldDbTRWZmJrMC9qQkJV?=
 =?utf-8?B?STMyTDdaemlIOXlZbmdFU0pOblVsL0lhSDlIOWtpNGZ0U0N5S1U3QVBXdzRo?=
 =?utf-8?B?U2oyd3g2ZmJlK0gwQlBMNTdWZTlRaXFEQUJDY01Md21uYlNQMW4xdUc1Z3FM?=
 =?utf-8?B?aTIvNDU5dUtwdi9PU1BLMm1UVi9xNUFIdnFMZEdRL0U5bFlDeHprYm1uU0N6?=
 =?utf-8?B?UDlyZWpjNVp0aGdEYmhySUdaa2tlZWRxNlBkV3VvYWpOeHIxeExXazhjNHdi?=
 =?utf-8?B?WlBYOGErMGpoVGROazJ6d1Exd05ScTdIRENycWNlUjdQaW5YaW14OStUVUpQ?=
 =?utf-8?B?b2k2aTA5Y0tLNXdJcEtRbWpBbXVmVUN6QnFjcVNna1JRV2xPOTV4RVM1WlBJ?=
 =?utf-8?B?R3lDd01RUEsxVGFXT0hlZk54bHJhZmNzdFV2dzROcHJZa0x6by9QUHpzLzVQ?=
 =?utf-8?B?VVVyNTF3RW0rT0dQTUdzSklTODFtQk9wTWpaVFpoS0k5WHpRa0YzYW5YUXRl?=
 =?utf-8?B?YU1zZlpLWUdUbXVqUDd3N2ZkcU1sWS9qRHU1WDhjZHVRQnNuR01iUHQxZ0tt?=
 =?utf-8?B?WCt2Nk5VN1JkTFgzZUt6dWZyQlpic203RGY3SGY0MmFnVk92bG9qTUpJY0ti?=
 =?utf-8?B?ek9oSzE1WUtXWXl1K0RYUDB4VlE4RHZCS1FYYXV0dzR4TDR1UHpwdDdtTVNq?=
 =?utf-8?B?MlNSb0VTSFBpYWZUeERnVks1cHRmN2ZXQlVTOXNtMDJxRUxMdWVpcm9BWXNZ?=
 =?utf-8?B?UEhpVEMzUlRnNFRBZDdMRDBHTEFmdTBnMzNnbGZQaTFsR1gvT083NVhyWDhN?=
 =?utf-8?B?NFEzOEdWMmp5MXVDZ0Q1VTZiN1BRMk1HdGtsUG8xNmJ0VDVTOVpZVmlpcTZ2?=
 =?utf-8?B?OW9FYXN1YUVBWWZmNHkzS0hQTEJRNzQ3dytLZy96Z0RpMEYvOGVmMU9TVFoy?=
 =?utf-8?B?Nmo3ZzdxV0czRk96OUZJc3lnMGxaRlhaYjVJSmE3MEZrN0Z0M0U3UmtlWjA1?=
 =?utf-8?B?VndDKzNvZUtIdHAySzUvY1hFUjBrTHBtUU9RMmFrL0VJOUlBdVYzUFJlVzVR?=
 =?utf-8?B?LzZxMXNqaHZOUUMwQUwzejF5cGZrY0NSSDQ4QjVVa0tYeDRpc3owUktHbUtU?=
 =?utf-8?B?d1U2UUhneUp6UlphK2VBRUJVejNTRVJ2MDdkVDlJRTExSkpHa2NYSFNvNmY4?=
 =?utf-8?B?cmlwb3pIREpaYVUvVHUvVXpYNkNuVVc2ODAzTnFDNW5OWHFaWFk4bjYxcXdN?=
 =?utf-8?Q?0znoWIHfKhDWvpD5Gpabr9mP+OAeFim3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5686.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTQvUUxuZnpmN014RzFEQXNoU2VHUTRQZXVES0xlUzB0amVwMWpiN0J3c0kv?=
 =?utf-8?B?Z0RReDh3bURrWStSaVhhNC9IMk13ZHYydURPa09Cc3NZa0ZxTGxNaFJPQlFJ?=
 =?utf-8?B?NzUzZzNoT3JXOVpubFpkclB3MGtGNXprdVNCL1oxLzBMS0x1Z080aEZZbWRV?=
 =?utf-8?B?M2Y4V3ZmZFBoVWYzSVpoeGN0OVBMZ29zcUlvbFpmWDBsaGFnY1NFLzdsT1l3?=
 =?utf-8?B?UWhtOTBuRjFDZURSWE4yVHhUcFo3TzBIam9WeFZybTJNYVN6K1lZNUkwMzhx?=
 =?utf-8?B?WG1UdHpBSm1YanBKSFF3b3BmMjI1U0Jyb2x5Wm91QVRLejZpTnBieU1PWUhM?=
 =?utf-8?B?bmd5MEtWQ3NMSms4bWxiUTMzcnpsV2dvc0dSRis0bTBoblJwSTVodkRaYmVj?=
 =?utf-8?B?OG15T09MWU5HbTBPY1hyeER0QVg3aUVzd3FhekkrWmtoY0YrZEJKVWpOQno5?=
 =?utf-8?B?cXlKeG5EVi9KZmUweXNyQXkxbFNsQXFmTzRlN2pUS2c2UWRpNmV2ZHpKTzNQ?=
 =?utf-8?B?ODNiNlQ2V2N5Zm8xWDVzWWUxY2ZTMG1YdTBJT29qSGExMk9rYzVGOWQzRUow?=
 =?utf-8?B?RVNOSTliM2VLd3YwTlQzYUwrc0FEZUE4ZW9veGJzLzdlUzkycDhZYU5hSy9M?=
 =?utf-8?B?eEpkYVZ6YVhkY1M2dE5TdVRPemNMLzhxWkNXazIrTTd1N2ZDaVJwMGdNZkc2?=
 =?utf-8?B?WFVpazlVZ2k5cEVKWWtRVkU0Rk1qaklncFBYMGJqZzVwNko0SXZYT1MzS29H?=
 =?utf-8?B?N2JXSS9YN3dUR09nSVRrYzF1TzRtcEJkVm5xYi9BeDNlaXNQQ3djRkdKZjNZ?=
 =?utf-8?B?QmJyZ29jSm1FMFVKS3hJMjhBalEzVVplaWFJc0FvQjByd1JLZGxJM2o0TWJ6?=
 =?utf-8?B?Mjg3azNPZEE2RFIycG16VXV0WkN1S29TNVM0SlQzVS91ek1OWmR4ZE5Ya2Fr?=
 =?utf-8?B?eFBJM01aeHozUnR2N2RpdVFRa0w1NVFINW5FOGxrQjN1ZFNiaHhSdFlHM003?=
 =?utf-8?B?VUV3S2FucDg0QVF1R3I4Zzg0Ui9iNkNQWG5MZW5NOTZlU1VlVVpTVks3RVdF?=
 =?utf-8?B?NWZIU1lpTENsWGEvK3g4a1VkbjluNzZkMnR4SEpPMHI1Q0dMaVpsOUhIa3ht?=
 =?utf-8?B?RGk2OUF5bjJPQ0RiWDhWejZZT0xHLzdwSS9oNnJIanR2RFJQcFlmVzYyZHZX?=
 =?utf-8?B?R1pQbnpkU1lReDg2a3hDTThyQnJZTXNOUCt5NG9ZcUh3dE5Nc3o5Tjh1WjU5?=
 =?utf-8?B?aVBOeFlVbzFBUm95ZnBrUkhPbDI5TzNQS3RMVS8xR0V2WG1kaytjSlVBaUhn?=
 =?utf-8?B?cWdnNjZYejV6ck5UMnlJZ2NYcjNiNTBOa3dqbnNTOWphRFJHRlVzM1pMMTJq?=
 =?utf-8?B?cU1CQnNGWW0reWR6WXRnMFVEampoYWRIalBxSVUrQXl1TG44N1NFQ0JXMzdw?=
 =?utf-8?B?aTdZOEYrZFBUeTA4eTZHcHY5cys5c0hVUWVIUi82ZDM4Z2Y5WU1zZ1hGSXNp?=
 =?utf-8?B?blUzMzFDRFlXbzE4MzJlQjYyY1ZCZllCUmRIR2FTWU9YclhJVncwQUgzSDAr?=
 =?utf-8?B?dWFubGpwTE0zcFRTQkZnWmI0a0VNYzVYeml2Zmdic2FFNFBqNFRyenR2RFlX?=
 =?utf-8?B?eGdnU0RjTjFFSGhYV2RSclIxNGRRU3RaSUNQUGVlaEd0b3BkNjNSKzVJK3Qy?=
 =?utf-8?B?dTVwUmV0TTZDWWM1cVJxcTh2cTV1WXBXSUtMWjNvSTZ1Y0lnbmFmbTE2ZWN6?=
 =?utf-8?B?VTlhaEFpV1UzdzRjNno0eXB0RExHdGhrR282bkpFMk5lK21TYTFld1VNWkdQ?=
 =?utf-8?B?Mk1ZQWdlalFsNnJseEgxcGtrcjdPYzJlblBMUUdNVVRuQ3piL0RlRnlDWnhj?=
 =?utf-8?B?R21JYTBFL1FIekZZRjZ6TWcvZm5lZmxsTTZHMjJFNVVpbjM5bE1QYXVibTNS?=
 =?utf-8?B?cUtSTzhQdEp3aE5CbkVobGxaUmVBQUtCQmFzRFd4Z2F4UmpRTzc2eGtudkpQ?=
 =?utf-8?B?WXVCVThTQ2M4dHB3SHN5WWdJVDFKY3M5ZXNRMjNoTmt5NG1qdWJWcDBHVmxG?=
 =?utf-8?B?U0ttOVArS3R2ZGRWRFd2MVg0RVJSZWNnMEdGcmtGUjJ0ZTBuWFFoL2o1MWZz?=
 =?utf-8?Q?Izfb1eauSB6+fW7yW40zUb7ys?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5686.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a684acfa-63b3-4fca-fccc-08dd44300c63
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 08:52:11.3216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wfRLw2D7EpemB3pAwgSqvEFq6OCe69r4VBbgrHInD1iglyUv0BAdxzrz8Lwuqu8oPN5lCrusVmlwY/v8ISfDUXjc/Gn/sUH3wA6t7LsXpfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6038
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCIFMsIEthcnRoaWsgPGthcnRo
aWsuYi5zQGludGVsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAzLCAyMDI1IDU6NDgg
QU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBUYWh2YW5haW5l
biwgSmFyaSA8amFyaS50YWh2YW5haW5lbkBpbnRlbC5jb20+OyBKb3NoaSwgS3VuYWwxDQo+IDxr
dW5hbDEuam9zaGlAaW50ZWwuY29tPjsgQiBTLCBLYXJ0aGlrIDxrYXJ0aGlrLmIuc0BpbnRlbC5j
b20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdF0gdGVzdHMvaW50ZWwva21zX3Rlc3RfY29uZmln
Lmpzb246IEFkZCBHUFUgZXhjbHVkZWQNCj4gcGxhdGZvcm0gY2F0ZWdvcnkNCj4gDQo+IFRoaXMg
Y2F0ZWdvcnkgcHJvdmlkZXMgYSBsaXN0IG9mIEdQVXMgbm90IGNhcGFibGUgb2YgcnVubmluZyB0
aGUgdGVzdC9zdWJ0ZXN0cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEthcnRoaWsgQiBTIDxrYXJ0
aGlrLmIuc0BpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBKYXJpIFRhaHZhbmFpbmVuIDxqYXJp
LnRhaHZhbmFpbmVuQGludGVsLmNvbT4NCg0KTm93IGttc190ZXN0X2NvbmZpZyBpcyBhbGlnbmVk
IG9uIHRoaXMgd2l0aCB4ZV90ZXN0X2NvbmZpZy4gTm8gY2hhbmdlIG9uIGJlaGF2aW91ciB3aXRo
IHNjcmlwdHMvaWd0X2RvYy5weSB5ZXQgYXMgb25lIGRvZXMgbm90IGhhdmUgYW55IGJsb2NrbGlz
dHMgZGVmaW5lZC4NCg0KQnIsIEphcmkNCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC9rbXNfdGVzdF9j
b25maWcuanNvbiB8IDUgKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9rbXNfdGVzdF9jb25maWcuanNvbg0KPiBi
L3Rlc3RzL2ludGVsL2ttc190ZXN0X2NvbmZpZy5qc29uDQo+IGluZGV4IDc4ODZiNmY1OC4uZTEx
YzdmNGZlIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC9rbXNfdGVzdF9jb25maWcuanNvbg0K
PiArKysgYi90ZXN0cy9pbnRlbC9rbXNfdGVzdF9jb25maWcuanNvbg0KPiBAQCAtNTIsNiArNTIs
MTEgQEANCj4gICAgICAgICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiRGVmaW5lcyB0aGUgdGVz
dCBjYXRlZ29yeS4gVXN1YWxseSB1c2VkIGF0IHN1YnRlc3QNCj4gbGV2ZWwuIg0KPiAgICAgICAg
ICAgICAgfQ0KPiAgICAgICAgICB9LA0KPiArCSJHUFUgZXhjbHVkZWQgcGxhdGZvcm0iOiB7DQo+
ICsJICAgICJfcHJvcGVydGllc18iOiB7DQo+ICsJCSJkZXNjcmlwdGlvbiI6ICJQcm92aWRlcyBh
IGxpc3Qgb2YgR1BVcyBub3QgY2FwYWJsZSBvZiBydW5uaW5nDQo+IHRoZSBzdWJ0ZXN0IChvciB0
aGUgdGVzdCBhcyBhIHdob2xlKS4iDQo+ICsJICAgIH0NCj4gKwl9LA0KPiAgICAgICAgICAiRGVz
Y3JpcHRpb24iOiB7DQo+ICAgICAgICAgICAgICAiX3Byb3BlcnRpZXNfIjogew0KPiAgICAgICAg
ICAgICAgICAgICJkZXNjcmlwdGlvbiI6ICJQcm92aWRlcyBhIGRlc2NyaXB0aW9uIGZvciB0aGUg
dGVzdC9zdWJ0ZXN0LiINCj4gLS0NCj4gMi4zOS4xDQoNCg==
