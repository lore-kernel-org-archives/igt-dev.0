Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64B0C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 10:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666F710E77C;
	Thu, 18 Jan 2024 10:16:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA31610E77C;
 Thu, 18 Jan 2024 10:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705572989; x=1737108989;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tW5lov/rGL0+wPo1VZxvqSABaRIYMhVGN2y4PsvO5vI=;
 b=YSXM6i44YYj1hSWepwAaPQLMMWg+vuOjbflr7x5U91KFYrgs+Qd9aU7r
 vum52sI1UpeMYDCS+U+v96pYd+qrlm7/Jr+U8a8OESo2u9Thc9fETebFX
 JuS9sYQYW1za43XmQB75BjZCpa4XwHVCgbKcNx6FEX/hIEGah6WLwaAE3
 RLlHatFSw67hA7pkbAjoXzZL9kW1pjXSanCfk310elKG5WQ7vmFhi9vsV
 BAsdfEHDicAPd4bTRePgvjp34qNPssYtLh7EwiDZhIJwedi/1QlwXtNgm
 wGPlOGjiKRzi2Kjtdlu4mzUrjjLk/FEJkPS+4UZAmSzAkKNePCJQeAK+g Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="404174122"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="404174122"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 02:16:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="291665"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 02:16:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 02:16:21 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 02:16:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 02:16:20 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 02:16:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmvdLWwSocRy9x7dCTREX4Gn3Tv9qMbmJW0X6gqr/UKhEGs2yRkXb0hLOWlZbYe2T+Bzjig4pmVeYFLHPsZHcSyeSE+oGSftKoa+iEhgSzrLQlRn7dqiiCVZMJ3WyzWfd0J13Jgr2dDxS3dYGlGaykuHzuilNV3pa3tExHGrDPWakkwVAkR7juIcODJOnlKT4sUOkiZ5qs9yzvMfdQcuPhTjAszn9o5CLY+g+Mkzc4TEKljWsO28++oqeicZ1rnj9nHJ66EfCQZzn5N9rp4d+8asiRk5FXXqPmkCFjPp6OTxd3MXbKOUV7BF84ZXjH9C3Cmvy9KqF9t6fEjLB517eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tW5lov/rGL0+wPo1VZxvqSABaRIYMhVGN2y4PsvO5vI=;
 b=nlUO2QgOroyjeRMiViZCaaFFx0qzL9b6BBCqg0skFKOtneirRV4M9/3V/xb7E6aCSgxcVtupxtfEhIjJUCZpz89jMmA9TgLeGTcYKKRlzINXLziXPKTkdneB/EfQQCLPPrWHtkCzPlqsprJBYGww/YMoKPlQGsNTYq0XnaHWjEQtkk/SU9YujGK+wIZRQAvCPp5+Tf/ao+K/jzwT2T+kZOGHq/bs6F2fuaN7i1sNvuC76D/Cw5TBbDaW8OprogJ9+4yaDkNf48DLZXtLZAp3G8Io97gH5RUxh8bFFnWEnNa33DsKpX2u4VQhFtCQpVqxyW/b6A1zvhaIXniw74eq3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by SA0PR11MB4736.namprd11.prod.outlook.com (2603:10b6:806:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 10:16:18 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::4b4:61d6:9dff:eca]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::4b4:61d6:9dff:eca%7]) with mapi id 15.20.7181.029; Thu, 18 Jan 2024
 10:16:18 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBDSS54ZUJBVDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwvZ2Vt?=
 =?utf-8?B?X2V4ZWNfc2NoZWR1bGU6IFVwZGF0ZSBmb3IgTVRMIFJDUy9DQ1Mgdy9hIChy?=
 =?utf-8?Q?ev3)?=
Thread-Topic: =?utf-8?B?4pyXIENJLnhlQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9pbnRlbC9nZW1fZXhl?=
 =?utf-8?Q?c=5Fschedule:_Update_for_MTL_RCS/CCS_w/a_(rev3)?=
Thread-Index: AQHaRMvPMUr/ovsaWUaAkImS558KurDWcxAAgAjx7bA=
Date: Thu, 18 Jan 2024 10:16:18 +0000
Message-ID: <PH8PR11MB67536F06BA32217E5712E713F2712@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240111185645.4056250-1-John.C.Harrison@Intel.com>
 <170500449210.290000.1016677963749010043@5338d5abeb45>
 <20240112173944.zfdu2oe55vsez5pt@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240112173944.zfdu2oe55vsez5pt@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|SA0PR11MB4736:EE_
