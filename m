Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF23CDE00D
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 14:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D9510EB73;
	Thu, 26 Sep 2024 14:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M5w9Ua3b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E19510EB81
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 14:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727362575; x=1758898575;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9uBwS26hPcoXDfhVnbv4oyR4qBweaf7FeVQxotyNVt0=;
 b=M5w9Ua3bdv/jVQ9XnbAFRsoNIVq0hw4kehPl/MJjs68f/QSOzr6YUNxj
 hAG/OvucHnYqdRdwOI2Ys7bO1MaNQwvINfPmuz9HZkI6lfcKo/Y2Xuogj
 SPS1uYLnqsIj19F9vkTITQNT5hq3CkRZNQgPKx96P/TQIY6HOLxKB9R/+
 izBdsFeuf65cTNw9PY0IkN7ECBwld8SfoCjEjiSzfSLewxJK+F8Y+BpXN
 6UqW1edGL9jpQIWffMADLVgLYal456pDfI61tSSxz8LuNOPl2hez8yYe2
 ST098rG1k3OnC/YtxcMPeRkR2c/FRGI/8sIITV0lcZcgymNkbrrOzlIWl Q==;
X-CSE-ConnectionGUID: lqoD9fDiQ4qnYPWIVy2NSw==
X-CSE-MsgGUID: ysJHvMstSb+RZ90NrZX/Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26329586"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="26329586"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 07:54:57 -0700
X-CSE-ConnectionGUID: u6emgUZFSo20wyDnWLLjjQ==
X-CSE-MsgGUID: lrOSJQKQQ4mQ+lyldi4eFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="72077896"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 07:54:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 07:54:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 07:54:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 07:54:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 07:54:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGrZ4tmFvAAEyMi108XhFesJ+tBp6D18vtAOuy0PFMjm2ZlMkXa0J+unaxnqYitQieNaT4EdUcs7yX/wnhmAnV2SNojqWj20+SYbNbmZH5LACXs+qNHBa7BazII6vvCAOdInv3UQLwBNE1IMNpGzXXxRkFwARayUGTntxc10JUl2sNcNZ0JMEEWwS4Muo1eYwXyWG/1/bFcZ+BrOXhCWMAMTQwU0cKvqi4BE0ZNVWJQZ77PXhuyJDXvr/xpij+XbFjW3LiO+XSTKX2vEzQy5Dt3ZLwsD021py4UZUG2ZuogITl6ngX5LRWbnqwNRxe0XnQw7lFyjdQYYRc8x5On8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uBwS26hPcoXDfhVnbv4oyR4qBweaf7FeVQxotyNVt0=;
 b=pnouqTBQdTbNin2X8OUfJ7aHHqxXz5bZC2WufXqEvXjaWUI54D2bvWwTUZKc9Tg8wZtIeucE7qmA0M5sEgW8VPNhbwI8nXHO8+iPus5I+GHeNT5gfHqAIFGqVvOZMsubIHsfPQoNngv/LLX2IpiyW2VPSPyAHn0G9Kj4B1jCFf+xdsuay+Q2XXK8bg14+UmYDMHC27HFRzUuVSIGAwF76rh/RaYS9PWLUm2/YJ8iXYOiXxq0HqA4gpeu8KNMmdOLGsjJ6D37rYmzoTIdzEOlNnCvK5ovbPfeAd0PC2DBSsjFoTN8hfPCnVAoObEM0SxADrFRyDd5bzsCfYAeZXo9cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by CY8PR11MB7058.namprd11.prod.outlook.com (2603:10b6:930:52::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21; Thu, 26 Sep
 2024 14:54:53 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%6]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 14:54:53 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Sikora, Pawel"
 <pawel.sikora@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/xe_eudebug: Introduce preempt_timeout
 helpers
Thread-Topic: [PATCH i-g-t 1/2] lib/xe_eudebug: Introduce preempt_timeout
 helpers
Thread-Index: AQHbEA5YjggghuQO2UiuR1HwQN9Xh7JqJ/eA
Date: Thu, 26 Sep 2024 14:54:53 +0000
Message-ID: <7a9f1171dbe6a0a4dd0398c95b34c3e69b221635.camel@intel.com>
References: <20240926121846.5885-1-dominik.karol.piatkowski@intel.com>
 <20240926121846.5885-2-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20240926121846.5885-2-dominik.karol.piatkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|CY8PR11MB7058:EE_
