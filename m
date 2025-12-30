Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A392E94110
	for <igt-dev@archiver.kernel.org>; Tue, 30 Dec 2025 05:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCECB10E818;
	Tue, 30 Dec 2025 05:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BoktEexI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FC710E0F8;
 Tue, 30 Dec 2025 05:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767074246; x=1798610246;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6F1+BbinGc3wfpto9LqYq5uURoIn1L0UGlMA6ZcS8hg=;
 b=BoktEexIN6tm5zln/DmIjsgJONbW08Wl+VyBBLFO0k3jiIcWt4Nk4P1P
 100UVv4lFVs9e7c0qSGcPyfr/Dcy4fQRBCKUoff3ofL3Os8JwEZI/BDoO
 R9rpwBxBBs8bJuSQPSG1lCl5D2MHGNHbUxZzvL5bc0hD3Ooh8PH7eHzfe
 h72HA1cC6Gdf/Kqw6UWm+1dH/QOP6k9N5opc05+efqIp97jjOgAo7wCat
 n9qxayis4hrokRs6ARjAd5IW/QyAbES8iIHc33iBwMgbPweLqo3lq2thE
 zspOJWevw4nylTRs8b9GeaXTmqNNkTYw0K2J4F00eA+a0jrTiBReHyrn7 g==;
