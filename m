Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374CECD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 07:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF80510E414;
	Wed, 20 May 2026 07:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEMgppcr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D96910E414
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 07:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779262143; x=1810798143;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=02HrIdL+HMc1/OAW9o+XpzL9M+j3JwsDP/zVROBwdDU=;
 b=VEMgppcrFgC7XFiKwWsTMY2EQUkPGwh20U2XqeC4zsRELlXiK3QZXq+w
 HP281HHnQZ01ErFaL6mQp8iX2l6OKpUAY2kJeHXEMBBL0k9XwoR4vFELy
 +DWVzVlCvVdB32rFxLpg4LJZ2Szfw4HiMe5SE4nmvXlD1YEtqjiapsTPJ
 yq5KpCQ+l2znK9CyIcNL+Arc8TQtg5k0ILg5mubfCb8kzwRJaQoWNYtgy
 9Wyf2o5HyLCES00rjP2TkNkUo6AvYmpmbJlHP8HLfBYuc3QGhcCrlEJi6
 kjIsk6DSfautgk7oJy5yR58sVtePkOaxMIl8ZFc2DIsVsQz0+hmuiZ6jl A==;
X-CSE-ConnectionGUID: F1TIcmlBTTO1dNfiV8vNeQ==
X-CSE-MsgGUID: nSirUhoYSJKdANESqDXPXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79878197"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="79878197"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 00:29:03 -0700
X-CSE-ConnectionGUID: BISd9BBtRuuf3GbFZ86Qqw==
X-CSE-MsgGUID: +5hvC6XCQOKoTW0RO8Mrhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="263573316"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 00:29:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 00:29:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 00:29:01 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 00:29:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzNvqui0mpb/k6HYbz4jEiv7NyqWvY3omYPaNFNBW8aZFF1feiwAixrGpVtClBXreocUFKgxPF50FxefDg31cGKJPSRuO5h11dGJhSCsulb8EctN5/U8Xf7JPf4JG1yLJ3P8wlDr5HGRiOo6GYmsIB20jO9saCmnkUlw+vlQPS5XHOILXx5mC2VLNtOqvTtO2B7ZNcMoJo+ZEaC5CRhXoImp9zcPkiAjKcgmaTSaHj941WbYRoKsG0XsYobMstLOg5di454BmIUx4+G8kGOoHQ4S0tn0e+uksxM31xGmw8HLm0cZMFz+uz7YhUYi996KHeKaOg3thCWUS0HLmtyPJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02HrIdL+HMc1/OAW9o+XpzL9M+j3JwsDP/zVROBwdDU=;
 b=ffz++Czj51CbY5DH7JYDOtOGhSsXBuzY2wriwTOarQfZ4UHOVW258Xp4rNCJHKG/KuCN4lPMZL1WfCgiyNb6cgaBXKaklS93Z2WfXO8+B6yHZQLdGiyTvPSRvFFotcKUCjJ+t7rdT8+mBJl8G/bXfLURcBTCsGmwaHKjDVZ9kHqPYY5GPKnOiqiMtfPLp9lqdCA2QE0Y3KX6HDAO9cp9I6ZHrvUk/lUg6+MmltOQYS1rSqsTjx/r+NAYH0hZ2bw0FdP4qfuaoBvGnhWKruFy3/KuLMSWEb56E/p/c7pzK55S22sQEGoYMuh/95VUc2VJRPNxY+1IfslMGp914Qj48A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SJ0PR11MB5136.namprd11.prod.outlook.com (2603:10b6:a03:2d1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 07:28:58 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 07:28:58 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: Maarten Lankhorst <dev@lankhorst.se>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/4] lib/igt_kms: Add support for the
 BACKGROUND_COLOR property.
Thread-Topic: [PATCH i-g-t 1/4] lib/igt_kms: Add support for the
 BACKGROUND_COLOR property.
