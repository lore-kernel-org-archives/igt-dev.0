Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D622B606A331
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 08:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F/UQujrl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F1C10FAB0;
	Thu, 12 Nov 2026 08:23:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFB910FA0E
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 08:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794471779; x=1826007779;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=5uOk96/5s46CcyGyO25x/zeGhCNVsPNdz/ZGxisWOoE=;
 b=F/UQujrlIXuTpF7vlwljqa16kO8tjqEgIPjIF7DcoCrdXoS7KCX96XbB
 9Uv9350PingXNXkjTOuubGfDPApTdBf7M7eA+Z2sRiBkzF02yi4YXkoJ/
 Bg4WiUw6+xTw52eONPFa8WHYUgNI+pKYhN/mh+a81JDK38SaiFnQMKVMG
 pG9zwu5eNUFjOFJSXuyrmDM2fmB2qE5z7yM3zzFEbiS0PkWa/WTKTXy7k
 Qg89iTHZUXzmvd+OFtrifUacNv2X0+DYYoqHKca9Wi+YqnbktU3HVmDqS
 Ub/mFFDzhUV4k4ZkoaPbGD7btJt/snWAmazL9CrAOGthzR4xmJrgK68Tf Q==;
X-CSE-ConnectionGUID: noIKh8v2SXKfNT/MrFDgdA==
X-CSE-MsgGUID: OkAFxUEKRyS7nsY370X6Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3133221"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3133221"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 00:22:59 -0800
X-CSE-ConnectionGUID: reMhMdZzTnOGmRzoaum46w==
X-CSE-MsgGUID: k/OJjNpCQo6RpAMBQlCo1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8761634"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 00:22:58 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 00:22:58 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 00:22:58 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 00:22:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQ9xBO49Gx1fiLu3L4jjq3yevA6DmPoPVwDaI21iquYvTQfHrLiOlJWslyqDVgBcfdbxymrsOBdsfRi8aQK3S4RoDmXwTxIlxTjPpGxhkiYiU7hMbRa1R8zgOGqRzAO165lUR3KToXZq3SPqo/LJD0umzeRY/ECaCCjKNIKs4oLYqkXYvWbngABD9UPkxqwtd221/jwz0aFX8eSefUMWL98uaY4Zb08wN8Q5K1bi7E3+rGvAdsbbzY1TwHb+Oupf0GcoN+LICuVmVaWMuE3dAa17Uh9EpJoRbCweKdRgPnIMDPx4MQSYiVOIJea7jyr3sZAXlE1rEpmtrTTxVGmAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uOk96/5s46CcyGyO25x/zeGhCNVsPNdz/ZGxisWOoE=;
 b=G9Cn+yJPtqjL/QnJOr5y9LBJ11e0uqxtIDSlwxHduY1cObyCnjo64AAagmISU+LgFaV17ZwOZFeNHnZuYKL48Sq8XTMk907/ZiwzvyCO3N94oda9XJnQox/ZbR8Z/3qez22hPDATdXqYXbwcNwlVz7VvQqc1tG0rHe8hYfxRhJlQKUFzwHktsADMjquIw7Z3ZECGIZdkdQZYHFDih0FVppkqxOiPJjuGostcFo2co1HxsjVPGmcBOmIo+U/kHTZr78lWXcXe2zgdmFSdN0fP2uONXWs4Lnu8uu0u+sfNyo+963kVsRvT8JOBfGQqVqsgkrkgjCJ5rfyKpeNSS+5ecA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by DS4PPFCECA32305.namprd11.prod.outlook.com (2603:10b6:f:fc02::51)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 08:21:19 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b%6]) with mapi id 15.21.0592.010; Thu, 12 Nov 2026
 08:21:19 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kahola, 
 Mika" <mika.kahola@intel.com>
Subject: Re: [PATCH i-g-t v2 0/3] tests/intel: validate PSR2 selective fetch
 under joiner
Thread-Topic: [PATCH i-g-t v2 0/3] tests/intel: validate PSR2 selective fetch
 under joiner