X-CSE-ConnectionGUID: QoNFjeySQ8aAmHFZlJEenA==
X-CSE-MsgGUID: k372Ik72RimdAOKe7l5Kxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="56240654"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="56240654"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 21:57:25 -0800
X-CSE-ConnectionGUID: D0Zxpm8GSgOzLnpU29YldQ==
X-CSE-MsgGUID: 5Dkao1hxTVOiAQizjuv35Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="238577075"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 21:57:25 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 21:57:24 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 29 Dec 2025 21:57:24 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 21:57:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHtnT32fcu3mOmv53bJKCDtlPd72AKE7/PM49enVnaQ2e8c1JLqZ3ZZw9luK/eY+QmctCWDdqypLGF/3Xxst+TO8Fh7E74z1kkt1b76sVvlAF5nnlzHZcjHoIIQXSXJq7fcnoUmezeOPjW4XC6rEO+0Y1K4gCBjQFdLCyOF/gFAr+Tth/QD3hWRsw2u/DOCi5b9l+N6dktZQfbhn6H/D83SXlk8seDN35bhhrrS2oMT6yCpYJcYLkjAP0NW/dBfTsHpTQnOyjr0KLFi/m0N6zCevApjlWiiwDTUO2szkkEPS+XWjdehhrHJktYhsR6XNMmatFAJv+Am4Kdgsx9X+hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6F1+BbinGc3wfpto9LqYq5uURoIn1L0UGlMA6ZcS8hg=;
 b=icb92TCwHcrQso5zNtSGb6DgW99l7gi7n7eLyECcXviiYfmXx3WFGsu1sO3/zcgMOApDDxUxxIeFAWLIUO//7bxWQWA/zCU6pRVvIXDoTKmvfcSK6NE0MXD7D2/h2oRlrHCM/TRnB0R7N/cgcsAL9DY/sJ1jAYVgNpWM8L8fCHAcyJi/FrwEGDgkU80sQiEX2lKz2wKov3D8bHVDm1wm0Dv8gbfyXYqXveHTWOXPnTOvwQY8EoMpibCRdi6tMAYl2sIN+pWpTgc4b/UP7wlmtlWOmU/Kf8OlluVp7tR4WsmgLC60IOMaYH2QryMnHVR13VKK0pJ0bFM9EUCRaOm2Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5502.namprd11.prod.outlook.com (2603:10b6:5:39e::23)
 by IA1PR11MB9470.namprd11.prod.outlook.com (2603:10b6:208:5af::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 05:57:18 +0000
Received: from DM4PR11MB5502.namprd11.prod.outlook.com
 ([fe80::9292:61e:1a29:3447]) by DM4PR11MB5502.namprd11.prod.outlook.com
 ([fe80::9292:61e:1a29:3447%5]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 05:57:17 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVs?=
 =?utf-8?B?L2dlbV9sbWVtX3N3YXBwaW5nOiBBdm9pZCBmYWxzZSBmYWlsdXJlcyBmcm9t?=
 =?utf-8?Q?_oom-killer_(rev3)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwvZ2Vt?=
 =?utf-8?B?X2xtZW1fc3dhcHBpbmc6IEF2b2lkIGZhbHNlIGZhaWx1cmVzIGZyb20gb29t?=
 =?utf-8?Q?-killer_(rev3)?=
Thread-Index: AQHceLEu+4S6xUuT8k6D/qN7CPjHzrU5p9mw
Date: Tue, 30 Dec 2025 05:57:17 +0000
Message-ID: <DM4PR11MB5502AA9A6500F5555E846255EFBCA@DM4PR11MB5502.namprd11.prod.outlook.com>
References: <20251219100218.334117-2-janusz.krzysztofik@linux.intel.com>
 <176657608912.116264.9171844662520960439@a3b018990fe9>
 <12806311.O9o76ZdvQC@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <12806311.O9o76ZdvQC@jkrzyszt-mobl2.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5502:EE_|IA1PR11MB9470:EE_
x-ms-office365-filtering-correlation-id: f9806f03-7a0d-4a72-ca84-08de47684a06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?cFp2WFVyQmg1RjNpRm9nMTZNMWl2TEFUM2tLMFc0M0RpMWpxUzFOOU5wSjVk?=
 =?utf-8?B?TFl5VkVsb3hPMjlWSXRSVGRwVXZOZzBNNXZVRkhMcHJ1eFBDVHd6ZDU5YVBH?=
 =?utf-8?B?U0hHTkpISFdXWXJ3Q1ZNdFJjaXNJY2FZTVdsT1lDY0FOWFlVL0pDZVRqaUJm?=
 =?utf-8?B?bHFxcytLK09obElyQmN6MzFZbFdqMXVtNjVzSWVCRjlJV2tzR3JON2M2c082?=
 =?utf-8?B?bkRyUG5kMXBZUVZyd3FLR1BNNEg0dXBsSGlNS25XNmR1SjFTa2JEeHRQOC9U?=
 =?utf-8?B?Nm1VRWVyc0hxUEVrU3RhV05UZGRMdG5XSGtVV1VjK1V5YVBvcllvRWNUUjJY?=
 =?utf-8?B?b05IL1VmTVZNV0NrNE1TMjd4aDBURElaaEN0SVIraEZ2d2U4Qkd5akg3OXY3?=
 =?utf-8?B?N0NpTFExVUE5Y215dWkvT2ZuY0R5eHpVd0dMbjVvdW9LLytib1krM0J5bitJ?=
 =?utf-8?B?WUVVY2Z2dG9vKzh0UEFYb2MwTEpXam8zNGI3ZzhHQWdBMjZoR0w2UDlaSmZ0?=
 =?utf-8?B?Vjk4MHc3SnlrQk0xaFBYM25UeGZwdlRlcnlMQnJ3bDd4bjhmYXQ1Tjl2SFF6?=
 =?utf-8?B?ZUo4cmlkdzFMbWxBSlhLOEo2UmdkbXQzU0c4UHY1WHhGRjBTanNWQkNkbU5I?=
 =?utf-8?B?eU5zdnl4SXlDaURJSUYybnYrSnl0SURvWWhRMnhUM3I0SEVJOEJNMzlwYURF?=
 =?utf-8?B?RlFvZWpqOVRwc25nNldPdysybGJQQnpmRVA1MnU5YjFlYVBTNnVrUE5SUHhu?=
 =?utf-8?B?RlpJWG95TFNVWlFZSi9ZSnJtbE9uZjVvT0tWb1VXbmxUeFJvYUVpVkowS2R6?=
 =?utf-8?B?QVBuOHRXeG43NU40aG5zQjFUZk1FRnFQVlpYbkp3ZUxwNXM0U0J4aE95dDV6?=
 =?utf-8?B?akhpa2ZGeDRiNnhuQkJLQ3dqRWpBMlQwNmhJM2hLUHJHSnNiTDdrUHpPNFl0?=
 =?utf-8?B?TjNGQUw2T2FjTERPaWR4czh3enJZZHdwNmpLWVpLd3hqN3MwYzJIT0JVQk5t?=
 =?utf-8?B?T1VLaWYyaFBhUGlFSmhSSCtZamIxVkFQVjJnc2ZPSzByayt5aysrUG1CNXpr?=
 =?utf-8?B?NzJiajl2dWszOVEvU1VOZGxjM2pFVHM0d1N0aE1sSDhxTGJlSCsra09XR0Mx?=
 =?utf-8?B?R1FaZ3JpMlhERUV2NmhrcFVDUkFnQWVRZkJRTkJ6OXp3aGhSUEJVWmVwSFEr?=
 =?utf-8?B?N0tOK2h5MVhiTGhvRFdlY0NwZ25jbXZ5bGlkZlJtQjd6U0dPRlUvdDFlUzEx?=
 =?utf-8?B?bkw1UnJSS3dpeUpiVnlGdVhreGg4NVVCWlBWYXZVMHJBSGVnRWd6dXVMVGdP?=
 =?utf-8?B?elI5RG43VHRad0dHdXRGS3haMDZhVVVqN296eWE0RWUvV1FHRjZtQlNENFg0?=
 =?utf-8?B?VlIxRUpmMlRCT2lWc0JaQUZlejY1OUZFSWFwWGl1akQza2dnM1JqVi85aHRZ?=
 =?utf-8?B?WGorWWJMVTBhcjZNY2RQVzFmTFJyRVA1T3VVQmJTVE90UEs0QUpUYS9RNmll?=
 =?utf-8?B?QTZPNlh6eVpDdnd6azdOVU1LczBvdU4yU2hkanNQdFZzMGZZdmo1UFFnSnBo?=
 =?utf-8?B?RjVhSVg0NjkzM05hWGhIY2xna2pjQmJ4dlRDNzE5blpQeWNGRjJlejQ5aC9q?=
 =?utf-8?B?MEUrNVdYREVqQ2F6YUhkUEdKbW4ydWo5ek1Nb0l1eEhsVUttVzZMMjI5UDVu?=
 =?utf-8?B?aUtQRWpmeWNBUkQ2ak13VUwrY0REWHhaSDJGMkJoQjgxeUpnNFV5WHFpT3RG?=
 =?utf-8?B?NE5BaWRLOERZcHB2dC9yUTRxRWdTNU1SWFY4OTF3bCs4S2JmcEFuMEhLTGdu?=
 =?utf-8?B?cERGMlNiR3VWM0xIS0V2N1Btdnl5YjBkN1dnbW1vZ3dFQTBkdnhUN0NhbTVp?=
 =?utf-8?B?bFZwc3NJUWFTU0UydGdreXQ3OXErWWFRMm5ZQVl6a0FLNCt4UEt0eEg4MmJX?=
 =?utf-8?B?aGdVbEdEZjl0bHYzU0d2VzNDUHJ2ZmRSdDB6Uy9jVW5tVTBnQWcrcHdCeTVS?=
 =?utf-8?B?V3lkbzNFT09RPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5502.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzRvRStlWkNZQkd2OWhHSXZTUmM5ZHlLU1ZOcWVPUDlIUmpyWmlKbE0vbi8w?=
 =?utf-8?B?ZUFlNUdkZlhubWk5ekYxWDllYkROaEdhdzB6Ty92ZjJSY0tPT0tQRHBuWG9z?=
 =?utf-8?B?VDB6MlIrSTdERDVJd0JBNDRSTitacDhzQi9naGVoWmVPSkUwN1dwRGt6eUw3?=
 =?utf-8?B?eW5QTmhTd3gzLzBpZWVqMDQyb2YxM1Z4bDJ0SXZaeUNMOEdRNXBsamMzUjJG?=
 =?utf-8?B?aFJWNEpnNDJ1VHR5Zjl0S2hzWUF0UnZnK0I3enJEWlVHT0hDM0d4RUwyb1Bu?=
 =?utf-8?B?UjNJOEs2NTRjdEEyODNmL3VYR2xrU3l4bzFmOWhvdHh2N3hhMDJZL0pYTmhm?=
 =?utf-8?B?ck0rd3FzNjFUVjRpVTA5VWlqWXNPbHAyTDNUZytNSXMvUWZNVXcxMnA5RnNx?=
 =?utf-8?B?Mm83Qjc3Vk90Vy82ZzlEVHNGTk9YMUNSV3EyZGF2bmhHdVF2OC9JU1dmT0ZG?=
 =?utf-8?B?M0FhUE9NNWd1MkZoc2g0Nkt1SVF3NXVxL0tpSUlqdC8zT2F1UG9PU1hYOW9T?=
 =?utf-8?B?aW95T0xqZmNsdDFzdFlxQWZUZGZuL3BYS25DdkZiTjJoUzdPbURta0Q4U1N1?=
 =?utf-8?B?ZWQwTEp0Rk5FSEpLQllMSngyeno0NTRnOFkyMDdQTUtUbTVvTzFSalNsWVZn?=
 =?utf-8?B?c1k3aXdNdXk5bzBPdThEL1hsUUsyYnZiVXFsOHFaRTBhbmVZM1ZVVlZKMFh5?=
 =?utf-8?B?OVBXSWVscnM1V2Q4WENKYlVvZFZYTW1RekVZVnd2c0hxUGZSWVJSdU1FWldv?=
 =?utf-8?B?Rm9PWHNpOHU4WVhNRXE5azZyNFpqNS82SHhiaWhJUEluNXV2cDFBTEJmMkN5?=
 =?utf-8?B?Z1lVMTcrV1NPMldBZFF1WXJ6NkV2SURpa0tRdUY1UTh1YmF6dzdSTUdMMDRr?=
 =?utf-8?B?OTJ2Y014ZkF1bjRGY1JkTkhkWlpXQlZGaUJubVNyN2hZS0krSVpLak9mVUxK?=
 =?utf-8?B?enVKVzJWVXZZblp2YWZDNzBLM0JxS3ZDZmFRdWNUeFRjVnZwa0JPMmtXcDht?=
 =?utf-8?B?V1l0NkJEL1BYazFGdGNhMWhPNGsyVDl4MjgrS1pVUlV4SXRWU3A2bDMxaTg1?=
 =?utf-8?B?SWU5bnA2cUZDMElTUE5YR2E3bldMOUdhUGlidlJWbXJGSE5sNzJQeXBPQVNN?=
 =?utf-8?B?RnhmNVNjTXNNVDZQSEtkM1pwaFVycUwwU2VHWTA4aFpKaGF3eG1rOW9NL2Iy?=
 =?utf-8?B?aVo2WThpalAyeUFuYnBIaG1WdnN2RkpGQzM2VkxsVU85S0VCUCsvQVZFQWpK?=
 =?utf-8?B?NUZab0VWeDA1RDhrYUFIWTYzOGFYSFdMeGNobmpDNllDL2ZpRHNiTGFSZGV5?=
 =?utf-8?B?VmhBQ0F4em5VZUlydFJ5S3l5Z1VFSWd1SFNwM0dVMGZoTktweHMzZ2Z4clVo?=
 =?utf-8?B?Q2ZUQk1FWW04cVZNRnl6ZU11eXN0Q1NLSWdndUFiZHF4bC9LdGNxbStLam5z?=
 =?utf-8?B?YWlxRWRiT094UkFQdHI2bWQvYnRQUGMxQ2RVdG9MVFRVczhkdC9ReVZ3QVE5?=
 =?utf-8?B?S25ZYUVBTkdTcE5GM3JETjg2RUlGOEYxT0VwVkd0UkxHNkF6M1dNUGdGOUFH?=
 =?utf-8?B?ZW53SEhkV2x0WS9uSENDaWZnbGdWKzBjZkFFb1g0ZmJjamRNNk1XTHVUV1Uv?=
 =?utf-8?B?TCs3SUwyRnd2blRDaSt1VlhzL3ZDYnBiejYwamp2TzRPTGRVcjBJMVExbVJh?=
 =?utf-8?B?SzdRL29XUUV0TzhuUkwrenNIVkcwclRNNW1wUHJHQzRHbThjOFNRUmxhRzEy?=
 =?utf-8?B?blIvRjFPQnR6TXJ5NS9aQXFnZHdXMGIreVFHUklLV0Q2TStJdVREV0JqMUhi?=
 =?utf-8?B?RDlxTDNPRHUrNmUzZ2k3cTExV1pQNGYvNmhMVjZGTThpb1BKNTFwSmNvNnQ1?=
 =?utf-8?B?WXA2R3ZMQlQ5c2NtOS9wZUd5TE9QOVE1aFBNL1RIS2tMdGVGb0FSSnhsUGFh?=
 =?utf-8?B?SnVYWm9uZkVxSmc2ajdoZFRHWnIrV1FsaE1FRVRhRUNpQkRieHVycjRRN1FN?=
 =?utf-8?B?RmZtVG04NXVZK1ZHTUdhclljT0oyL2IxVGloVUlZRFJ2OUplNDJpN1hNWDZZ?=
 =?utf-8?B?Z25RK2RuVnpCUW5IbmVmS1JaMFYwbU90N2dFa2Y5SUp5c3Z5dTZVWklNUXg3?=
 =?utf-8?B?cTkxdjBVaXZzL000djZsK0M2MjZIb1p1NmpXQjlFNm0yQzVWeXRFUlUyOExa?=
 =?utf-8?B?T2h0dE93T2ZGelpYRkgwY1JFb3VLNXd2R01iQVRpbmNJb3J5OUNrUWEwQlY2?=
 =?utf-8?B?WStwbTdVUTlxM24yQVpnNmo0ZkRDZTdHUkhpOS8wSGlIUkJrR2UxM01TUG5W?=
 =?utf-8?B?RGxpQXZPclpHTDBjVEJFZFhXbDFPN1pWUUZXVlJkangyQmpGWHRHQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5502.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9806f03-7a0d-4a72-ca84-08de47684a06
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2025 05:57:17.6896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IdkuMgtj87460XwvF8TLgrnT+zdtcJ/P9gvDIH7vUzZe1jY3vD/k0PfLvQHcQFn/67yoK1pQsKiOPNpmqApFLWvAGYNpT600lDVjtKiMGqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9470
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU5MTYwLw0K
aTkxNS5DSS5GVUxMIC0gUmUtcmVwb3J0ZWQuDQogDQpUaGFua3MsDQpSYXZhbGkuDQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNpLWluZnJhIDxpOTE1LWNpLWluZnJh
LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSmFudXN6IEtyenlz
enRvZmlrDQpTZW50OiAyOSBEZWNlbWJlciAyMDI1IDE2OjIyDQpUbzogSTkxNS1jaS1pbmZyYUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
U3ViamVjdDogUmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVsL2dl
bV9sbWVtX3N3YXBwaW5nOiBBdm9pZCBmYWxzZSBmYWlsdXJlcyBmcm9tIG9vbS1raWxsZXIgKHJl
djMpDQoNCkhpIEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnLA0KDQpPbiBXZWRu
ZXNkYXksIDI0IERlY2VtYmVyIDIwMjUgMTI6MzQ6NDkgQ0VUIFBhdGNod29yayB3cm90ZToNCj4g
PT0gU2VyaWVzIERldGFpbHMgPT0NCj4gDQo+IFNlcmllczogdGVzdHMvaW50ZWwvZ2VtX2xtZW1f
c3dhcHBpbmc6IEF2b2lkIGZhbHNlIGZhaWx1cmVzIGZyb20gDQo+IG9vbS1raWxsZXINCihyZXYz
KQ0KPiBVUkwgICA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU5
MTYwLw0KPiBTdGF0ZSA6IGZhaWx1cmUNCj4gDQo+ID09IFN1bW1hcnkgPT0NCj4gDQo+IENJIEJ1
ZyBMb2cgLSBjaGFuZ2VzIGZyb20gQ0lfRFJNXzE3NzMyX2Z1bGwgLT4gSUdUUFdfMTQyNjVfZnVs
bCANCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAg
IFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIElHVFBXXzE0MjY1X2Z1bGwgYWJz
b2x1dGVseSBuZWVkIHRvIGJlDQo+ICAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYg
eW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRo
ZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNlZCBpbiBJR1RQV18xNDI2NV9mdWxsLCBwbGVhc2Ugbm90
aWZ5IHlvdXIgYnVnIHRlYW0gDQo+IChJOTE1LWNpLQ0KaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnKSB0byBhbGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2Rl
LCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgDQo+IGluDQpDSS4NCj4gDQo+ICAg
RXh0ZXJuYWwgVVJMOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lH
VFBXXzE0MjY1Lw0KaW5kZXguaHRtbA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0cyAoOSAtPiA5
KQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgTm8gY2hhbmdlcyBp
biBwYXJ0aWNpcGF0aW5nIGhvc3RzDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVzDQo+IC0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhlIHVua25vd24gY2hhbmdlcyB0aGF0
IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbg0KSUdUUFdfMTQyNjVfZnVsbDoNCj4gDQo+ICMj
IyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMjIw0K
PiANCj4gICAqIGlndEBwZXJmX3BtdUBhbGwtYnVzeS1pZGxlLWNoZWNrLWFsbDoNCj4gICAgIC0g
c2hhcmQtZGcyOiAgICAgICAgICBbUEFTU11bMV0gLT4gW0ZBSUxdWzJdDQo+ICAgIFsxXTogDQo+
IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvQ0lfRFJNXzE3NzMyL3No
YXJkLWRnMi04Lw0KaWd0QHBlcmZfcG11QGFsbC1idXN5LWlkbGUtY2hlY2stYWxsLmh0bWwNCj4g
ICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQ
V18xNDI2NS9zaGFyZC1kZzItNC8NCmlndEBwZXJmX3BtdUBhbGwtYnVzeS1pZGxlLWNoZWNrLWFs
bC5odG1sDQoNClRoZSBjaGFuZ2UgdW5kZXIgdGhpcyBwcmUtbWVyZ2UgdGVzdGluZyBjYW4gb25s
eSBhZmZlY3QgZ2VtX2xtZW1fc3dhcHBpbmcgdGVzdCwgbm90IG90aGVycywgdGhlbiB0aGUgYWJv
dmUgaXMgbm90IHJlbGF0ZWQuICBQbGVhc2UgdXBkYXRlIGZpbHRlcnMgYW5kIHJlLXJlcG9ydC4N
Cg0KVGhhbmtzLA0KSmFudXN6DQoNCj4gDQo+ICAgDQo+IE5ldyB0ZXN0cw0KPiAtLS0tLS0tLS0N
Ci4uLg0KDQoNCg==