Thread-Index: AQHc3MenUJyEyFa87UqjAV6RBlB4ubYVUhUAgABFqICAAQD30A==
Date: Wed, 20 May 2026 07:28:58 +0000
Message-ID: <PH7PR11MB60537748E01DF54AF5F8FCBBE7012@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260505194419.500600-5-dev@lankhorst.se>
 <PH7PR11MB60537336D612475147EEC667E7002@PH7PR11MB6053.namprd11.prod.outlook.com>
 <20260519160045.t5d35zsxm3qoaugj@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260519160045.t5d35zsxm3qoaugj@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SJ0PR11MB5136:EE_
x-ms-office365-filtering-correlation-id: 664b33f9-e05c-4bb5-dff9-08deb641750c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003|38070700021|11063799006|4143699003;
x-microsoft-antispam-message-info: mEguGnfmwO58M8G0ZosOP0hMh4+mrC9BGqSTJlcw8Gq8lFT4ifiXzoto1iWnhgkeN29ZMD6RmZmZQj44lk8clTjnUUMwtdZ1eM8Rwsh5JQb9GjNzf4xSX1YzvcoqrtOc0TDhu1RD7bgVcX99dAypVdSzV6QiIsuVXs7zn0tMS3LKQF4PwHxjZ+XIElOehXF7z6h35lPTnGcww4sHj2Av1Nn32UpwI7n1arwqSZs/gK+x8H2isFuaXE/B9I74Fu6c/QkmlYQij4SnYm8ko/IlczdqzdYOxA5eSu3LQX4tn1qvT1QRZZ9Tg4dUznnw9ytiClh0Oy0+HlCgaagTUh/5+VaW+SnAzmcBm1wjtGuPnYx7eeZfFYVjn44PIgMPGC2AUDQmKr91q4xYAi8LfV7HbPD1m0lY6RatQuvR/gidZCNbdZBkY2lQFfKjDwlhiuQHF5HiJvU41LJGQWrynw8/1FM1EMndlb/Y2BBDoW+bg2LDlYno68Pr2hk5AiQK6IG90gFCv7GK50iYVkfGflhOexr24AnqgQLa1pPVIj1+K8W0GZ/GLGp4TysAKiHM9q2GLlKL1R6XV1HBmQk/2pOKaqJ7o1B3Edtfr+F5UqKByCaKcZczdCY62qkxM8fK3wP4X6gV/V9D2eHvfWk2PWKKyyIPsRv99PGf5o8Y5XCQOnKMm2k8recx2IGjZ68H6TAcOgHCgZ6rCnd5Cf1alASVphFY2M2vHzcQbzQcEWtuoZZETGkp6wiY18qnN5KkMOsS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003)(38070700021)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWpVWHFQVWZORmh4K09GNTJrc2E2TTljVDl5Y0IwdHdvNmNnTEFqSElFRGts?=
 =?utf-8?B?cy91enJTWnRpbmJOb0FIb2dab3dndkdUT0cxVlR4MWdEVXh2Wis4WThBZjY0?=
 =?utf-8?B?cHpKUXI3dGdGQzZCRUhMWm9nUkVKanRMM2NPVVhFUHdlaGwxVDhuWEdUZUox?=
 =?utf-8?B?Qjdvamhkc2c5QnFONUJHalJBVnUrNnM5dXc3TXBQZlJkdnN6LzhVUnJFMk5T?=
 =?utf-8?B?K0YrU2RNYm80OHZzdGtnR29vMUtFeWZ4dytNKy9pejdLOHNRSzlDRE10WW45?=
 =?utf-8?B?M0FjTVoweVFvbkdhRmlrZGFtdVBySnJTem96ajJTMGVvdmNqazR1Q24xYmFR?=
 =?utf-8?B?endhOTVkd0cwVmdybmoxQXgrNTRUbDVIQmJpM1R5dzcrZGtNdkkrTUpjbFRx?=
 =?utf-8?B?Vld3TGtIZk5ZZDcyL0J4WTNyZTZMQlJLZUpodUZxVmhPSVpvY0kwYXk3K1hY?=
 =?utf-8?B?dmlhV09ieFdZZ0pPZDJZRDZnNEVXQjdrK2cvdmtUNXc2Zy9CbEFSOThnTVdy?=
 =?utf-8?B?T2FPV2NJWkN2SHBTd3c2NTZDTElRTlRQTnl1MzFXdUFKMTJGVzFxMmxrdzhx?=
 =?utf-8?B?SUZLeHJ5bzNoUnIyMWNJUm9BU25OblVLVzJyOE1PbEwySlJ1QWRNSWpEblB1?=
 =?utf-8?B?bTdrNTBlY2RISUJWbW1aaTVGZ2swZVBMb1hqclJCN0MwaVRCOVQwZmtzaHlW?=
 =?utf-8?B?aGIrcjAvTVVGSjZpcU50a0VSZHhQWGZQWDIxTzJvZkNnWmVSWkQ3T1FKNkhI?=
 =?utf-8?B?cmVyVXVzL0dmeXprcm93RlNWVFBMaXpGUWk0aC9RSGpycVI1cU5GMC9TZ1RK?=
 =?utf-8?B?UkhnQkR6a2NLdW05N1IxQ2hZWEJjSUs5bksyNDlTYnU2d1FJWVNxUEhFR2k5?=
 =?utf-8?B?UGl2a0J4RjBQUWEvTUI3UklGU0RVcjNBNDN2R21SbDgvdGh1QVhRZDhWczJl?=
 =?utf-8?B?Z1ZKUThrV3RpY0VvR1dHSC9mdC9iSW5jQVdxNFVkeTFVTXRaYWQrbnd0SEEv?=
 =?utf-8?B?TExnU1FmcTZDSTFVMXk5eDVQTjlVcVJyQk5EUDFpSk5WN1g1UHJEdS9pai8v?=
 =?utf-8?B?aDlKWGhwenZPZXZqNTNlNWhHL3VnRERlTTE3UGxndlU4cU1JejF6UjNLMG10?=
 =?utf-8?B?ZkJWMk9tSFJ6eUdTeXMxTVpqd2ExZXRwNnY1R0JDMmpuNHZUUTlEUWFiM3c4?=
 =?utf-8?B?QXVVeTB1bG5KUm8vZ0Jwd0dVSlR5eHlOR0gyRUt6SHVXY0xFeUpNUnNMU3Mz?=
 =?utf-8?B?MDZOQkdkM3pIdHozRkJZZis3dUtrelFKTk1yYmhsdDhlVWs1QXhxMnlpNWJS?=
 =?utf-8?B?bUxoME80cWQwVnh3MlQrc2cwREs2enhZSjQ3aVMwVTBnb3hvV0phb1NLSWRF?=
 =?utf-8?B?QzVJc0p3akNwdEVMK3RyK0NwT2UxWWEySytKSFdkV2d1UnVLd1FyelFwNkx0?=
 =?utf-8?B?ZURmZ3ZjL1Y1RzZUTXgvR0RTdFdTdmkzR3A0c1BORjFUcVR3aFl4eHZEQkxr?=
 =?utf-8?B?cjUvelFjYlI0dkZRYVVHay9aUFRYNmJtTEFLL2p2WERxdVY0RkhmbzBaeU4v?=
 =?utf-8?B?V0t2Zksrb1BhTmdLbEU2MkFSd1pzSEo0eHBIbDNBSVNoOEk0R1lrVVhVaE9j?=
 =?utf-8?B?SGN6ZS9LaXovMkpsOStaYk9mMEVSUXZBWE1oVHBQdlJXdytiLzhmWU1XTEE5?=
 =?utf-8?B?ZS90bE12UmtOQ0tHQkRSU3FCWjVUSUV1cHc4VjkvUFN6SC9hdG9EUnRaQ3Rn?=
 =?utf-8?B?MENBVUNqQ3IxclNVYWQ1VmdUREY4R1AvYU54RG9zTElxbC9OTFpRUHpJdVV0?=
 =?utf-8?B?T0ZmaTA4L0hDdkhwZzJGaVBWNUFnNzhjR281TXFLUGJ4ZEl1OUVLS05hK0xV?=
 =?utf-8?B?cTh2dlZLSS92dUk2bkFKUVJ4RzVJN0g4TDVLT05hTjF4SDN4YTlJY1pHZjN5?=
 =?utf-8?B?VDZ2ZHNlcFo0aTU4RndOVS8ySUlUUTRmMzFOaUFSc2dkb2NHbHdRM2UzL3hY?=
 =?utf-8?B?emlaVmZQNFUzZzJEejZIRkFob1BiWUhSZWZ1bGdOMktja2EzVHZxeWFGaTlt?=
 =?utf-8?B?ZDNWcG1LUDd0Q1NabUs2eHNDMXh0L3VpbVZIRm1reE44TUFvWFNjd05FTzU5?=
 =?utf-8?B?bHpPNnY4YzZBYmhpK2ZVT2FPdWNVb1ExMGtTUm9yYmhudG81SDl4Yk81TjRI?=
 =?utf-8?B?RVZqMDZyMFBPcm9yQkwyREF0elA0bzJsTGNiUjZmcDdXdHJFdGdXSldFaFBI?=
 =?utf-8?B?U05HdmNRVDJJS3hJSnNLMWwvOHFyZ2ZuTW1zNWtqSjFMWjY3REt1bDZSMEJp?=
 =?utf-8?B?c201b2xmZU5YR0tOWjhLbWtnUHdVMVc2cmNxdCtJUCt6cFRuMlFZdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Fz1bg0b91morNE6Q7od4t1lxzd7f8mTpKlmTbw+Z0a7VifZPt6iu+Ofu7KGjMUJRaCNME7px0bNpOKzmD5LYC4yKWhfBcbLbuj9jr7KbaUjn1DYx7XS/ac7qcAARLDq91cHEqUKe7XkCSoxSkyimMmm+1WVzTQZUtXdN7cnCqik4w5KMIOu98IDj8I3webTdCeeNbcQY6VJSzoPOSGPoVgljXp4OTFvB/v6hQqwvwowXWdB1tx5Lge30WV6FYyRh1klZTFxuQ+qNrJt2a0ly7kwzvE108aI2AnbHnPtzpjGGGy9c9TA9Yp9eG1TfDUeWUEsqraxaGTwBhluV2mxz+Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 664b33f9-e05c-4bb5-dff9-08deb641750c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 07:28:58.6044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PCHLWNS3F2T8HqCaT8G4PVOcK0NBuCHjVueJ5OsoFrOxk1ut0UUtWFTYg+IXAenUm+N7qcd9kd686lphBi6qXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5136
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