x-ms-office365-filtering-correlation-id: 5a3df67f-50f5-44fd-cb9f-08dcde3b2e08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZWxTWGkxN1Z1SGJBVHhwREUrQWJQOTMyWndYdXZ3MG9SUHBaMWJpSjBIZzBk?=
 =?utf-8?B?d0toQUw5SzdBVWswcG5zTlRmeXI4Z2xmTGt2K05DS0prbytuYmRrWGFvd09R?=
 =?utf-8?B?a2RQRGJoWGN6WUpuV1VIelVhRG9nS0ZqRHpDVDhDR3FxWk1BVHpnaWFmZGZx?=
 =?utf-8?B?cWM5T0hxVlQ4VkNGa1A2WlRXU3g1clppbzd4SC96bGRhWlpkZXJ6NDhGZXQ5?=
 =?utf-8?B?RS81amdlQVA4NnVxUHJVRnlNeW9vdmx1WkF5cXI2TGtkMzdORkUxbGVvcGZq?=
 =?utf-8?B?djFCaEdWMGhvWGtWZHF5cHpZWk5JN2JwUWZmZTFUZ01RZTJZTStTOExXSW01?=
 =?utf-8?B?OXM0K29uNXVJY0lLQ0k0SkY1bWtYNXYyS3NINHBDVmlKdFlWSmlPOEdXKzN1?=
 =?utf-8?B?Y1FiZGVKTmc2UTZrN1I0WXE5cTJ5ck9PMmZJN3NNTHN1Q2dMK2ZGUjRCaThV?=
 =?utf-8?B?S3A4b1U2eHQyU0hQK1I3VEpkV3dIbllWZmtscmxkbDAySEg4Vk5MODBET3JQ?=
 =?utf-8?B?MU13VkZYYSsrWU1MUkF2Y0pRK0ZDNjB6ZytEQnNtVlREenJLVzMzelkzcHEz?=
 =?utf-8?B?UTRkVmVCODcyMTV0TlY3aEhSaFp3N2prL3diVjJEN1JWWmpTV2lEdnp6aEhv?=
 =?utf-8?B?eW5SbS9jTmNiMEdScDRwSzdPY3NWK0tXYi8yTkl5UElvMUlxd2NpWkVRd3da?=
 =?utf-8?B?aTBXQ3h3bmpaT3BCR0drUzVkazdTQjhaeUg3bFd1d1EzRU9PU2ZkSm9GaE1h?=
 =?utf-8?B?VzBaL3MvNWI3K0gxblVLU0twajVzUy9iMnZuS29iKzRML1JYdEtDMEFSbmpJ?=
 =?utf-8?B?NUdSdjBVQkRBMGRUdk53WXd4SG1XVmY1cFJJUzZCTnpyUkwzcWFKWnNrOTky?=
 =?utf-8?B?MDV3NmVDRW9tOXloNWJtdE9iOXlHTTdselBHc1oyUDlhaG81SkFVSFZleFJP?=
 =?utf-8?B?bGVXem1qWDFZSzVMbzJIUzllMXMwb1B6V1VpdE9EbGVwQ2d3UWxOWDNFMGgv?=
 =?utf-8?B?bStOZkVuRmNueFIyMitrenYxd0FwQTgxVVRONlhnS1NkdDFsczh1aUpKZ0cr?=
 =?utf-8?B?Q210WlgwVWN2eTh2dDJHaDU0ZHUweGRQTko1ZTMxYm5mZFFJMFRwcnlGNWI2?=
 =?utf-8?B?bXllMmVPQUJJeFBzbVRYL2tqcHhuczN0anZnMnNWK2o5dk0vbS9vYkhKN1NB?=
 =?utf-8?B?ckRQT2xORy9LV1ZyVUppWVNMZytXbjBxY3hJWThiMlBzSE1rZUhBeWhGdXFp?=
 =?utf-8?B?d2tlKy8xWGNXUUxPTGdSdXkvNWxoUjh4ajM3Y3lhWFNWYlpSRktYS3dMTlJw?=
 =?utf-8?B?UVJFRWJiRUw4T25aRDEvY0VVOEVzT0FwUkczbWc1bkV1N2ZKdTlaSFEzRkNX?=
 =?utf-8?B?dTlKa0xLT3puakUxNWxUS2tNalBzZEpNanhxQ05yTkt1T2xMNFRzUzMwbGR4?=
 =?utf-8?B?cFlCb2xnQWplaVR6MUdiNWlCMStnM1ZtYXpUWnk0Y1VZOFlsWmlyVndHNk15?=
 =?utf-8?B?TFVFSXJjWWVUdG5oOFVWd1h4YnJHaGd2ckxadE9vZUlJTERGNnB3UFNUaUVt?=
 =?utf-8?B?MFpOM3hSRlRNekpRdDlmTzF4OERJUWs5NUxoMFk3ZFZpMVFWblNKaDM0blVm?=
 =?utf-8?B?dXNVNTdTcHFQRmNUbDlrVURjRzh0S0ZTR3RNZ29neDNDS3BPQVE0R0lYOXV3?=
 =?utf-8?B?NExILy9lWkZTWnIrNVg0NWk1NGhJTkpQYmduWWdjaWcwcGtneml0V1p5MmVm?=
 =?utf-8?B?OVo2NlhMSG1hRDFWc0Z2U2Y3bGlzMFJ0V3FHV1k2M25xRnI3WjZ3c29JOXlk?=
 =?utf-8?B?YnJ3Rk5EeHpMWFFWanplWTlRcGV1N2lBTGRXNnYyRXNiYTJ6bWxIZTFNMlFy?=
 =?utf-8?Q?DhU5DHNhWBb60?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alZNUWlxN0EybTlScXMxRWpieW5KbnZac1dvRmwvczU5UjVZbE5sWDFGN2lG?=
 =?utf-8?B?bXJnRkpUb09DWjZZYWtUazVVNHZ1QVdtRU4xV0JpRytZbFk4TlFCalJlbGU3?=
 =?utf-8?B?N1lYVXkvNXk3NCs1Z0xtbmZTNHpXM1I5VFpMclBHRlhmaU5SUkhISGZJRjRp?=
 =?utf-8?B?STZSZGNlWFFobXM0dStCWDhLRk9UY01XbHZYZ3k2OGNkSDliSXhtZ3RXWXZp?=
 =?utf-8?B?VFBLSnJ3MHBCWlZHVzA3SUJjbzNKTjU5eDFuOGhnaGNjaEVTTmpmRUlUQmkz?=
 =?utf-8?B?a0xmcnVBd3NXcFFQczRmZWZnNmxsa3RHOUNNYTlPZk1SK0o4cmZsNDZHLzBs?=
 =?utf-8?B?SlpuaWJvcytyU3pkeGxoZk9zcFRUY3J5S0cwc0FYckpadjBMZmhNMTZFMkFW?=
 =?utf-8?B?RG1aRmxNZ3hldTRGS2U0MUpEaXdUdW81eUdlMGNvamMzeWZERDdCZHIzZWh5?=
 =?utf-8?B?VlRvZ1Q0VGt0bnBaVHl0cldlcEk4dHpKNmtuQkZSUERQcFh1d0ZPdE45Z1k0?=
 =?utf-8?B?TWt6MFVwN1l0czVEZjJGRHFMTWtta3VoL0tYbnplMFdBOStpTFU1T1hkdE9L?=
 =?utf-8?B?UVJLbEQrekVIc1U3N0hON05ybmFrK3NmRjRoQ1N2L0ZoTmNSOEdONkhQR3RO?=
 =?utf-8?B?eTZ1SzUrYWNBUmNFL2VRekNBRE0wenZEMjdXbGE4QVhmUjRXVmxvek1BcnZG?=
 =?utf-8?B?bUpQOHhCUHlzNjVielFXWDlvWGcvTmlFUUpOT0FzZ2VBTndwbnJJbzFFR252?=
 =?utf-8?B?eE0wV3lzMVMrT0NKN2psVzlGNStkd2dmWU5kU0hIeTF2Q3RYclltcjF6ZExo?=
 =?utf-8?B?RUJGRU13RURKcnJpM2lhcW1Eak1tdFZXSGJpUTkwdEx1ZjdBdTMzc2ZqVlJY?=
 =?utf-8?B?VG1HWEdZUlR0cWkwMDlXakM2KzhWalJSRkFXMXl2NUZLemFZbGJ5LzBwakNZ?=
 =?utf-8?B?OExadkxXdjg3N293SVVJb2Eyei9zUnAyam1sMm4zaXpIZDRKbU1mdmdtU3JR?=
 =?utf-8?B?U0M2QWlYajdvWkl1QnRRNjkrbExVYkxwKzZvS2o5d1hBcW5hOVptVXA3M09R?=
 =?utf-8?B?YUk4MGxzMGY4WWpxK0xXOURMaHdjbmFpRTZabFR2cGNLNlBkcmFLNHJUaloz?=
 =?utf-8?B?UTc2Z3RHZlZZUitvNjRQbm1OdXVHQXQzd3VKMEczT2ZhT2Y1ZkhWaDFFVHQz?=
 =?utf-8?B?OTJyTDY3ZzVMUmx2SW80R0U5Sk9CYWZlSCthYTNNeEZ0eXVacmVzeUNEcUNW?=
 =?utf-8?B?d2pjN01vRTJ2RXRqWTdnQUppQytsZG9nKytCb1Jid2VmYkZyUTV1ZkJrQksx?=
 =?utf-8?B?UlFoam1RUXhQSHhjSUxGM0VDc1NTcDBzQ01tUi9mOXNzYnRZdmhCNmE4MEdB?=
 =?utf-8?B?VzBLWm4yZ2toU1JBSFdPRzNNOXZaZnIweFIxeGZ3cG1FS0Zhb3R1cDMvS3Mv?=
 =?utf-8?B?ZDRYdUl6ckY3d2p3WlUrMWRHN1kzTVRHd0x5M3lEeWZZNEdRNGRFNEhtT21J?=
 =?utf-8?B?NjF1UWwzd202VEJqQlMyd0ZBRWRtSG9aUW4waFZqUnAxZ0kvSW5HWHk2b05n?=
 =?utf-8?B?SS9tNmZkblBqQ3ExVGVmdTI5U29sQ2JrSFhQMm9oUVk3akw0b2czNVJyU0sy?=
 =?utf-8?B?eHFFeDJad3d5V3lLaTNuRms3MmZhOWY3SExGNUNsY2RrTlAzWVZEZmZVS3Nh?=
 =?utf-8?B?K0praEhvUlFBbjhuVzRJZ0lpL2ZRN0RYUlZkc244V3BSQzNpSnNMempjUHdo?=
 =?utf-8?B?SEd0N1lFbUJwQmJHeVcxWFBBR3ZlMGN5bk43TW5OT2p3TUR4UWFjMnNlWkhG?=
 =?utf-8?B?QzNWZXB2R1ZMelo3Z0hVZVFTc05YSFlSUXlvRWlDeENWQmlobWVmdVg2aVN6?=
 =?utf-8?B?YUJ2VTI1dEtEQSsrS2NmQStRdjRWeUdlcTM4Z3l5eGFiU01WVWh2K0Rndld0?=
 =?utf-8?B?MG55MUdKRXJHRGtGVjVLZGs0eU1nQjJTVnA5Y2ZoM2Ixc2NSNDBZSXh2VXYz?=
 =?utf-8?B?U2krU0grKzVpWGtIZVQ4TC83dWsyNU1wQUF2QnV2RXMyb3Uwd2pLQ0o5R1Rr?=
 =?utf-8?B?bmV4aFVCNVY2aG91NXhaelRjaEtmSURYcXRwdDZSaWU4Yjl1SDRUenNTZGdv?=
 =?utf-8?B?WUpBQnEvNlgrSUMzNUdYWEc5TjBOb3JqNWgrdEU4NUEwOXloMnhycGk2eVZY?=
 =?utf-8?Q?3774zzG+sDM8avZMuoIFZec=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <477E394C2ABE474EB33BA05615A9DD8C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3df67f-50f5-44fd-cb9f-08dcde3b2e08
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 14:54:53.6444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cLWuXccAVBGcP8xV7W1E4S0Sh9CbtbtbKza7mJf4nHN26HFjRGRatzRt79Ux3Kt9Qer3pWSy5O5mMjdvfqfPEr44ZHWDYY5hPOLlTQUNqJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7058
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