Thread-Index: AQHdbF2uhxWc9/t09UupyB2yYLyFgLcqJNiA
Date: Thu, 12 Nov 2026 08:21:18 +0000
Message-ID: <7e10f85919c96d64bdbd5ceac032c52cc7829539.camel@intel.com>
References: <20261104130737.2549248-1-mika.kahola@intel.com>
In-Reply-To: <20261104130737.2549248-1-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR11MB6024:EE_|DS4PPFCECA32305:EE_
x-ms-office365-filtering-correlation-id: 3c1b9e46-fe97-46ab-dff8-08df4095ed93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|261009223027099003|3023799007|11063799006|56012099006|261102123227099003|261021123027099003|261021121427099003|38070700021|10067099003;
x-microsoft-antispam-message-info: WKZAD8wXm54tYET+nrTM0fOxVLZ5WmE1vNT2qyVvbb/k8RxxyvV/NFK4FuYFDOspKMDGp6XynwAIF/XjpxmDZJdlwtmjxGUJ/col6nRuhlpfkDmhThTfPt5BlX/u/BPeo9mXtAmc3t8a8wYPbzjFvK1mxqeEzMTtquv2NDFw/Ah4O+4goxFQGpn7Far0CnUG6E/ThIARLBnMl1a9yL56MDQF7CT+s+4m6KOS5FdQJfNmXNGu5erOqcRHzPnqoaVcjynoRg86R5pYCsbe/CXhFMpQy8UXpGqMBaZegW0EJkEFaJ48irEtxz6VyOiT1mSP05OaQpcf/9eVvd/PT7HmsU7GwpWV3mDRTgyDWxGZ0GSF6jzW2nYAFIj5j4230w0EzdGBM2hPRMq7jBn5PEaM1Lp8LFMHJoh4FwhVazAJWjDbONWj5ADoabrn6kF1wTixssbOyTrDXGDgrOxYW6iHHxjlyHyouk9O1X0fmEe06aPTSZ5B+5YsLdDiDoZkrd5UkIpB1swWe0sa0kKY04YYpPUwpttvEnwjiO/9cImW0jOoGe+KNhN4EMALWO3YrFcQfZSG+28xM4t6i5WSSPGFClJ0yy/9o9PdD1VMzWXPLZRtH0n/l0MTDsNwvrQA5OsscMQ2YinkVbZPuJDiaJpeBOx30vSANKfDa9tuv6Z9uPceOF1fdNdJHW3tBckYobFf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261102123227099003)(261021123027099003)(261021121427099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHlGaERaVnlkYkN1eGZGc1Nidm1yZFJvN1IxZ1lwQU5OUGJxTitNVDZpcjJ6?=
 =?utf-8?B?RlBUTnhVbGlZZ0Z1VEtrV3B6M0kzRHpKM3J3K2NkemJlVW5SVFRMV0M4YzNl?=
 =?utf-8?B?UE5IQ2Yrd1NmV0kwZ2FGZXNMVkh5b3dORnJ5ZFpFNFhldWdVRmhoakdsUGEx?=
 =?utf-8?B?M1Q5Vjh1cTd5R2J6eUlGY3d1SE1BQk5OdWhtLzB4QVJBdFJyQnFpTzhaOVN4?=
 =?utf-8?B?ZlphQkFLSmRXc0ZzTFFXbzZ6NlN1VENHQW42R3FsS2RZQ09HeWZxc2x3VUhX?=
 =?utf-8?B?MVl3MDhLWU85MFBkQ0JVQW0vOCtMYXJMdHdaeE1DRDZLdk81TTk1UitUUFY4?=
 =?utf-8?B?dGRYYVZrY1RITFFMYnplbzBENW50bjUrcTZwK005MmtIMFIvbHdzOVdvUm40?=
 =?utf-8?B?WjlKS2dGSzZQVnJEbHE3SEQ3cCtZRDZ2YlZiQWI5UkJxNjBkcVpmdFlPVzFU?=
 =?utf-8?B?c2szSkZTdkF2RHA5M09teXQvWWxISEMvRmZaL2hTcTk0VnQ3a1ZEUnRLdFFW?=
 =?utf-8?B?TmErYWRnMC96L08wUVBtTmRlR1dLQmJHeUxHeXVwTWcwazBWU2VMOWlCYzAr?=
 =?utf-8?B?WjE4TU5Qd1JoekdIWnc5bzhFd0lmZDM2TXNDeUdIN1FxT3c5SGdWcG5JNW8y?=
 =?utf-8?B?aTUreWdtOUFRc0pMKzZYY2ZhbFpMWHRyY0xmeWgyYXJ5VXZqLzhiR2VjYnBz?=
 =?utf-8?B?Z0lidysrMFg0anRQWTBKTkx3eGtkLys0eDdUTVRBZGRRN0ZDb2pVSXR1VU16?=
 =?utf-8?B?bVpCVVhhWHdQMmlXdXczdUJXcW5EMUM0M0ZqOXdCUERPbDZrVzhwc1l1bHZk?=
 =?utf-8?B?dHVCZTl0ZEw5cjltUml1eFRha3BobjRMMW1zTFFtY3d1cTh1WmxwR2NmT2NE?=
 =?utf-8?B?YStXRFIzOEREL0x0T2xBbWxhODRVUm1Qd0FQc3ErQUI5RCtrbEtUd0ZJSnBU?=
 =?utf-8?B?OHdiaFQ2ZGV3RTIvQm93M2VaT2pTTGNQNUFndXZ6eHAwR3dFWjNseXdmNlRn?=
 =?utf-8?B?aUZBLy9XMmh3UlIxYkpmeC9yeUQwRTdNT0hFcGxmZmRYajJ6RDJxemVxZDNr?=
 =?utf-8?B?NE53MlV2RVNOcVZFaW9Pb1d3VVErYS9jcmh2bW5UUFdlYVJmQTc1c3Y1ejg4?=
 =?utf-8?B?bDZHUnVzbWE3RFltWUtoWTRkVTdNQUlBWmllbWc1MUQwaFlsM1IxNUhLS01h?=
 =?utf-8?B?dE9US3hydUI1dERPRUdLWHFVQ1djZGFkT3hOem5DM0hPSUNyWjdEVmlGQlVn?=
 =?utf-8?B?TjdZRjJKVXJOeElKdWRtNjg4Snc1UTNDRDRkRzV5dStsVWR6VHdiZDBwbU5G?=
 =?utf-8?B?bEZNU1Jha2dIenFjL2lJdHRNZkNBRXUxbDdtbGlkSWhpNHI3WW9mMm9zVCs3?=
 =?utf-8?B?bDZKcklJQmdFM0RYN2U1cTVJNHVLcHNUeVhRd3plS04xU3l2R2EwVnNrUlIx?=
 =?utf-8?B?R201QlJ4V3p5MGJpSEd5ZUw5TDY1OWVxY2F0RXBqYlp1SUpXRFV1UXFHQ3Vy?=
 =?utf-8?B?RSs3S3pkRG1nY2lwNzhSd2xmZXJmbFM3MkVGUExNNm5DZ09RYVY3Ujc5aWlx?=
 =?utf-8?B?VEd3TDkxWENaVjhHNEY1a2tURTR3elp2Y0VVK0kvVUlhWVNNMEw2bkYrRzdP?=
 =?utf-8?B?dGdBby9uZGtYdUduZExoWUp2WnBKTzZidFpXeTBEeSsvTUZzUlpKMVh4SFJo?=
 =?utf-8?B?R3lFNW10K1dWNFh0cEhCNjM3RHZHYXcyY2pkMnp2WGxiTnJYVHhabmlYbm5z?=
 =?utf-8?B?bkNLUFdFdWJjQ0Z0YkczajNaeGROa215OEtRUFpCK05BWFpQd09qaFcxbHBp?=
 =?utf-8?B?dzFsKzB5ekh6QnhGZklqOGRZS051QUJJNGx3c3dvS1FnZWxZSUhmK2NDVjFP?=
 =?utf-8?B?K2QvVDh1OVlBRG5YR3h2R2tXVnRuOFk3YnVSWFpEcVdoNENJUjhBNUJ2bjdP?=
 =?utf-8?B?MWJ5SVlqMnM0a29JRUJKMnNYdkdQdkxiM0FNSHJ4TWQvZndYVnQyQXBuMlg0?=
 =?utf-8?B?NWUxbXRlMFpOUi84UytwcHhzY1FQTm5hRzJuVlZMeFFiZ3RjYVE5YW0xYlMx?=
 =?utf-8?B?K3lDU2gvbWI5QzBUS0I4bjBYOUFuVFcxRGlhQXBLRU45YnozcHVlcVRQcDh6?=
 =?utf-8?B?eUlNNWtCcTE5bDdTNFNhSVpwdi9ONjBIdXFQRmxlWHRlVER3cHlTOWlwSUJ0?=
 =?utf-8?B?YTB5RkxjdGdma1ArcHNxOEl0U3pqOGlobDZaS3I3dUlWZzFWUFp6ak02VXAz?=
 =?utf-8?B?ejBsdFc4UGgzV1VHNDEyN3Y5Z1BoN09SZVk4eDBXZEJtY2d6VDQ2Snp5YTlT?=
 =?utf-8?B?UVdyS3BXV0N3cmVwYUM4NGxuVjVLK3VGNkUrM05nWlpSZHNGT1ZMVnRNM3dL?=
 =?utf-8?Q?qMB7k6KFGm5NyeMg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <361EF852C93445449EB7AD2108DA4F79@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: K/+p5sY6jRCz3LlAk8TpNHb0pVZsDlY4qP8yG9w332pHFx9qkKGlGADumb0t03Y/BIHzGDaclk2E1+eeDKZ1rKr3sgTf/Y3FuGUqQrdQfQGkk9BOFuVfYfNJPV+JVYg0j5HR4PvnqaPWIxx7jg0KlvtaonyCpnToQbgXdUs8KVDU6IpthLkJng1H5U/qocYlWoWGbeF4tzpatmM6u3QCellPyEpZYVPMGr0zG3wDPYZM0uzFp7O7wfcKXEdD1EtroOzLSiqG4ayTr3Bf6HQX1jxRlMRQyur4xyaMizRmCiPw2ODe/5YXH8JRtl+VgU9kwRUaHzYsZF0SJ8aYdUEcAA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1b9e46-fe97-46ab-dff8-08df4095ed93
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 08:21:18.9814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 39X1lae3dTfb9T6tYsdOXS/OTckAhBCyXu9nRR0y/1O3Yt5b23YL4V871gUSMZnP2dLBQcb/f40JgLCxXtM5D3xtLACRycrQMD4O4C5yuVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCECA32305
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCAyMDI2LTExLTA0IGF0IDEzOjA3ICswMDAwLCBNaWthIEthaG9sYSB3cm90ZToNCj4g
VGhpcyBpcyB0aGUgdjIgb2YgdGhlIHNlcmllcyBbMV0gd2l0aCB0aGUgZm9sbG93aW5nIHVwZGF0
ZXMNCj4gDQo+IC0gU2tpcCB0aGUgdGVzdCBpZiBqb2luZXIgaXMgbm90IHN1cHBvcnRlZCBvbiBl
RFAuDQoNCkNvbnNpZGVyIGFkZGluZyBvbmUgbW9yZSBwYXRjaCBpbnRvIHRoaXMgc2VyaWVzIGFk
ZGluZyBmb3JjaW5nIGpvaW5lcg0KaW50byBrbXNfcHNyMl9zZiBhcyBhICJjb2V4aXN0X2ZlYXR1
cmUiLg0KDQpCUiwNCkpvdW5pIEjDtmdhbmRlDQo+IA0KPiBbMV0NCj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvaWd0LWRldi8yMDI2MDkyMTEyNDQwOC4zNTg3NzQtMS1taWthLmthaG9sYUBpbnRl
bC5jb20vDQo+IA0KPiBNaWthIEthaG9sYSAoMyk6DQo+IMKgIHRlc3RzL2ludGVsL2ttc19qb2lu
ZXI6IFBhc3Mgb3V0cHV0IGFycmF5IGludG8gdGVzdF9zaW5nbGVfam9pbmVyKCkNCj4gwqAgdGVz
dHMvaW50ZWwva21zX2pvaW5lcjogQWRkIFBTUjIgc2VsZWN0aXZlIGZldGNoIHRlc3Qgd2l0aCBq
b2luZXINCj4gwqAgdGVzdHMvaW50ZWwva21zX3BzcjJfc2Y6IEhhbmRsZSB0aGUgam9pbmVyDQo+
IA0KPiDCoHRlc3RzL2ludGVsL2ttc19qb2luZXIuY8KgIHwgMTAxDQo+ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tDQo+IMKgdGVzdHMvaW50ZWwva21zX3BzcjJfc2YuYyB8
wqAgMjIgKysrKysrKysrDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxMTggaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkNCg==