SGkgS2FtaWwsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwg
S29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUdWVz
ZGF5LCBNYXkgMTksIDIwMjYgOTozMSBQTQ0KPiBUbzogU2FtYWxhLCBQcmFuYXkgPHByYW5heS5z
YW1hbGFAaW50ZWwuY29tPg0KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPGRldkBsYW5raG9yc3Qu
c2U+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IGktZy10IDEvNF0gbGliL2lndF9rbXM6IEFkZCBzdXBwb3J0IGZvciB0aGUNCj4gQkFDS0dST1VO
RF9DT0xPUiBwcm9wZXJ0eS4NCj4gDQo+IEhpIFNhbWFsYSwsDQo+IE9uIDIwMjYtMDUtMTkgYXQg
MTI6MDc6MDIgKzAwMDAsIFNhbWFsYSwgUHJhbmF5IHdyb3RlOg0KPiA+IEhpIE1hYXJ0ZW4sDQo+
ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBpZ3QtZGV2
IDxpZ3QtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4g
PiA+IE1hYXJ0ZW4gTGFua2hvcnN0DQo+ID4gPiBTZW50OiBXZWRuZXNkYXksIE1heSA2LCAyMDI2
IDE6MTQgQU0NCj4gPiA+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+ID4g
Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxkZXZAbGFua2hvcnN0LnNlPg0KPiA+ID4gU3ViamVjdDog
W1BBVENIIGktZy10IDEvNF0gbGliL2lndF9rbXM6IEFkZCBzdXBwb3J0IGZvciB0aGUNCj4gPiA+
IEJBQ0tHUk9VTkRfQ09MT1IgcHJvcGVydHkuDQo+ID4gPg0KPiA+ID4gVGhlIGJhY2tncm91bmQg
Y29sb3IgaXMgYSA2NC1iaXRzIHByb3BlcnR5IHRoYXQgY29udGFpbnMgdGhlIEFSR0INCj4gPiA+
IHZhbHVlcyBvZiB0aGUgYmFja2dyb3VuZCB3aXRoIDE2IGJpdHMgZm9yIGVhY2ggY29tcG9uZW50
Lg0KPiA+ID4NCj4gPiA+IEFkZCBzdXBwb3J0IGZvciB0aGUgQkFDS0dST1VORF9DT0xPUiBwcm9w
ZXJ0eSwgYW5kIHNldCB0byBwaXRjaA0KPiA+ID4gYmxhY2sgYXMgdGhlIGRlZmF1bHQuDQo+ID4g
Pg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPGRldkBsYW5raG9yc3Qu
c2U+DQo+ID4gPiAtLS0NCj4gPiA+ICBsaWIvaWd0X2ttcy5jIHwgNCArKysrDQo+ID4gPiAgbGli
L2lndF9rbXMuaCB8IDEgKw0KPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
DQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfa21zLmMgYi9saWIvaWd0X2ttcy5j
IGluZGV4DQo+ID4gPiA5OWZjOWZhMDVjLi5iNzBhZWZlNjk3IDEwMDY0NA0KPiA+ID4gLS0tIGEv
bGliL2lndF9rbXMuYw0KPiA+ID4gKysrIGIvbGliL2lndF9rbXMuYw0KPiA+ID4gQEAgLTczMSw2
ICs3MzEsNyBAQCBjb25zdCBjaGFyICogY29uc3QNCj4gPiA+IGlndF9jcnRjX3Byb3BfbmFtZXNb
SUdUX05VTV9DUlRDX1BST1BTXSA9IHsNCj4gPiA+ICAJW0lHVF9DUlRDX1ZSUl9FTkFCTEVEXSA9
ICJWUlJfRU5BQkxFRCIsDQo+ID4gPiAgCVtJR1RfQ1JUQ19TQ0FMSU5HX0ZJTFRFUl0gPSAiU0NB
TElOR19GSUxURVIiLA0KPiA+ID4gIAlbSUdUX0NSVENfU0hBUlBORVNTX1NUUkVOR1RIXSA9ICJT
SEFSUE5FU1NfU1RSRU5HVEgiLA0KPiA+ID4gKwlbSUdUX0NSVENfQkFDS0dST1VORF9DT0xPUl0g
PSAiQkFDS0dST1VORF9DT0xPUiIsDQo+ID4gPiAgfTsNCj4gPiA+DQo+ID4gPiAgY29uc3QgY2hh
ciAqIGNvbnN0DQo+ID4gPiBpZ3RfY29ubmVjdG9yX3Byb3BfbmFtZXNbSUdUX05VTV9DT05ORUNU
T1JfUFJPUFNdID0geyBAQCAtDQo+IDI3MzcsNg0KPiA+ID4gKzI3MzgsOSBAQCBzdGF0aWMgdm9p
ZCBpZ3RfY3J0Y19yZXNldChpZ3RfY3J0Y190ICpjcnRjKQ0KPiA+ID4gIAlpZiAoaWd0X2NydGNf
aGFzX3Byb3AoY3J0YywgSUdUX0NSVENfU0hBUlBORVNTX1NUUkVOR1RIKSkNCj4gPiA+ICAJCWln
dF9jcnRjX3NldF9wcm9wX3ZhbHVlKGNydGMsDQo+ID4gPiBJR1RfQ1JUQ19TSEFSUE5FU1NfU1RS
RU5HVEgsIDApOw0KPiA+ID4NCj4gPiA+ICsJaWYgKGlndF9jcnRjX2hhc19wcm9wKGNydGMsIElH
VF9DUlRDX0JBQ0tHUk9VTkRfQ09MT1IpKQ0KPiA+ID4gKwkJaWd0X2NydGNfc2V0X3Byb3BfdmFs
dWUoY3J0YywNCj4gPiA+IElHVF9DUlRDX0JBQ0tHUk9VTkRfQ09MT1IsDQo+ID4gPiArMHhmZmZm
MDAwMDAwMDAwMDAwVUxMKTsNCj4gPg0KPiA+IEltaG8sIGFkZCBhIHNob3J0IGlubGluZSBjb21t
ZW50IHRvIGNsYXJpZnkgdGhlIGNoYW5uZWwgcGFja2luZy4NCj4gPiAvKiBCQUNLR1JPVU5EX0NP
TE9SIGlzIEFSR0IxNjE2MTYxNjsgc2V0IG9wYXF1ZSBibGFjayAoQT0weGZmZmYsDQo+ID4gUkdC
PTApICovDQo+ID4NCj4gPiA+ICsNCj4gPiA+ICAJY3J0Yy0+b3V0X2ZlbmNlX2ZkID0gLTE7DQo+
ID4gPiAgfQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5oIGIvbGliL2ln
dF9rbXMuaCBpbmRleA0KPiA+ID4gYTU4Y2I1Y2QzNC4uNzFmOTA4ZDRmNQ0KPiA+ID4gMTAwNjQ0
DQo+ID4gPiAtLS0gYS9saWIvaWd0X2ttcy5oDQo+ID4gPiArKysgYi9saWIvaWd0X2ttcy5oDQo+
ID4gPiBAQCAtMTY1LDYgKzE2NSw3IEBAIGVudW0gaWd0X2F0b21pY19jcnRjX3Byb3BlcnRpZXMg
ew0KPiA+ID4gICAgICAgICBJR1RfQ1JUQ19WUlJfRU5BQkxFRCwNCj4gPiA+ICAgICAgICAgSUdU
X0NSVENfU0NBTElOR19GSUxURVIsDQo+ID4gPiAgICAgICAgIElHVF9DUlRDX1NIQVJQTkVTU19T
VFJFTkdUSCwNCj4gPiA+ICsgICAgICAgSUdUX0NSVENfQkFDS0dST1VORF9DT0xPUiwNCj4gPg0K
PiA+IFBsZWFzZSB1c2UgdGFiIGZvciBpbmRlbnRhdGlvbi4NCj4gDQo+IFRoaXMgZW51bSBuZWVk
cyBhIGNsZWFudXAsIGl0IGFscmVhZHkgdXNlcyBzcGFjZXMuLi4NCj4gV2UgY291bGQgZ28gd2l0
aCBzcGFjZXMgZm9yIG5vdyBhbmQgYSBjbGVhbnVwIGluIGEgZnV0dXJlPw0KPiANCg0KWWVzLCB0
aGlzIGFwcHJvYWNoIHNvdW5kcyBnb29kLiBXZSBjYW4ga2VlcCB0aGUgZXhpc3Rpbmcgc3BhY2lu
ZyANCmZvciBub3csIGFuZCAgaGFuZGxlIHRoZSBlbnVtIGNsZWFudXAgc2VwYXJhdGVseSBpbiBm
dXR1cmUuDQoNClJlZ2FyZHMsDQpQcmFuYXkuDQoNCj4gUmVnYXJkcywNCj4gS2FtaWwNCj4gDQo+
ID4gQWxvbmcgd2l0aCBLYW1pbCdzIHN1Z2dlc3Rpb24sIGNoYW5nZXMgTEdUTS4NCj4gPg0KPiA+
IFJldmlld2VkLWJ5OiBQcmFuYXkgU2FtYWxhIDxwcmFuYXkuc2FtYWxhQGludGVsLmNvbT4NCj4g
Pg0KPiA+ID4gICAgICAgICBJR1RfTlVNX0NSVENfUFJPUFMNCj4gPiA+ICB9Ow0KPiA+ID4NCj4g
PiA+IC0tDQo+ID4gPiAyLjUzLjANCj4gPg0K
