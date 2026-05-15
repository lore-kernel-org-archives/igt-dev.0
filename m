Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D1CCD4F25
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 15:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFCD10F569;
	Fri, 15 May 2026 15:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+CbwyBk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F23910F569
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 15:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778858953; x=1810394953;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h0bacb+bBzwVC/cg2USr2qSvvJJrRVrrfS1mZNVi1K0=;
 b=I+CbwyBkeLIzmvF9zAf+HG/X3Np844LNlETP6beueHkSMQ9E1SDfQiOr
 frOXqgJSy4UGA2DOCs/ezjMdRcmsLtMfjfpsKHAD/6hQo2K2evvamoVZw
 ZIpZiUfS+3QU4lyNvM2/PlqY2zEVHnHKOfCUXu+gjd3KbbOmOLHUbE/mP
 CfrdNMYSYcLMojSsDx+xrbPEocZFR/6bUfhOAgpkEOHEqW41rtKFaEOiR
 9R+NMXUNcDaA6RNOoWYwm6nYXlSSAOy77pgHPI+o+3QsjuHny1M92U7d6
 btQGJJXqasgWVsBPvEj4PU+sRV/7bFnSDq+ZpORox1v2EQzKSoTpFVTie Q==;
X-CSE-ConnectionGUID: pfY+xKe9QPy6xClEnTNscw==
X-CSE-MsgGUID: X9Ok/21vS8epmmb2tauRkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="82382235"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="82382235"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 08:29:13 -0700
X-CSE-ConnectionGUID: VTaRvAiaSlKm14/Y6Nh5Fg==
X-CSE-MsgGUID: HFIYJWlgRxmnMhHUF3+uiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="238836236"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 08:29:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 08:29:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 08:29:12 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.67)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 08:29:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dT2FyvUD5PLFPydvaegwZ7sFAVYxHyz8NeZKnf7eCxCTePn7uUhRIrIAD11xHCtp4GWWAl1EM2B9aJg4a349kwTpNXtQ8P3K6p3P8iBLzVMlmT0Su5oPXK8aw4L0aUCnptdEAB7KBGPibRTC0sGxPoQALtOlh4R8X++RC5zSND3BJfp9QjiNqeuyeiPhNVUygW4W3L+UhjROpX9TVqwmOWZMzrpWvPjI7T1qrYQc9sq1DqMgM0t75MY9PiFHq12cyn1JnAA3kW8veH4Kly6QSqF2wT+WXPYz6AnDS+G2GUFXFIsJLdGl954MWJ3UD41Xf8O/QH8FoVBDPSTqsW4WGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0bacb+bBzwVC/cg2USr2qSvvJJrRVrrfS1mZNVi1K0=;
 b=ju7FzIbmHv3sGhUveax68tS57Z+SiCD6tsdNFOEaOeLcFamkH4FheEshm4/j3/yo9wgEdWguFHnuhrVzaNmTq8Sk6hf94zIjxQG/jane7lIANiZJhcXNA1MoSjPgkyDQE+X0IdV5UP4HiiIsdAZu2iqgwx/eRVsdtT7d2M4EL/t1KtFzCveI2RLLCK3iPVE1G+0F+JhGuJTlVitW4q+n8Cjvh5IJ5TU2NRSHtId0ZR8aKrSP5mgDyzY0/3nkG+nau8Q4L+5EXuCVwDTQufKBInpwbexdkWZXFlGLXKNLuRvubWarmq3WCQEwCBx1Tm/mKhYEQ8CZ216LA9UwKV47KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 15:29:07 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 15:29:07 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Manna, Animesh" <animesh.manna@intel.com>, Dibin Moolakadan Subrahmanian
 <dibin.moolakadan.subrahmanian@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t v4 7/7] tests/intel/kms_pm_dc: Add
 dc3co-vpb-framegap subtest
Thread-Topic: [PATCH i-g-t v4 7/7] tests/intel/kms_pm_dc: Add
 dc3co-vpb-framegap subtest