x-ms-office365-filtering-correlation-id: d8d4f61d-fa99-4b3b-0e56-08dc180e8319
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nI/a92g8uKg6JAfv85YC4DrXONSGg7c9FXwwZYp1vrdUb+m8GSHglxwBct/H2iWstYjP04xMicxqC9hAwywLVEQqL+8dgeITwgri0vdPdHCp3ViUahS5kWMr0zISqeVHR3c6OH8Np/C42/jceVV9WuiLwBNJnD9rmWlxcp4v7RG6KCNO7EQ5NtJ8d/yW9EdUjcAajibWbyA02ENxbTHN6vDLgW6bAa6ueQzLoF/p4ltlIMI3n2RnZY8YzK/sDFcwiPI3ljEo3oChVfVIT9xpybkesh7Mt1xq3Rr7cQTwkt+uCfG53ZeAHHI11H2H7ZODlOPNTUGlkgUyEN1UWSIV3uothQ90l2Ac9+E4V9KfDQafyxGYz7jTel5eFBkPe750v/nqTACv6d1m3UzY8f6EaqJovbVXEiFwMGe6Vd5rmNa4/TjOYytxo3LS4ph7OGW14MmrQlqpk/LPOegMLcOGI1JQ5Tfszkm1I3yKDfmBX2oq1PwVg1Fmupkf6EHWZQhRS6fmoeRrf+w2b9+Ww4ykKMkaOiFda6/+f2yZXkE2A2j0tG+6K/T5zuVAW8l8tsfpwbADFBVKiMja8mR/8yuYZluZ5Ra8Dr77l8gHVMkIhX4S6kBCTNS1JLCAwzuE15k3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(122000001)(38100700002)(2906002)(33656002)(41300700001)(86362001)(82960400001)(110136005)(316002)(71200400001)(53546011)(76116006)(9686003)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(6506007)(7696005)(478600001)(966005)(8936002)(26005)(4326008)(15650500001)(5660300002)(83380400001)(52536014)(38070700009)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTVaMFJjOGJpam9kV2YzeHZwV0FucFU0NmVyZGc1Q010YVR3eVVabC9tMzU1?=
 =?utf-8?B?KzVMM0NCRENGSEdqR3UvNXJFNFpIWnRLb25ob0p1aDJrRHhQaHZsako2ZGYy?=
 =?utf-8?B?U2QxUHBHOGNQWVBsOFVGSE5pR2NCV1BnaEVkcUNEeGxFaWl2VEV1ZURGY1NW?=
 =?utf-8?B?VUYxd2lMY050RzBkZkQ3OFZHeEZadjZFUHB0cVhNSjJUalAxbC8wZVVKQ3h6?=
 =?utf-8?B?MVV4WGNKTDhWckZleUhLc3Y3eXJQVG1OMktDL3lHVTRyT3ZIQWFlcFhIcUxl?=
 =?utf-8?B?d2ZsRXJNZjVZaDkrK3FyWWpXSnJ2bVNudHZuSDd0THZUSWZtTTV0bDNNaWdQ?=
 =?utf-8?B?dVpLYmNHS0tjbDBpUCt1M2hVcVRRNzA3MFhDWGhyQ1F0cjIvNEJMY1krclUw?=
 =?utf-8?B?N2hLOUJZb0UyZ2xPOFFuM1g3QmhZcU1FYlFPd09lUzZBVU9sM1dPVzdmV2Nl?=
 =?utf-8?B?MXk4UzlpdmNkbUZiY1RwaStWWU5jaVZpTEpHdUMvMDNMOWRiMkNjZUdlelZW?=
 =?utf-8?B?R01Ec1ZudWZrQVU3bVE3QmhybjBVcHNUSndrL3pIVVREdUtoM3lGRERDSHBy?=
 =?utf-8?B?US9XcUFOSDBjbHV6SWhMU3lJNmhHTUorTWJJTFh2c2FkWGIrNDNwd0dXSERn?=
 =?utf-8?B?OHZGOTl0dkxjcitXZGVMOHVRdk0vM21HaWx0cHJiTk5kU1dkdUhrcEZVNjJX?=
 =?utf-8?B?SC9rQlZrUHdpc29NRWJLallzVS80eUluK0dMRWRIZVNTVnNCeHV6MFlGdWpZ?=
 =?utf-8?B?eXBnWk1mdlp5a2x6VlFkczg3ZElBbzhjZHdSY3JvcldqQlVHczZheXcrMTRy?=
 =?utf-8?B?K2xiYytXZ3VoODMzNUh1RVZob0JQRndVc1h2UGlXMUUweVpyUnhHcTNFaE16?=
 =?utf-8?B?TmJURE1KaUJJU1RpbXhEbGJPWGM0MnVSVGdpRlIxa1NxY0VEUFlhZERBWXFI?=
 =?utf-8?B?VzZ0VGFFYUp1UVJYQzlud2F4R3dwekJNaWN2UCsvYzRjQ3FLbE9DaGZiWWJw?=
 =?utf-8?B?aHRvRFpIZGtaV3JtZ21UdCtaTGtJR3NoVUV2QmMrRXY1OEYrN3NjWjlNV3V4?=
 =?utf-8?B?RGtmTENwQk4vSWlWS05aQndxS2VuYVdhVjJOTUNHRE9xTUZINXdYKzZBdkt3?=
 =?utf-8?B?N1dBWHdMNnk4WFNNSlJRRkhRQ3RZd05ZOEdQSmhhN1M4SWdQOTNCdmtZSjVx?=
 =?utf-8?B?TUtsdXBOUkxLMVZWZUppcEJtdGNtdytHall3UFBvcFY5VHdsVGtWU3p2cUlr?=
 =?utf-8?B?MXFUSWl3M1lnVzU1djcvZzdZeWxlaWU3bGttaFI3T1VZcGR0bG9QRVFyby9U?=
 =?utf-8?B?bmRFOGR0Mk14ZjBsRXNBbytNK09jMmhEWVhvSjhHRVlVbUZMc21veFpuUmFy?=
 =?utf-8?B?YmZNZ0JuTjYxay95aWpYN0NGemFOdTNXM1QxZ0E1SHU2bjlqbG1VdHUvUFJK?=
 =?utf-8?B?TldHMFQxdkI4RnZvSW42bGRuT0ZRdnBFakFIcEtPTFY0aEtXdndtYmZoeUNz?=
 =?utf-8?B?Q2VueTZyODBCU3NGUFhweGN5Rlh4SGFCTmN1b0N1VEc2eUZnSHRNeFU4NG5J?=
 =?utf-8?B?S0Z5STBSeCtLdFlSc1NGKzE4a21ya1IzV2dGb2hIdzcyUEJtTTdqU1BxdzU0?=
 =?utf-8?B?K3hmZGpEWTc4RmJnQVF3KzJRdGloRnV4aXdKSEY5UGljVDI0RVE0bGtKK0tR?=
 =?utf-8?B?eGlYTFZWSEdOVXp4K1grWnVhcVFDOUJxcTNhNmJqdEkvLzZKU3g2eWFjQ0JZ?=
 =?utf-8?B?eEIyOUdkOHNGdkhBYTUwYU1KZ3k3TWhMbjFzWDRYOTVsVFdSQldFSitoQjNz?=
 =?utf-8?B?SmNFdE5sOCtQZkFRRnRzOUgyOWRUOXZyb1pQbUxoNFlvK1AzRVBaZXpYUFNk?=
 =?utf-8?B?MGlJeEhvMmhkbXE0anBwMlZZZ1cyQW1WRGdwS0ljRXVZOCtNdEFhMVJuaUht?=
 =?utf-8?B?TGZacmMvT0YvVkI5VVVNUkxTY3RTUkJwNFU2N2xzeEg4cGtvQ0hvVkZwOFk3?=
 =?utf-8?B?M3F4TmZGeCs3cGczVnFXa1psaWQ1cUVoemZ5NG4yeHVjN1lYQUJQdytwVkYv?=
 =?utf-8?B?Mnc5VkV0SjZ2cXY2Qkc2d3BON0R2dlVoVzZBY3V0YU5yc20vdjhwUzRoZWVI?=
 =?utf-8?B?NkRtc21jamVob3AvaFYrSFN6WVN5dlgrQTlYR1RHY3B1V0psK1IrTzdrK3B5?=
 =?utf-8?B?WUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d4f61d-fa99-4b3b-0e56-08dc180e8319
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2024 10:16:18.7255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SK2AfcX7oseQ++1lXEtYuoUOoRfSm3DTTxuya/9GVzc/O3xysr0ZnGVN6xhBP6DfIOap3C4wu9ea4SrQAKjsw6AoS6Uuzc7WBKoEph7swzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4736
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
Cc: LGCI Bug Filing <lgci.bug.filing@intel.com>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTI4MzQyLyAt
IFJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpUZWphc3JlZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50
ZWwuY29tPiANClNlbnQ6IEZyaWRheSwgSmFudWFyeSAxMiwgMjAyNCAxMToxMCBQTQ0KVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogSGFycmlzb24sIEpvaG4gQyA8am9obi5j
LmhhcnJpc29uQGludGVsLmNvbT47IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBMR0NJIEJ1ZyBGaWxpbmcgPGxnY2kuYnVnLmZpbGluZ0BpbnRlbC5jb20+OyBJbGxpcGlsbGks
IFRlamFzcmVlWCA8dGVqYXNyZWV4LmlsbGlwaWxsaUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTog
4pyXIENJLnhlQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9pbnRlbC9nZW1fZXhlY19zY2hlZHVsZTog
VXBkYXRlIGZvciBNVEwgUkNTL0NDUyB3L2EgKHJldjMpDQoNCkhpLA0KT24gMjAyNC0wMS0xMSBh
dCAyMDoyMTozMiAtMDAwMCwgUGF0Y2h3b3JrIHdyb3RlOg0KPiA9PSBTZXJpZXMgRGV0YWlscyA9
PQ0KPiANCj4gU2VyaWVzOiB0ZXN0cy9pbnRlbC9nZW1fZXhlY19zY2hlZHVsZTogVXBkYXRlIGZv
ciBNVEwgUkNTL0NDUyB3L2EgKHJldjMpDQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3Nlcmllcy8xMjgzNDIvDQo+IFN0YXRlIDogZmFpbHVyZQ0KPiANCj4gPT0g
U3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBYRUlHVF83NjcwX0JB
VCAtPiBYRUlHVFBXXzEwNTEzX0JBVCANCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAg
ICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRo
IFhFSUdUUFdfMTA1MTNfQkFUIGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiAgIHZlcmlmaWVkIG1h
bnVhbGx5Lg0KPiAgIA0KPiAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZl
IG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiAgIGludHJvZHVjZWQgaW4gWEVJR1RQ
V18xMDUxM19CQVQsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0NCj4gICB0byBkb2N1bWVudCB0aGlz
IG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBD
SS4NCj4gDQo+ICAgDQo+IA0KPiBQYXJ0aWNpcGF0aW5nIGhvc3RzICg0IC0+IDQpDQo+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBObyBjaGFuZ2VzIGluIHBhcnRpY2lw
YXRpbmcgaG9zdHMNCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUg
YmVlbiBpbnRyb2R1Y2VkIGluIFhFSUdUUFdfMTA1MTNfQkFUOg0KPiANCj4gIyMjIElHVCBjaGFu
Z2VzICMjIw0KPiANCj4gIyMjIyBQb3NzaWJsZSByZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICog
aWd0QGttc19waXBlX2NyY19iYXNpY0ByZWFkLWNyYy1mcmFtZS1zZXF1ZW5jZToNCj4gICAgIC0g
YmF0LWRnMi1vZW0yOiAgICAgICBbUEFTU11bMV0gLT4gW1NLSVBdWzJdICsxIG90aGVyIHRlc3Qg
c2tpcA0KPiAgICBbMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhl
L0lHVF83NjcwL2JhdC1kZzItb2VtMi9pZ3RAa21zX3BpcGVfY3JjX2Jhc2ljQHJlYWQtY3JjLWZy
YW1lLXNlcXVlbmNlLmh0bWwNCj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvaW50ZWwteGUvSUdUUFdfMTA1MTMvYmF0LWRnMi1vZW0yL2lndA0KPiBAa21zX3Bp
cGVfY3JjX2Jhc2ljQHJlYWQtY3JjLWZyYW1lLXNlcXVlbmNlLmh0bWwNCj4gDQo+ICAgKiBpZ3RA
eGVfZXZpY3RAZXZpY3QtYmVuZy1taXhlZC10aHJlYWRzLXNtYWxsLW11bHRpLXZtOg0KPiAgICAg
LSBiYXQtZGcyLW9lbTI6ICAgICAgIFtQQVNTXVszXSAtPiBbVElNRU9VVF1bNF0NCj4gICAgWzNd
OiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RfNzY3MC9iYXQt
ZGcyLW9lbTIvaWd0QHhlX2V2aWN0QGV2aWN0LWJlbmctbWl4ZWQtdGhyZWFkcy1zbWFsbC1tdWx0
aS12bS5odG1sDQo+ICAgIFs0XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2ludGVsLXhlL0lHVFBXXzEwNTEzL2JhdC1kZzItb2VtMi9pZ3QNCj4gQHhlX2V2aWN0QGV2aWN0
LWJlbmctbWl4ZWQtdGhyZWFkcy1zbWFsbC1tdWx0aS12bS5odG1sDQo+IA0KPiAgICogaWd0QHhl
X2V2aWN0QGV2aWN0LW1peGVkLXRocmVhZHMtc21hbGw6DQo+ICAgICAtIGJhdC1hdHNtLTI6ICAg
ICAgICAgW1BBU1NdWzVdIC0+IFtETUVTRy1XQVJOXVs2XQ0KPiAgICBbNV06IGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVF83NjcwL2JhdC1hdHNtLTIvaWd0QHhl
X2V2aWN0QGV2aWN0LW1peGVkLXRocmVhZHMtc21hbGwuaHRtbA0KPiAgICBbNl06IA0KPiBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RQV18xMDUxMy9iYXQtYXRz
bS0yL2lndEB4DQo+IGVfZXZpY3RAZXZpY3QtbWl4ZWQtdGhyZWFkcy1zbWFsbC5odG1sDQo+IA0K
DQpUaGlzIGlzIHVucmVsYXRlZCB0byBnZW1fIChpOTE1KSB0ZXN0Lg0KDQpSZWdhcmRzLA0KS2Ft
aWwNCg0KPiAgIA0KPiBLbm93biBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUg
YXJlIHRoZSBjaGFuZ2VzIGZvdW5kIGluIFhFSUdUUFdfMTA1MTNfQkFUIHRoYXQgY29tZSBmcm9t
IGtub3duIGlzc3VlczoNCj4gDQoNClsuLi5jdXQuLi5dDQoNCj4gICANCj4gICBbSW50ZWwgWEUj
MTAwOV06IA0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC9p
c3N1ZXMvMTAwOQ0KPiANCj4gDQo+IEJ1aWxkIGNoYW5nZXMNCj4gLS0tLS0tLS0tLS0tLQ0KPiAN
Cj4gICAqIElHVDogSUdUXzc2NzAgLT4gSUdUUFdfMTA1MTMNCj4gICAqIExpbnV4OiB4ZS02MTgt
NzkxODRlNzIyNjNlOTE1MjgxOTVkYjAxNzgzMTQ4NDM1YzdlNGZhZCAtPiANCj4geGUtNjE5LTg1
YmFkNTcxNzRkNTRiOGNkOTFlNGNlM2RhOWZlNzA5MWQ1M2Q5OGMNCj4gDQo+ICAgSUdUUFdfMTA1
MTM6IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA1MTMv
aW5kZXguaHRtbA0KPiAgIElHVF83NjcwOiAxYjMyYmNkYjJkOTk2NTA5MDIzNDczOWFiYTg5MWE5
MDc0M2UwMWM0IEAgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRv
b2xzLmdpdA0KPiAgIHhlLTYxOC03OTE4NGU3MjI2M2U5MTUyODE5NWRiMDE3ODMxNDg0MzVjN2U0
ZmFkOiA3OTE4NGU3MjI2M2U5MTUyODE5NWRiMDE3ODMxNDg0MzVjN2U0ZmFkDQo+ICAgeGUtNjE5
LTg1YmFkNTcxNzRkNTRiOGNkOTFlNGNlM2RhOWZlNzA5MWQ1M2Q5OGM6IA0KPiA4NWJhZDU3MTc0
ZDU0YjhjZDkxZTRjZTNkYTlmZTcwOTFkNTNkOThjDQo+IA0KPiA9PSBMb2dzID09DQo+IA0KPiBG
b3IgbW9yZSBkZXRhaWxzIHNlZTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2ludGVsLXhlL0lHVFBXXzEwNTEzL2luZGV4Lmh0bWwNCg==