T24gVGh1LCAyMDI0LTA5LTI2IGF0IDE0OjE4ICswMjAwLCBEb21pbmlrIEthcm9sIFBpxIV0a293
c2tpIHdyb3RlOg0KPiBUaGlzIHBhdGNoIGludHJvZHVjZXMgcHJlZW1wdF90aW1lb3V0IGhlbHBl
cnM6DQo+ICAtIHhlX2V1ZGVidWdfc2V0X3ByZWVtcHRfdGltZW91dF90b19tYXgNCj4gICAgU2V0
cyBwcmVlbXB0X3RpbWVvdXRfdXMgZm9yIGdpdmVuIGVuZ2luZV9jbGFzcyB0byBtYXhpbXVtLg0K
PiAgLSB4ZV9ldWRlYnVnX3Jlc3RvcmVfcHJlZW1wdF90aW1lb3V0DQo+ICAgIFNldHMgcHJlZW1w
dF90aW1lb3V0X3VzIGZvciBnaXZlbiBlbmdpbmVfY2xhc3MgdG8gcHJldmlvdXMgdmFsdWUuDQo+
IA0KDQpJIHRoaW5rIHRoaXMgc2hvdWxkIHJlYWxseSBnbyB0byBpZ3Rfc3lzZnMuYy4gQW5kIGlu
IHNsaWd0bHkgZGlmZmVyZW50IGZvcm06DQpIb3cgYWJvdXQgc3RoIGxpa2U6DQoNCmlndF9zeXNm
c19lbmdpbmVfc2V0X3Byb3BlcnR5KGVuZ2luZXNfZmQsICJwcmVlbXB0X3RpbWVvdXRfdXMiLCB2
YWx1ZSk7DQppZ3Rfc3lzZnNfZW5naW5lX3NldF9wcm9wZXJ0eV9ib3VuZChlbmdpbmVzX2ZkLCAi
cHJlZW1wdF90aW1lb3V0X3VzIiwgbWF4KTsNCg0KLHdoZXJlIG1heCBpcyBhIGJvb2wgdmFyaWFi
bGUgd2hpY2ggdGVsbHMgd2hldGhlciBpdCBzaG91bGQgYmUgbWluIG9yIG1heC4NCg0KVG8gZmlu
ZCBlbmdpbmVzX2ZkIHhlX3N5c2ZzX2VuZ2luZV9vcGVuIGNvdWxkIGJlIHVzZWQuDQoNClJlZ2Fy
ZHMsDQpEb21pbmlrDQoNCj4gU2lnbmVkLW9mZi1ieTogRG9taW5payBLYXJvbCBQacSFdGtvd3Nr
aSA8ZG9taW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIveGUv
eGVfZXVkZWJ1Zy5jIHwgMTIwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ICBsaWIveGUveGVfZXVkZWJ1Zy5oIHwgICAzICsrDQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDEyMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX2V1ZGVi
dWcuYyBiL2xpYi94ZS94ZV9ldWRlYnVnLmMNCj4gaW5kZXggMmM3Y2QyYWUxLi4yMjlmOWU2YTEg
MTAwNjQ0DQo+IC0tLSBhL2xpYi94ZS94ZV9ldWRlYnVnLmMNCj4gKysrIGIvbGliL3hlL3hlX2V1
ZGVidWcuYw0KPiBAQCAtMTYsNiArMTYsNyBAQA0KPiAgI2luY2x1ZGUgImludGVsX3BhdC5oIg0K
PiAgI2luY2x1ZGUgInhlX2V1ZGVidWcuaCINCj4gICNpbmNsdWRlICJ4ZV9pb2N0bC5oIg0KPiAr
I2luY2x1ZGUgInhlX2RybS5oIg0KPiAgDQo+ICBzdHJ1Y3QgZXZlbnRfdHJpZ2dlciB7DQo+ICAJ
eGVfZXVkZWJ1Z190cmlnZ2VyX2ZuIGZuOw0KPiBAQCAtMTcxNyw2ICsxNzE4LDEyNSBAQCBib29s
IHhlX2V1ZGVidWdfZW5hYmxlKGludCBmZCwgYm9vbCBlbmFibGUpDQo+ICAJcmV0dXJuIG9sZDsN
Cj4gIH0NCj4gIA0KPiArLyoqDQo+ICsgKiB4ZV9ldWRlYnVnX3NldF9wcmVlbXB0X3RpbWVvdXRf
dG9fbWF4DQo+ICsgKiBAZmQ6IHhlIGNsaWVudA0KPiArICogQGVuZ2luZV9jbGFzczogZW5naW5l
IGNsYXNzIHRvIG1vZGlmeSAoZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZS0+ZW5naW5lX2Ns
YXNzKQ0KPiArICogQHZhbHVlOiBwb2ludGVyIHRvIHZhcmlhYmxlIHRvIHN0b3JlIHByZXZpb3Vz
IHByZWVtcHRfdGltZW91dCB2YWx1ZSBpbiwgbmVlZGVkIGZvciByZXN0b3JlDQo+ICsgKg0KPiAr
ICogU2V0cyBwcmVlbXB0X3RpbWVvdXRfdXMgZm9yIGdpdmVuIGVuZ2luZV9jbGFzcyB0byBtYXhp
bXVtLg0KPiArICoNCj4gKyAqIFJldHVybnM6IHRydWUgb24gc3VjY2VzcywgZmFsc2Ugb24gZmFp
bHVyZS4NCj4gKyAqLw0KPiArYm9vbCB4ZV9ldWRlYnVnX3NldF9wcmVlbXB0X3RpbWVvdXRfdG9f
bWF4KGludCBmZCwgdWludDE2X3QgZW5naW5lX2NsYXNzLCB1aW50MzJfdCAqdmFsdWUpDQo+ICt7
DQo+ICsJaW50IGVuZ2luZXNfZmQ7DQo+ICsJaW50IGd0X2ZkOw0KPiArCXVpbnQzMl90IG1heF92
YWx1ZTsNCj4gKw0KPiArCWlndF9hc3NlcnQoZW5naW5lX2NsYXNzID09IERSTV9YRV9FTkdJTkVf
Q0xBU1NfUkVOREVSIHx8DQo+ICsJCSAgIGVuZ2luZV9jbGFzcyA9PSBEUk1fWEVfRU5HSU5FX0NM
QVNTX0NPTVBVVEUpOw0KPiArDQo+ICsJZ3RfZmQgPSB4ZV9zeXNmc19ndF9vcGVuKGZkLCAwKTsN
Cj4gKwlpZiAoZ3RfZmQgPT0gLTEpIHsNCj4gKwkJaWd0X2RlYnVnKCJGYWlsZWQgdG8gb3BlbiBn
dC5cbiIpOw0KPiArDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoZW5n
aW5lX2NsYXNzID09IERSTV9YRV9FTkdJTkVfQ0xBU1NfUkVOREVSKQ0KPiArCQllbmdpbmVzX2Zk
ID0gb3BlbmF0KGd0X2ZkLCAiZW5naW5lcy9yY3MiLCBPX1JET05MWSk7DQo+ICsJZWxzZQ0KPiAr
CQllbmdpbmVzX2ZkID0gb3BlbmF0KGd0X2ZkLCAiZW5naW5lcy9jY3MiLCBPX1JET05MWSk7DQo+
ICsNCj4gKwlpZiAoZW5naW5lc19mZCA9PSAtMSkgew0KPiArCQlpZ3RfZGVidWcoIkZhaWxlZCB0
byBvcGVuIGVuZ2luZSBjbGFzcy5cbiIpOw0KPiArCQljbG9zZShndF9mZCk7DQo+ICsNCj4gKwkJ
cmV0dXJuIGZhbHNlOw0KPiArCX0NCj4gKw0KPiArCWlmICghX19pZ3Rfc3lzZnNfZ2V0X3UzMihl
bmdpbmVzX2ZkLCAicHJlZW1wdF90aW1lb3V0X3VzIiwgdmFsdWUpKSB7DQo+ICsJCWlndF9kZWJ1
ZygiRmFpbGVkIHRvIHJlYWQgcHJlZW1wdF90aW1lb3V0X3VzLlxuIik7DQo+ICsJCWNsb3NlKGVu
Z2luZXNfZmQpOw0KPiArCQljbG9zZShndF9mZCk7DQo+ICsNCj4gKwkJcmV0dXJuIGZhbHNlOw0K
PiArCX0NCj4gKw0KPiArCWlmICghX19pZ3Rfc3lzZnNfZ2V0X3UzMihlbmdpbmVzX2ZkLCAicHJl
ZW1wdF90aW1lb3V0X21heCIsICZtYXhfdmFsdWUpKSB7DQo+ICsJCWlndF9kZWJ1ZygiRmFpbGVk
IHRvIHJlYWQgcHJlZW1wdF90aW1lb3V0X21heC5cbiIpOw0KPiArCQljbG9zZShlbmdpbmVzX2Zk
KTsNCj4gKwkJY2xvc2UoZ3RfZmQpOw0KPiArDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKwl9DQo+
ICsNCj4gKwlpZiAoIV9faWd0X3N5c2ZzX3NldF91MzIoZW5naW5lc19mZCwgInByZWVtcHRfdGlt
ZW91dF91cyIsIG1heF92YWx1ZSkpIHsNCj4gKwkJaWd0X2RlYnVnKCJGYWlsZWQgdG8gd3JpdGUg
cHJlZW1wdF90aW1lb3V0X3VzLlxuIik7DQo+ICsJCWNsb3NlKGVuZ2luZXNfZmQpOw0KPiArCQlj
bG9zZShndF9mZCk7DQo+ICsNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArCX0NCj4gKw0KPiArCWNs
b3NlKGVuZ2luZXNfZmQpOw0KPiArCWNsb3NlKGd0X2ZkKTsNCj4gKw0KPiArCXJldHVybiB0cnVl
Ow0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIHhlX2V1ZGVidWdfcmVzdG9yZV9wcmVlbXB0X3Rp
bWVvdXQNCj4gKyAqIEBmZDogeGUgY2xpZW50DQo+ICsgKiBAZW5naW5lX2NsYXNzOiBlbmdpbmUg
Y2xhc3MgdG8gbW9kaWZ5IChkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlLT5lbmdpbmVfY2xh
c3MpDQo+ICsgKiBAdmFsdWU6IHByZXZpb3VzIHByZWVtcHRfdGltZW91dCB2YWx1ZQ0KPiArICoN
Cj4gKyAqIFNldHMgcHJlZW1wdF90aW1lb3V0X3VzIGZvciBnaXZlbiBlbmdpbmVfY2xhc3MgdG8g
cHJldmlvdXMgdmFsdWUuDQo+ICsgKg0KPiArICogUmV0dXJuczogdHJ1ZSBvbiBzdWNjZXNzLCBm
YWxzZSBvbiBmYWlsdXJlLg0KPiArICovDQo+ICtib29sIHhlX2V1ZGVidWdfcmVzdG9yZV9wcmVl
bXB0X3RpbWVvdXQoaW50IGZkLCB1aW50MTZfdCBlbmdpbmVfY2xhc3MsIHVpbnQzMl90IHZhbHVl
KQ0KPiArew0KPiArCWludCBlbmdpbmVzX2ZkOw0KPiArCWludCBndF9mZDsNCj4gKw0KPiArCWln
dF9hc3NlcnQoZW5naW5lX2NsYXNzID09IERSTV9YRV9FTkdJTkVfQ0xBU1NfUkVOREVSIHx8DQo+
ICsJCSAgIGVuZ2luZV9jbGFzcyA9PSBEUk1fWEVfRU5HSU5FX0NMQVNTX0NPTVBVVEUpOw0KPiAr
DQo+ICsJZ3RfZmQgPSB4ZV9zeXNmc19ndF9vcGVuKGZkLCAwKTsNCj4gKwlpZiAoZ3RfZmQgPT0g
LTEpIHsNCj4gKwkJaWd0X2RlYnVnKCJGYWlsZWQgdG8gb3BlbiBndC5cbiIpOw0KPiArDQo+ICsJ
CXJldHVybiBmYWxzZTsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoZW5naW5lX2NsYXNzID09IERSTV9Y
RV9FTkdJTkVfQ0xBU1NfUkVOREVSKQ0KPiArCQllbmdpbmVzX2ZkID0gb3BlbmF0KGd0X2ZkLCAi
ZW5naW5lcy9yY3MiLCBPX1JET05MWSk7DQo+ICsJZWxzZQ0KPiArCQllbmdpbmVzX2ZkID0gb3Bl
bmF0KGd0X2ZkLCAiZW5naW5lcy9jY3MiLCBPX1JET05MWSk7DQo+ICsNCj4gKwlpZiAoZW5naW5l
c19mZCA9PSAtMSkgew0KPiArCQlpZ3RfZGVidWcoIkZhaWxlZCB0byBvcGVuIGVuZ2luZSBjbGFz
cy5cbiIpOw0KPiArCQljbG9zZShndF9mZCk7DQo+ICsNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiAr
CX0NCj4gKw0KPiArCWlmICghX19pZ3Rfc3lzZnNfc2V0X3UzMihlbmdpbmVzX2ZkLCAicHJlZW1w
dF90aW1lb3V0X3VzIiwgdmFsdWUpKSB7DQo+ICsJCWlndF9kZWJ1ZygiRmFpbGVkIHRvIHdyaXRl
IHByZWVtcHRfdGltZW91dF91cy5cbiIpOw0KPiArCQljbG9zZShlbmdpbmVzX2ZkKTsNCj4gKwkJ
Y2xvc2UoZ3RfZmQpOw0KPiArDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKwl9DQo+ICsNCj4gKwlj
bG9zZShlbmdpbmVzX2ZkKTsNCj4gKwljbG9zZShndF9mZCk7DQo+ICsNCj4gKwlyZXR1cm4gdHJ1
ZTsNCj4gK30NCj4gKw0KPiAgLyogRXUgZGVidWdnZXIgd3JhcHBlcnMgYXJvdW5kIHJlc291cmNl
IGNyZWF0aW5nIHhlIGlvY3Rscy4gKi8NCj4gIA0KPiAgLyoqDQo+IGRpZmYgLS1naXQgYS9saWIv
eGUveGVfZXVkZWJ1Zy5oIGIvbGliL3hlL3hlX2V1ZGVidWcuaA0KPiBpbmRleCAyOWFiNjhmZWUu
LjE0NDAzNTg2MiAxMDA2NDQNCj4gLS0tIGEvbGliL3hlL3hlX2V1ZGVidWcuaA0KPiArKysgYi9s
aWIveGUveGVfZXVkZWJ1Zy5oDQo+IEBAIC0xNjcsNiArMTY3LDkgQEAgdm9pZCB4ZV9ldWRlYnVn
X2NsaWVudF9zZXRfZGF0YShzdHJ1Y3QgeGVfZXVkZWJ1Z19jbGllbnQgKmMsIHZvaWQgKnB0cik7
DQo+ICANCj4gIGJvb2wgeGVfZXVkZWJ1Z19lbmFibGUoaW50IGZkLCBib29sIGVuYWJsZSk7DQo+
ICANCj4gK2Jvb2wgeGVfZXVkZWJ1Z19zZXRfcHJlZW1wdF90aW1lb3V0X3RvX21heChpbnQgZmQs
IHVpbnQxNl90IGVuZ2luZV9jbGFzcywgdWludDMyX3QgKnZhbHVlKTsNCj4gK2Jvb2wgeGVfZXVk
ZWJ1Z19yZXN0b3JlX3ByZWVtcHRfdGltZW91dChpbnQgZmQsIHVpbnQxNl90IGVuZ2luZV9jbGFz
cywgdWludDMyX3QgdmFsdWUpOw0KPiArDQo+ICBpbnQgeGVfZXVkZWJ1Z19jbGllbnRfb3Blbl9k
cml2ZXIoc3RydWN0IHhlX2V1ZGVidWdfY2xpZW50ICpjKTsNCj4gIHZvaWQgeGVfZXVkZWJ1Z19j
bGllbnRfY2xvc2VfZHJpdmVyKHN0cnVjdCB4ZV9ldWRlYnVnX2NsaWVudCAqYywgaW50IGZkKTsN
Cj4gIHVpbnQzMl90IHhlX2V1ZGVidWdfY2xpZW50X3ZtX2NyZWF0ZShzdHJ1Y3QgeGVfZXVkZWJ1
Z19jbGllbnQgKmMsIGludCBmZCwNCg0K