Thread-Index: AQHc4Wp8q6FZV3iuA0qQtEBom0DNJbYLnA8AgAOePvA=
Date: Fri, 15 May 2026 15:29:07 +0000
Message-ID: <DM4PR11MB6312373233EDE31098FAC66690042@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260511171820.461666-1-jeevan.b@intel.com>
 <20260511171820.461666-8-jeevan.b@intel.com>
 <d086c5dd-bd9b-419f-ba97-5ddc857a627f@intel.com>
In-Reply-To: <d086c5dd-bd9b-419f-ba97-5ddc857a627f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CH3PR11MB7914:EE_
x-ms-office365-filtering-correlation-id: b13fb528-569d-4a1e-f94c-08deb296b42a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|11063799003|56012099003|3023799003|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: OcakP9Noa/sL89Q/MH7zosg0NYLYhxDuV8QrkaaOboiFP+2nj9YloQy1nMQpP27hVNCFw78ItaB1EJ+/DiHK/EZUJekxJd1j5XSrqgveBpm7hibDb1OIdSzoXccJjUOoVLqNHi3OtM9PlEAtggjwua/JK0Dzx6Eu9dFJ8c+l0UzoO26AmtO1k5Ij4ZrFoLSYRcaUeReD/QCFqarVG4j8wbE/Ir7v3yh3SlEivDYRNw7CMKTGZ5W10Ai0nM4mrfuUGdK+tU6431Pn5HAma8dg9IBOOoeniDiVbdYQbi4g2NLWqhuDEGR79+ZhcqWLm68gDNkNGSaYhrE+ytfry6gFQv7TGqvmYYR7w+84PSjGR93DRH95C7Kzu+3O7Kq0oNNjSE+YytB6t/+zMm67sKak3fU+NTf6HSGdOTPK2qTTVeC9N/zidbOwExHaCo3LVMGD5eB9rbwdUTaXak9FZDxGgRq462KMbmHaveX1ORMzPwJCeRbTho2JYDAJwTiFOPbSfSyxatEeQdMFVj2VooblQ+uYsE3vLlzzkF9OtzE9ax+UHBfDZfjaPxES/7BG+nM2A3p9OZOptOwVVg7b1Pax0EHINYU1in8G9Qvj/U89SlXhTIq6LDY5LpgU3M7LZDSl/mCKsppCIgmgbLnb4+1ldAHvcJ3YeO4yhk+vfUWQsCLguiBkobH4AhB3GerKIzjxlL8ru6MtwqAK3qAAakEuQRl8OYJXiKozetPYLqNv4a6BakBf1VwuXx0tFjkejoU6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(11063799003)(56012099003)(3023799003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWR6bVZHalBFb3ZhbUladlhpNzkxUlRKSCtYNC80cGtKeVBySi9tc3BmUWdS?=
 =?utf-8?B?dlpHYzFGY2huTmU2ejJieUM1NEtYUmdHTldpWU1LQk9pNDZSa1NaMGhHMjY0?=
 =?utf-8?B?TjlmTE9oYkRQaGVSZFRhRzM0UTcycmljdnNDdGE1aTAxU1VJMkpENXI3Ujht?=
 =?utf-8?B?MEU0eE5ETWVkaFhGQmdsREVReGFYNmQ5SEZVODlUOXVvM1V1VW5GanZ4M0d4?=
 =?utf-8?B?MG1ObWdqejExNk9qU21reWtIYTlUUTBPUjRkMExucHVDL3VMUUhWTldaTVB2?=
 =?utf-8?B?YmJkQStiaVh5aDZqcm1RVWdWSllHRnVLL1gzT2pBcFF3NWcvMmZ3WGgzL2Y0?=
 =?utf-8?B?SWtJZjc0WEpydUtUU09kbzh0dThnUTNNcnlxNUV4VlpacXNxNUFKdldVL2kr?=
 =?utf-8?B?cHNpb1VZZnc1RzJOcjRoTk1aT0Y0M0ZwVWJuK1B3S3drOS9TTGZRbFQ1Q21E?=
 =?utf-8?B?cTlPL05LYVZodU14TW01QlkvNGdNemo5SEJPa0R4L2srTWp4Q05sUWVQNmg5?=
 =?utf-8?B?dHpNbHo0QXNrSTlPdHU4MEZGT3VsaHk3Z3c2S0h5YTd3c1ZGK25CYlJjV29G?=
 =?utf-8?B?Rld4Sm1hNko1bEYzR2sxSng1WGwzOFJkTEZZa3VydkFEUDU3L0NhbHhYWUdH?=
 =?utf-8?B?dzNybVhNQkFYa042TUxQUTkvTmdOeWdVQVVtM1lhc2xZaENGd2xtRE9ZdERM?=
 =?utf-8?B?clgyV2lBcmYrcVFXR25YdVVLTm9PS2c5TWRaU1lCL0xJSkJEaCtSck9uUkVQ?=
 =?utf-8?B?ZnM4T0N6SHVDWHEzUXZUbi8vcEpDb2VJcGVzODJkL2JzWnl4N29PZGpJdFAz?=
 =?utf-8?B?NUlBSG00UE00SmxiV1hCY3l1d2Z3QU9qSHhMV1ljc0RNMkxuV1grcFBPMk91?=
 =?utf-8?B?d3VPQU83T2MvVjNuc3JNZU5UZGkrTVdGNmJMV0J6MkcwWnNFd1lQZTRPUlNs?=
 =?utf-8?B?Vy9CN1ZnejdaZWRJNTh1bzJTalFEdmJUUkhkUEFuWGRZWWJnVkY3cjU0bkFR?=
 =?utf-8?B?YW5CaXZDNmVnK3lNbUxZMzFON0RiTkFFK2F0UVFsQ09GMlNaeE5YQjBQVzZR?=
 =?utf-8?B?MkFsazV3eHlIZHpLdFBwZFlnNkFJWG9ESlJ6R2NJMXI0ZnVKUmZKbjY0ZE5X?=
 =?utf-8?B?Wks4OGhyelNhTGZuNVBKeU81bnZUZjgxV0dON3RESWFNNk5lVDhaZVphcWdl?=
 =?utf-8?B?NUoreWlaTnBIMk95cThSUHFoNnNtKy9NRzdGaTBxNytCVTAwUWlKNUV4NExN?=
 =?utf-8?B?b3llbjVwemdRMUlBQXNsWnM0b1N3OFczcVhNa1lVSDgzeW5ldkZ4UDdTUWtl?=
 =?utf-8?B?WG1OemVPN1M4KzBPRWxBOXhKRmxKVTRJUklBb3JNL25keno0enZIN3lhdURJ?=
 =?utf-8?B?VnBHYXRhQ3VNV25jTTNqcjBpSXdtdVBmN1YrWDZOakJDUU5wY0tPb1hzeFdL?=
 =?utf-8?B?SGdNWmxENGRySEk1UmdKazVOV0JHb3JFTUtkcWsyTGJVUldqU2xEUFluU1R4?=
 =?utf-8?B?UmozTUpNTStaN3NqWTFnV2hUT2NUMHBKSjkyZFZWeE0zNUEwOTYyK2J0U3pn?=
 =?utf-8?B?YTJEaUN5UlowL2duTVhYak5jUzFwWGRuSjJGalQ2OXF4eWJEUU1DcGpRTDhV?=
 =?utf-8?B?VUt3RTV3aWhJT25BSThaUjh2WkhNa0xFdGRWVm0yTTlnZXh6Ly9yS2IyZ3Rl?=
 =?utf-8?B?OUc3NFpzenR6Z0hWWXl4RmxJSFhZRTlaVFVEdS9ZblNQdkVtbndqZWR1WjJv?=
 =?utf-8?B?a3VZdnhRUk9EcGl1L2dKT1Rwbk1Da0dCd1o5OUNLbkFkN2luV3JWS3FaU1lm?=
 =?utf-8?B?MVorcUxENzhLTWdDSDVqUmYzemIvZFNVYXFLNFdpRG1FOGk0RTBUVlA3YlVo?=
 =?utf-8?B?REdwbzdPRmIveUxlVFNnU2Z0cVNISkVPMmRTNVBKK2tiZmxhWk9ZSVQvcU9H?=
 =?utf-8?B?ZUc4QkdkWkRZem9TMkozUTRicTZlTkZjZkRrNFBtZzg0eXJQVThwY1NpWGJW?=
 =?utf-8?B?UEltV0grWHlpZFNoeC9rbWtTZ1pGM2hJT0psaDdXTnBnK0FtTEFvaWpKb0RL?=
 =?utf-8?B?cU85VnRpRkIyK0VmNE52eU9Yd2RrRjlWSDF4enIwWnhiRHltMWtDNncxZzJh?=
 =?utf-8?B?RTlORFhKSHJtaktCUU56ZXlBbXNGaVZKZ0ZvUTgxcHRQRnJ3L0NLWkQ5MTFh?=
 =?utf-8?B?ODN1L0puelNmSkRMTGtXbHQ5anpabEtwV1VyT08wSjlBbmQ3VE1lWWh2YXpz?=
 =?utf-8?B?WU5nNU1RaElRVG9rcmFXaGN4Ujg0VWNRM2tudWJtejFPSm9ER1VLRGwrSWdP?=
 =?utf-8?Q?fv2hEmKA293nDq18+v?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HAxVpiY6Jf8gyfgUmEgX18+GsEfP4NexBTuMur32PgVvCaZPr2VOVVt108pf0RGDNO+e+fjIZ8IfvNIoDFms8JJSTY7/gFmT37R+njGBISuq91RDqEEazd5+oqyh5cp2TNFyscRCZ2fNdhx5oaS7KFEFlEfrQLGviMNBLxXQUuIS1YpXoZREWj6u9Euqd7SJLScg9ytmypJHBPbR7iEjLb1rK+JQr4n1AmMthCylIp22F32uOrZxG8YBwufBmTgZlktcoJNZoTNWA7QSnyMlr5gNnecnwXgWfyNqgh4ZLa4XlxHuWV/hwVhM8Yww59AwYnoQs194Y2obausbq/uAQQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b13fb528-569d-4a1e-f94c-08deb296b42a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 15:29:07.0699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4bCEGZrBlxLpi5DjAkQiUGCUaMdeu8SPol+epGLeFKRMQA41EvqVfat2/WGkX8z/GE8+wYgysA05OyWYXTicsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOYWxhZGFsYSwgUmFtYW5haWR1
IDxyYW1hbmFpZHUubmFsYWRhbGFAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1heSAx
MywgMjAyNiAxOjM3IFBNDQo+IFRvOiBCLCBKZWV2YW4gPGplZXZhbi5iQGludGVsLmNvbT47IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBNYW5uYSwgQW5pbWVzaCA8YW5pbWVz
aC5tYW5uYUBpbnRlbC5jb20+OyBEaWJpbiBNb29sYWthZGFuDQo+IFN1YnJhaG1hbmlhbiA8ZGli
aW4ubW9vbGFrYWRhbi5zdWJyYWhtYW5pYW5AaW50ZWwuY29tPjsgVGhhc2xlZW0sDQo+IE1vaGFt
bWVkIDxtb2hhbW1lZC50aGFzbGVlbUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
aS1nLXQgdjQgNy83XSB0ZXN0cy9pbnRlbC9rbXNfcG1fZGM6IEFkZCBkYzNjby12cGItDQo+IGZy
YW1lZ2FwIHN1YnRlc3QNCj4gDQo+IEhpIEplZXZhbiwNCj4gDQo+IE9uIDUvMTEvMjAyNiAxMDo0
OCBQTSwgSmVldmFuIEIgd3JvdGU6DQo+ID4gQWRkIGEgbmV3IHN1YnRlc3QgdG8gdmFsaWRhdGUg
REMzQ08gY291bnRlciBpbmNyZW1lbnRzIGFjcm9zcyBmcmFtZQ0KPiA+IGdhcHMgZXhjZWVkaW5n
IHRoZSB0aHJlc2hvbGQgZHVyaW5nIGEgdmlkZW8tbGlrZSB3b3JrbG9hZCB3aXRoIFBTUjINCj4g
PiBlbmFibGVkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmVldmFuIEIgPGplZXZhbi5iQGlu
dGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHRlc3RzL2ludGVsL2ttc19wbV9kYy5jIHwgNjkNCj4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50
ZWwva21zX3BtX2RjLmMgYi90ZXN0cy9pbnRlbC9rbXNfcG1fZGMuYyBpbmRleA0KPiA+IDZkMmJk
MGVlMS4uYjhkOTAzZmQ1IDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19wbV9kYy5j
DQo+ID4gKysrIGIvdGVzdHMvaW50ZWwva21zX3BtX2RjLmMNCj4gPiBAQCAtNjAsNiArNjAsMTAg
QEANCj4gPiAgICAqICAgICAgICAgICAgICBleGl0IGN5Y2xlLCBlbnN1cmluZyBEQzNDTyBpcyBu
b3QgYnJva2VuIGJ5IGRlZXBlciBwb3dlciBzdGF0ZQ0KPiA+ICAgICogICAgICAgICAgICAgIHRy
YW5zaXRpb25zLg0KPiA+ICAgICoNCj4gPiArICogU1VCVEVTVDogZGMzY28tdnBiLWZyYW1lZ2Fw
DQo+ID4gKyAqIERlc2NyaXB0aW9uOiBWYWxpZGF0ZSBEQzNDTyBjb3VudGVyIGluY3JlbWVudHMg
YmVmb3JlIGFuZCBhZnRlciBhIGRlbGF5DQo+IGdyZWF0ZXINCj4gPiArICogICAgICAgICAgICAg
IHRoYW4gNiBmcmFtZSBnYXBzIGR1cmluZyB2aWRlby1saWtlIGxvYWQgd2l0aCBQU1IyIGFjdGl2
ZS4NCj4gPiArICoNCj4gPiAgICAqIFNVQlRFU1Q6IGRjNS1kcG1zDQo+ID4gICAgKiBEZXNjcmlw
dGlvbjogVmFsaWRhdGUgZGlzcGxheSBlbmdpbmUgZW50cnkgdG8gREM1IHN0YXRlIHdoaWxlIGFs
bCBjb25uZWN0b3JzJ3MNCj4gPiAgICAqICAgICAgICAgICAgICBEUE1TIHByb3BlcnR5IHNldCB0
byBPRkYNCj4gPiBAQCAtNDMzLDYgKzQzNyw2MyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2RjM2NvX2Zy
YW1lZHJvcChkYXRhX3QgKmRhdGEsIGVudW0NCj4gcHNyX21vZGUgbW9kZSkNCj4gPiAgIAljbGVh
bnVwX2RjM2NvX2ZicyhkYXRhKTsNCj4gPiAgIH0NCj4gPg0KPiA+ICtzdGF0aWMgdm9pZCBjaGVj
a19kYzNjb193aXRoX2ZyYW1lZ2FwX2xvYWQoZGF0YV90ICpkYXRhKSB7DQo+ID4gKwlpZ3RfcGxh
bmVfdCAqcHJpbWFyeTsNCj4gPiArCXVpbnQzMl90IGRjM2NvX2NudF9iZWZvcmUsIGRjM2NvX2Nu
dF9hZnRlcl9nYXA7DQo+ID4gKwlpbnQgZGVsYXksIGxvbmdfZ2FwX3VzOw0KPiA+ICsJdGltZV90
IHNlY3MgPSAzOw0KPiA+ICsJdGltZV90IHN0YXJ0X3RpbWU7DQo+ID4gKw0KPiA+ICsJcHJpbWFy
eSA9IGlndF9vdXRwdXRfZ2V0X3BsYW5lX3R5cGUoZGF0YS0+b3V0cHV0LA0KPiBEUk1fUExBTkVf
VFlQRV9QUklNQVJZKTsNCj4gPiArCWlndF9wbGFuZV9zZXRfZmIocHJpbWFyeSwgTlVMTCk7DQo+
ID4gKw0KPiA+ICsJZGVsYXkgPSAxLjUgKiAoKDEwMDAgKiAxMDAwKSAvIGRhdGEtPm1vZGUtPnZy
ZWZyZXNoKTsNCj4gPiArDQo+ID4gKwlkYzNjb19jbnRfYmVmb3JlID0gaWd0X3JlYWRfZGNfY291
bnRlcihkYXRhLT5kZWJ1Z2ZzX2ZkLA0KPiA+ICsJCQkgICBJR1RfSU5URUxfQ0hFQ0tfREMzQ08p
Ow0KPiA+ICsJc3RhcnRfdGltZSA9IHRpbWUoTlVMTCk7DQo+ID4gKwl3aGlsZSAodGltZShOVUxM
KSAtIHN0YXJ0X3RpbWUgPCBzZWNzKSB7DQo+ID4gKwkJaWd0X3BsYW5lX3NldF9mYihwcmltYXJ5
LCAmZGF0YS0+ZmJfcmdiKTsNCj4gPiArCQlpZ3RfZGlzcGxheV9jb21taXQoJmRhdGEtPmRpc3Bs
YXkpOw0KPiA+ICsJCXVzbGVlcChkZWxheSk7DQo+ID4gKw0KPiA+ICsJCWlndF9wbGFuZV9zZXRf
ZmIocHJpbWFyeSwgJmRhdGEtPmZiX3Jncik7DQo+ID4gKwkJaWd0X2Rpc3BsYXlfY29tbWl0KCZk
YXRhLT5kaXNwbGF5KTsNCj4gPiArCQl1c2xlZXAoZGVsYXkpOw0KPiA+ICsJfQ0KPiBJbWhvLCBp
bnN0ZWFkIG9mIHVzaW5nIGxvb3BzIGFuZCBkZWxheSBjYWxjdWxhdGlvbnMgdXNlDQo+IGlndF93
YWl0X2Zvcl92YmxhbmtfY291bnQoKSBoZWxwZXIgdG8gZGVsYXkgcmVxdWlyZWQgbnVtYmVyIG9m
IGZyYW1lcy4NCg0KVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4NCg0KaWd0X3dhaXRfZm9yX3Zi
bGFua19jb3VudCgpIHdvcmtzIGZvciBpbnRlZ2VyIGZyYW1lIGRlbGF5cywgYnV0IHRoaXMNCnRl
c3QgdGFyZ2V0cyB+MS41IGZyYW1lIGdhcHMsIHdoaWNoIGNhbm5vdCBiZSByZXByZXNlbnRlZCB1
c2luZyBpdC4NClNvIHRoZSB0aW1lLWJhc2VkIGRlbGF5IGlzIGludGVudGlvbmFsIGhlcmUuIEkg
d291bGQgcHJlZmVyIHRvIGtlZXAgdGhlIGN1cnJlbnQgYXBwcm9hY2guIA0KPiA+ICsNCj4gPiAr
CWFzc2VydF9kY19jb3VudGVyKGRhdGEsIElHVF9JTlRFTF9DSEVDS19EQzNDTywgZGMzY29fY250
X2JlZm9yZSk7DQo+ID4gKw0KPiA+ICsJbG9uZ19nYXBfdXMgPSA3ICogKCgxMDAwICogMTAwMCkg
LyBkYXRhLT5tb2RlLT52cmVmcmVzaCk7DQo+ID4gKwl1c2xlZXAobG9uZ19nYXBfdXMpOw0KPiA+
ICsNCj4gPiArCWRjM2NvX2NudF9hZnRlcl9nYXAgPSBpZ3RfcmVhZF9kY19jb3VudGVyKGRhdGEt
PmRlYnVnZnNfZmQsDQo+ID4gKwkJCQkJCSAgSUdUX0lOVEVMX0NIRUNLX0RDM0NPKTsNCj4gPiAr
CXN0YXJ0X3RpbWUgPSB0aW1lKE5VTEwpOw0KPiA+ICsJd2hpbGUgKHRpbWUoTlVMTCkgLSBzdGFy
dF90aW1lIDwgc2Vjcykgew0KPiA+ICsJCWlndF9wbGFuZV9zZXRfZmIocHJpbWFyeSwgJmRhdGEt
PmZiX3JnYik7DQo+ID4gKwkJaWd0X2Rpc3BsYXlfY29tbWl0KCZkYXRhLT5kaXNwbGF5KTsNCj4g
PiArCQl1c2xlZXAoZGVsYXkpOw0KPiA+ICsNCj4gPiArCQlpZ3RfcGxhbmVfc2V0X2ZiKHByaW1h
cnksICZkYXRhLT5mYl9yZ3IpOw0KPiA+ICsJCWlndF9kaXNwbGF5X2NvbW1pdCgmZGF0YS0+ZGlz
cGxheSk7DQo+ID4gKwkJdXNsZWVwKGRlbGF5KTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlhc3Nl
cnRfZGNfY291bnRlcihkYXRhLCBJR1RfSU5URUxfQ0hFQ0tfREMzQ08sDQo+IGRjM2NvX2NudF9h
ZnRlcl9nYXApOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCB0ZXN0X2RjM2NvX3Zw
Yl9mcmFtZWdhcChkYXRhX3QgKmRhdGEpIHsNCj4gPiArCWlndF9yZXF1aXJlX2RjX2NvdW50ZXIo
ZGF0YS0+ZGVidWdmc19mZCwgSUdUX0lOVEVMX0NIRUNLX0RDM0NPKTsNCj4gPiArCXNldHVwX291
dHB1dChkYXRhKTsNCj4gPiArCXNldHVwX2RjM2NvKGRhdGEsIFBTUl9NT0RFXzIpOw0KPiA+ICsJ
c2V0dXBfdmlkZW9wbGF5YmFjayhkYXRhKTsNCj4gPiArCWNoZWNrX2RjM2NvX3dpdGhfZnJhbWVn
YXBfbG9hZChkYXRhKTsNCj4gPiArCWNsZWFudXBfZGMzY29fZmJzKGRhdGEpOw0KPiA+ICt9DQo+
ID4gKw0KPiA+ICAgc3RhdGljIHZvaWQgdGVzdF9kYzVfcmV0ZW50aW9uX2Zsb3BzKGRhdGFfdCAq
ZGF0YSwgaW50IGRjX2ZsYWcpDQo+ID4gICB7DQo+ID4gICAJdWludDMyX3QgZGNfY291bnRlcl9i
ZWZvcmVfcHNyOw0KPiA+IEBAIC04NjQsNiArOTI1LDE0IEBAIGludCBpZ3RfbWFpbigpDQo+ID4g
ICAJCX0NCj4gPiAgIAl9DQo+ID4NCj4gPiArCWlndF9kZXNjcmliZSgiVmFsaWRhdGUgREMzQ08g
Y291bnRlciBpbmNyZW1lbnRzIGJlZm9yZSBhbmQgYWZ0ZXIgYQ0KPiBkZWxheSAiDQo+ID4gKwkJ
ICAgICAiZ3JlYXRlciB0aGFuIDYgZnJhbWUgZ2FwcyBkdXJpbmcgdmlkZW8tbGlrZSBsb2FkIHdp
dGggUFNSMg0KPiBhY3RpdmUiKTsNCj4gPiArCWlndF9zdWJ0ZXN0KCJkYzNjby12cGItZnJhbWVn
YXAiKSB7DQo+ID4gKwkJaWd0X3JlcXVpcmUocHNyX3Npbmtfc3VwcG9ydChkYXRhLmRybV9mZCwg
ZGF0YS5kZWJ1Z2ZzX2ZkLA0KPiA+ICsJCQkJCSAgICAgUFNSX01PREVfMiwgTlVMTCkpOw0KPiA+
ICsJCXRlc3RfZGMzY29fdnBiX2ZyYW1lZ2FwKCZkYXRhKTsNCj4gPiArCX0NCj4gPiArDQo+ID4g
ICAJaWd0X2Rlc2NyaWJlKCJUaGlzIHRlc3QgdmFsaWRhdGVzIGRpc3BsYXkgZW5naW5lIGVudHJ5
IHRvIERDNSBzdGF0ZSAiDQo+ID4gICAJCSAgICAgIndoaWxlIFBTUiBpcyBhY3RpdmUiKTsNCj4g
PiAgIAlpZ3Rfc3VidGVzdCgiZGM1LXBzciIpIHsNCg==
