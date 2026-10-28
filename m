Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9640C606A31E
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MjwjZwYZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467D910E5D1;
	Wed, 28 Oct 2026 09:51:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0843810FAF5
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 09:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793181051; x=1824717051;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UytZVF78AMCUuC6vi7a2f9BqXwm0gT7sBDC3oXCklsY=;
 b=MjwjZwYZnjlaK7cKQmvbJxyFTjZ1JMdFym1XBkWpIxyAeAkRpOAuSNN3
 qo9VeY1t3qwof7XpXLts9Tbs8bq3e5HAeIiUsib+Y4SB3FY9zjjoEfTqf
 Pj77+HDO5CHgl9Ej6523fLjz1CnChGsVrnKBN3Stkx3bi8X/TsCJ5JXzT
 Gjg+fz4Qmr7I4/IEID/njTA0qiQdlDY/hwSEfxkuha5+dE1LWZOclHUEE
 ySXQOT0xljxvHR0wNv4zyoOn4Imr2ucmq4HFZZkW5LYhc8GSTTBVkYhng
 ugrEAVGEfIl+Eo/5MWznpzesY/JCshjSFx4+dvhrhqcjI+Tt/b0qSAn4M w==;
X-CSE-ConnectionGUID: y+7onasXSt++twK44sK6xg==
X-CSE-MsgGUID: gmOLH3xKQQGlrKzznwQBFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1789532"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1789532"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:50:50 -0700
X-CSE-ConnectionGUID: Vj02cIEcQbCXHEcVq+axnQ==
X-CSE-MsgGUID: LwMZaziVRAy2LooUs8nxNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4741375"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:50:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 02:50:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 02:50:50 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 02:50:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPQTC24yzwAYdnnUUjAb/nUmGs1zCcNf3Als+Lo99RuuXqhZ6SYkS9BJnbrl22UEoOqL4ROV45HTGJ0PalmOKU3BBuOZChf2F2ntIholxGqwf8BQdRTEQJMEM3FCjBekl0EG45isvsoKOahYFUP8IUjxZViTd/CM3WVu775XXJZj6vnLKuIRjHPGJZm5cO8OwafYoweCg2R6xz+xV6cmJ3csenXPIHdTFoX+M0nAptmr9yhGFRGMO7zvpl3y0gVVT4ruwYLlLpDbjHtWQk5YVQj0R6/xPykxq7XBHZboWsb7KCOJ/zgniwyvd0oup7AzFwTYeF28YSQ8l4G/hXpdvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UytZVF78AMCUuC6vi7a2f9BqXwm0gT7sBDC3oXCklsY=;
 b=qbtI3/dG9XkkMeRgupXqvAEKMiFqVY2N5jxs5b859F63wCtcFCUT1vM7/7nLXDI51T7Qb+1+JhHOfgzTSLsm+ZAGTcfeTTnl2k7D5ZQQQNtdgbTOqRhMndpavlznbOhAbWmZKZTiLuKR71nC0iYKvgyA6/oa4wuFxit/oTwgbwE4MwRrxIq/uzJphxwzky+rMWyrC/uiLZkx5ya+eMs/4VF++hinQC7WxBgBJvH1eKTRiicsi6RlMDt/WFoFpH3qYZaAfFc9Z3tthhHGY2bSuikT28YukapMjvxZd42K3Codpg2aAgiQn+rcAalHb6+kQezCYjeiDw9DVLRIL5Twhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MW4PR11MB7125.namprd11.prod.outlook.com (2603:10b6:303:219::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 09:50:47 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 09:50:47 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] lib/igt_eld: Log module load state when no eld#
 nodes are found
Thread-Topic: [PATCH i-g-t] lib/igt_eld: Log module load state when no eld#
 nodes are found
Thread-Index: AQHdXJxF4Pn75OxIEEaFbQ0nyCS+jbcSkCgwgAAybICAAATYIA==
Date: Wed, 28 Oct 2026 09:50:47 +0000
Message-ID: <PH7PR11MB60534AA451885A77D36DCB0BE76F2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20261015112548.2682369-1-chaitanya.kumar.borah@intel.com>
 <PH7PR11MB6053FF9ACDBB32795BFDA3ACE76F2@PH7PR11MB6053.namprd11.prod.outlook.com>
 <5d7189cd-9e1f-43bb-9015-be712d2333e4@intel.com>
In-Reply-To: <5d7189cd-9e1f-43bb-9015-be712d2333e4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|MW4PR11MB7125:EE_
x-ms-office365-filtering-correlation-id: 34d92378-db76-4c7e-1af9-08df34d8f109
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|11063799006|38070700021|261026121527099003|56012099006|261021121427099003|4143699003|261021123027099003|261022075727099003|261009223027099003|10067099003|261022105027099003|22082099003|6133799003|18002099003|261026140227099003;
x-microsoft-antispam-message-info: XFK17/0B55PlpjR8cq6+mQR9uXEm3NrhSnX/LGH2HUNbUTfWVVGsyIVYa+6CJuhHCaUjEX7x06PqxGR848/4krscvsEmH14Pl+SGOBd0aMZe+bLYSlz15X18N3hzM77jT6j5LbqbYYMnOUXz7PDG+zBvVEuT5dKYb7f2lKtuGJ/uzzO9BShis9mh6RNlqas1FEW5aOfaof3I1Dr+iCtI//NBfApynyXlX3oDh1XQh9uLkHgi2rBtS2BNoj8dT4i7/E3leDO/7TNr77sBZ0dVa/VSp9sKI9spmEU37YALaf0kbOui2ySz5xwP3ZpBD8dJ14TDBddmxxM41hY4yayQMc1CEf5s3ata602OVoymg2u5F3Devz76dox1icga46MJvEJNzeITanqlMyHva2NZSvXmWBcO8Su4nCS5r+Yc0bNL4d+PPGGJZJEUhvU5bU51gDY1ypOBiZBcOQQSWdWvIgf8NG9Im6wMJd3vvJ3LERa0d5k3tLrriVIvnoFx87YXqHxuftHW2DoRX6C2mhYeA7h2D4Mm0D+KYA5gz6Tfbq3Y6aZjtQWo0PYMnfHgKd8DGoS0HQ7WSh/4Gy1nKYcB60CTdgQ7EgY6hixoZrVoN86m0d62aNXniyLIrHRqQ9Ynw2fN9eoz8oXgnZX5+zppK/36Z7GaU3uHOFuY2zhunf4VHwcFm9EqMX4mMYEwzax4YoCXu+o5o+zIqoX8ZWUH4Z9rt9i8Ama1HQaIZ9c9F1o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(38070700021)(261026121527099003)(56012099006)(261021121427099003)(4143699003)(261021123027099003)(261022075727099003)(261009223027099003)(10067099003)(261022105027099003)(22082099003)(6133799003)(18002099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c21hYVduK2Y3M0pnalZtcWJyUjYyR1U2emxaOG1RcGFZTUw0S2dXcTNIZGNM?=
 =?utf-8?B?VVpEU3FvMG0rdWxiN1doZ2gvd2V2eThUalNrWlcrR0UrNGh1ZXdibzVaVmht?=
 =?utf-8?B?V1krWDVxVUlvRnBiRCtSNDNoMFF4cEtPWEZaTXUyWEZKVis3MktaWEJzYndm?=
 =?utf-8?B?QVF3UzB3U1BuU3dqN3A1K0tlMTBhc0ZuaGcvYnZ3RXpGRE5wOS9yRGVMZCtQ?=
 =?utf-8?B?VWJkaEg5a2ZDTnI5TFkrbHh4SzB3MHZUTWx5c2ZrUEhXMmt3a291RGlidU1D?=
 =?utf-8?B?aVlZOGkyUDY0bW1yYTU4SWFKNUxJTXJvZDVLQ3JHTFBGMjk5N3NBMVg5Y2tG?=
 =?utf-8?B?MFBzZmQvT3IxYTc2VUUrR3FoV2puZko2bkM1TkRWakorT24yL3hEODVqVDdK?=
 =?utf-8?B?SnE3aWwzMUZwTzBRV2F3SkF6V05uT1hWcC9oOXREanBhWEQvZVBGSGt2T1lv?=
 =?utf-8?B?K2lkcitsSDRYMUE0a1dOMjNSTW9yMy8wOXNpOCtvUzZ5TjJzdENGYVBhYUJ0?=
 =?utf-8?B?YWVpZDMyUVVVT3RrdGtlRTU4QWxQMjFpaE9FZGNaSm12V1hBbkVZQndSeDhv?=
 =?utf-8?B?bnZPaU9Ya2taNVJKRm5HYlFYU0RuUnVsNWRWN2ZTTStLNVpBblVnZXZZRUpG?=
 =?utf-8?B?VjhHR05odHBEYkFad2J5SFhta3lxNStHaWN6Q1A0ZmZmT1pVRzQzbDh4Vk10?=
 =?utf-8?B?clMzYUdFSmg4THhEOURVVzdZb3dtaDR2L3BVQ0loR2U4SW9ybXcrdE1JSktY?=
 =?utf-8?B?UEhLczRWUkZXQndSK2hJcmpIaGtqRXdFR1dZSUJDdWRGTjF6dXh5SXlxcmlQ?=
 =?utf-8?B?ME9EdmtGQVNFV3BJTzRXaVc2anR0WWgwaksyVmRNQjZ6dGZvOEpKSUdKbGIw?=
 =?utf-8?B?MFhLNnloY0VDNWtUcVYwUUdRNGN2QkNNUktodUJrSWI1blZ6R21nK2JUOTc3?=
 =?utf-8?B?eWpWMlRVbCtiTFVPYm1yei8zL0lUaHRDSitZMFgwczJMdjFXczhnRmg4R0VX?=
 =?utf-8?B?SHZ3MXpaWEtuZDE0S3F5T2x1bjlqUExsUlYxRVpVV29aVHZQNmtaK3VoSlRw?=
 =?utf-8?B?UTJHYmNQVXl0SGNsMXR1YkdFTEZNekdjOW1ZK0VDeWZraUVlU0FMaDZuZ2Fm?=
 =?utf-8?B?R3FvRnlMcGR6QXN6QlU5aTZMWmJNQ2REOE5CRjNaYWYrcWZVOC9zcmdDM01p?=
 =?utf-8?B?K1kxR2NVM2lNbGxuMkNhZERTZm9na05taS9LMDdBT0phYjBGTUxodk9OdVAv?=
 =?utf-8?B?ZXFQdXZTQW1qZkVyeU4wWjRwTFRQQmdCWC9aY2Q3UVJJRFhUenh5Si9SNElM?=
 =?utf-8?B?TXdLcTF4bUFFNTU0dGxjRDcxekVnbXZHNThxWTRIbDBDckVvK3JKRUZYTlA4?=
 =?utf-8?B?cUZUTkxOWVZyVFF5TmZPREpHUVNLd1RzSnNBWEpTdjdBaHNvcXBXbnQwSExX?=
 =?utf-8?B?a3IrTHltSlFaREJZc01ONWk4VmNGM3Nyc3BMM0M2YkY4K2taWnk1OWxNNTVK?=
 =?utf-8?B?ei9ENWhTMjVXY0NhRlk2ZGpzcXFTdUtpZ3ZFa0NYcHQwSTZQT25ldjNIOE45?=
 =?utf-8?B?U3NBMG1LTHk5bTVjMGo1eXMwUklrN1BiSExVc3RZV3IrKzR6dUs3dWdYayt5?=
 =?utf-8?B?NGhpT1psZ3JQNThqNXlqMTg4WHF6Skl3ZXlRazgwUmF1bjZLVHQybms2L0hK?=
 =?utf-8?B?SmFzNTNTRjZZUmZwcjg0R0lYcDUzUlE1bWx2aEdIQUVMQXhpZTh2ZnhSWW1v?=
 =?utf-8?B?VTZjdlA2bkVBR00xTnhpV2pXN0JWVnByR0dVbXhGYXZ5T3NiT0FXdjNWVmYv?=
 =?utf-8?B?ZXd3QmxDQkNobFlvMmliRG9rTEpIRi9JQW1zdWRQTUdQU0ZmYVFudEplSlVv?=
 =?utf-8?B?czExcDBWclVhQVBkdklEMkVxT3k2WlQ0TVp6aGtiWkdVdElyZk12YzZ2Z29j?=
 =?utf-8?B?R05WbnF1UVlRbm51eE1GTG1GNFl0SklVd3BOTzJ6RkcvRjdFYmRsNXFuYXlM?=
 =?utf-8?B?R3NqQW40a1YxZjFNMHhlbGpWZTNoT3d6NG4rUjN3Njhvdjl2Q3N5YitFZ1Zj?=
 =?utf-8?B?NzRRU0RXWUJPSjJVL0RGQXhzYTlUQkxKbGVtdStOWE5Ody8wTUE4azRSanpz?=
 =?utf-8?B?a2E3eGtoVjk1WkRLVXd4NXFQbmlwdjhiR0xrVXc1NDBvb1hxeVo3QitRaGFY?=
 =?utf-8?B?ZmREdjhaeXdkT2c0cWN5M25oeUcrUXZDeC9GRHVlcENMclkrUHVNSzV0NEtm?=
 =?utf-8?B?bXlUNUpCUWhiMzA3YnNrRmw3WVVRWEJFN0lxQVFjQW9sR0tUSjlSVjMxTHgz?=
 =?utf-8?B?ZExGVVhHK1p4eGR1Z0JaRFJyYXdac0I4cFVvSzI0RVpxbkcvUUYzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VV9rzMbPXehhpTGN3z5LWLcbF5L1SYJ/e4M1C8OQlgAhdJdUMApapqdKwiqxuCmRxyU4/likUEhddo/nB1Yx8D6me8CyxPwC7D5f95ZOSjr657BEjg9D36iSa9wfZK0N0WYgZgNp/nRrk/L6MAVqTeGhLDFCIEKxeY2nQH2Tbp5lcfbPkQhFIbPEPAWPcgXHU+XC1ziSySeBiy2GiQBb2+dj71P+ZGBUitFu6kdDH9gQ8AHHvleQnteDo92okNDqjN4elfsiSMU1meN4FqDqOup8MfMwBXHzKqoVWFGo77sua4Di9bBajLVDmClXL3E/935oyXnkRZsYQXyA0+sgMQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d92378-db76-4c7e-1af9-08df34d8f109
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 09:50:47.1197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EsOpO/+vhHSG5mFFmmaN6RiRYBC8ziRSC5mc0FRhQMflTxefd8btBY+85PzpqvSmdZg6EqLBUylgF095y7T3ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7125
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQ2hhaXRhbnlhLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJv
cmFoLCBDaGFpdGFueWEgS3VtYXIgPGNoYWl0YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+DQo+
IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyOCwgMjAyNiAyOjUzIFBNDQo+IFRvOiBTYW1hbGEs
IFByYW5heSA8cHJhbmF5LnNhbWFsYUBpbnRlbC5jb20+OyBpZ3QtDQo+IGRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gQ2M6IEIsIEplZXZhbiA8amVldmFuLmJAaW50ZWwuY29tPjsgU2hhcm1h
LCBTd2F0aTINCj4gPHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIGktZy10XSBsaWIvaWd0X2VsZDogTG9nIG1vZHVsZSBsb2FkIHN0YXRlIHdoZW4gbm8gZWxk
Iw0KPiBub2RlcyBhcmUgZm91bmQNCj4gDQo+IA0KPiANCj4gT24gMTAvMjgvMjAyNiAyOjIzIFBN
LCBTYW1hbGEsIFByYW5heSB3cm90ZToNCj4gPiBIaSBDaGFpdGFueWEsDQo+ID4NCj4gPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogaWd0LWRldiA8aWd0LWRldi1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+ID4+IENoYWl0YW55YSBL
dW1hciBCb3JhaA0KPiA+PiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAxNSwgMjAyNiA0OjU2IFBN
DQo+ID4+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+PiBDYzogQm9yYWgs
IENoYWl0YW55YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT47IEIsDQo+
ID4+IEplZXZhbiA8amVldmFuLmJAaW50ZWwuY29tPjsgU2hhcm1hLCBTd2F0aTINCj4gPHN3YXRp
Mi5zaGFybWFAaW50ZWwuY29tPg0KPiA+PiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXRdIGxpYi9pZ3Rf
ZWxkOiBMb2cgbW9kdWxlIGxvYWQgc3RhdGUgd2hlbiBubw0KPiA+PiBlbGQjIG5vZGVzIGFyZSBm
b3VuZA0KPiA+Pg0KPiA+PiBlbGRfaXNfc3VwcG9ydGVkKCkgc2lsZW50bHkgZmFpbHMgd2hlbiBF
TEQgcHJvY2ZzIG5vZGUgcG9sbGluZyB0aW1lcyBvdXQuDQo+ID4+IExvZyBtb2R1bGUgbG9hZCBz
dGF0ZSB0byBpZGVudGlmeSB3aGV0aGVyIGF1ZGlvIGRyaXZlcnMgYXJlIGxvYWRlZA0KPiA+PiB3
aGVuIElHVCBhdHRlbXB0cyB0byByZWFkIHRoZSBFTEQgbm9kZXMuDQo+ID4+DQo+ID4+IENjOiBK
ZWV2YW4gQiA8amVldmFuLmJAaW50ZWwuY29tPg0KPiA+PiBDYzogU3dhdGkgU2hhcm1hIDxzd2F0
aTIuc2hhcm1hQGludGVsLmNvbT4NCj4gPj4gU2lnbmVkLW9mZi1ieTogQ2hhaXRhbnlhIEt1bWFy
IEJvcmFoDQo+ID4+IDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29tPg0KPiA+PiAtLS0N
Cj4gPj4gICBsaWIvaWd0X2VsZC5jIHwgMTIgKysrKysrKysrKy0tDQo+ID4+ICAgMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYg
LS1naXQgYS9saWIvaWd0X2VsZC5jIGIvbGliL2lndF9lbGQuYyBpbmRleCA4OTZhYjBlNmIuLmJm
YjgzYTIxMw0KPiA+PiAxMDA2NDQNCj4gPj4gLS0tIGEvbGliL2lndF9lbGQuYw0KPiA+PiArKysg
Yi9saWIvaWd0X2VsZC5jDQo+ID4+IEBAIC0zNiw2ICszNiw3IEBADQo+ID4+ICAgI2luY2x1ZGUg
ImlndF9hdXguaCINCj4gPj4gICAjaW5jbHVkZSAiaWd0X2NvcmUuaCINCj4gPj4gICAjaW5jbHVk
ZSAiaWd0X2VsZC5oIg0KPiA+PiArI2luY2x1ZGUgImlndF9rbW9kLmgiDQo+ID4+DQo+ID4+ICAg
I2RlZmluZSBFTERfUFJFRklYICJlbGQjIg0KPiA+PiAgICNkZWZpbmUgRUxEX0RFTElNICIgXHQi
DQo+ID4+IEBAIC0zMDEsOCArMzAyLDE1IEBAIHN0YXRpYyBib29sIGVsZF9oYXNfbm9kZXModm9p
ZCkNCj4gPj4gICAgKiBmb3IgYSBib3VuZGVkIGFtb3VudCBvZiB0aW1lIGJlZm9yZSBnaXZpbmcg
dXAgdG8gYXZvaWQgc3B1cmlvdXMNCj4gPj4gc2tpcHMuICovIGJvb2wgZWxkX2lzX3N1cHBvcnRl
ZCh2b2lkKSAgew0KPiA+PiAtCXJldHVybiBpZ3Rfd2FpdChlbGRfaGFzX25vZGVzKCksIEVMRF9T
VVBQT1JURURfVElNRU9VVF9NUywNCj4gPj4gLQkJCUVMRF9TVVBQT1JURURfSU5URVJWQUxfTVMp
Ow0KPiA+PiArCWJvb2wgc3VwcG9ydGVkID0gaWd0X3dhaXQoZWxkX2hhc19ub2RlcygpLA0KPiA+
PiBFTERfU1VQUE9SVEVEX1RJTUVPVVRfTVMsDQo+ID4+ICsJCQkJICAgRUxEX1NVUFBPUlRFRF9J
TlRFUlZBTF9NUyk7DQo+ID4+ICsNCj4gPj4gKwlpZiAoIXN1cHBvcnRlZCkNCj4gPj4gKwkJaWd0
X2RlYnVnKCJObyBlbGQjIG5vZGVzIGZvdW5kOyBzbmRfaGRhX2ludGVsIGxvYWRlZDogJXMsDQo+
ID4NCj4gPiBVc2UgaWd0X3dhcm4vaWd0X2luZm8gdG8gbG9nIGluIENJIGxvZ3MuIGlndF9kZWJ1
ZyB3b24ndCBsb2cgd2l0aG91dCAtLQ0KPiBkZWJ1Zy4NCj4gPg0KPiANCj4gVGhpcyBpcyBub3Qg
bmVlZGVkIGluIG15IG9waW5pb24gYmVjYXVzZSBhIHRlc3QgZmFpbHVyZSBhbHJlYWR5IHRyaWdn
ZXJzIGENCj4gZGVidWcgcHJpbnQgaW4gb3VyIENJLg0KPiANCg0KQWdyZWVkIGZvciBrbXNfaGRt
aV9hdWRpb19idy4gVGhlcmUgYXVkaW9faXNfYWN0aXZlKCkgcmV0dXJucyBmYWxzZSwNCnRoZSBj
YWxsZXIncyBpZ3RfYXNzZXJ0IGZhaWxzLCBhbmQgdGhlIGRlYnVnIGJ1ZmZlciBnZXRzIGR1bXBl
ZC4NCg0Ka21zX2hkbWlfaW5qZWN0IGFuZCBrbXNfY2hhbWVsaXVtX2F1ZGlvIHVzZQ0KaWd0X3Jl
cXVpcmUoZWxkX2lzX3N1cHBvcnRlZCgpKSB0aG91Z2gsIHNvIHRoZXJlIGl0J3MgYSBza2lwLCBh
bmQgYXMNCmZhciBhcyBJIGNhbiBzZWUgaWd0X3NraXAoKSBkb2Vzbid0IGR1bXAgdGhlIGRlYnVn
IGJ1ZmZlci4gVGhlDQptZXNzYWdlIHdvdWxkIGJlIGxvc3QgaW4gdGhlIHNwdXJpb3VzLXNraXAg
Y2FzZS4gSWYgdGhhdCdzDQphY2NlcHRhYmxlLCBJJ20gZmluZSB3aXRoIGtlZXBpbmcgaWd0X2Rl
YnVnLg0KDQo+ID4+IHNuZF9oZGFfY29yZSBsb2FkZWQ6ICVzXG4iLA0KPiA+PiArCQkJICBpZ3Rf
a21vZF9pc19sb2FkZWQoInNuZF9oZGFfaW50ZWwiKSA/ICJ5ZXMiIDogIm5vIiwNCj4gPg0KPiA+
IEFzIHBlciBteSB1bmRlcnN0YW5kaW5nLCBvbiBTT0YtYmFzZWQgSW50ZWwgcGxhdGZvcm1zICh3
aXRoDQo+ID4gRE1JQy9Tb3VuZHdpcmUpLCBzbmRfaGRhX2ludGVsIHN0aWxsIGdldHMgbG9hZGVk
IGJ1dCBhYm9ydHMgaXRzIHByb2JlLA0KPiA+IGFuZCBTT0YgZHJpdmVyIGJvdW5kIHRvIHRoZSBh
dWRpbyBkZXZpY2UgaW5zdGVhZC4NCj4gPiBJZiBzbywgdGhpcyB3b3VsZCBwcmludCAibG9hZGVk
OiB5ZXMiIGV2ZW4gdGhvdWdoIGl0J3Mgbm90IGRyaXZpbmcgdGhlDQo+IGhhcmR3YXJlLg0KPiA+
DQo+ID4gV291bGQgaXQgYmUgYmV0dGVyIHRvIGNoZWNrIHdoZXRoZXIgdGhlIGRyaXZlciBpcyBi
b3VuZCByYXRoZXIgdGhhbg0KPiBsb2FkZWQ/DQo+ID4NCj4gDQo+IEFGQUlLLCBvdXIgQ0kgc3lz
dGVtIG5ldmVyIGxvYWRzIHRoZSBTT0YgZHJpdmVycywgbGV0IG1lIGtub3cgaWYgeW91IGhhdmUN
Cj4gZXZpZGVuY2UgdG8gdGhlIGNvbnRyYXJ5Lg0KPiANCg0KTXkgY29uY2VybiBjYW1lIGZyb20g
YXp4X3Byb2JlKCkgcmV0dXJuaW5nIC1FTk9ERVYgd2hlbiBTT0YgaXMgc2VsZWN0ZWQsDQp3aGlj
aCBsZWF2ZXMgc25kX2hkYV9pbnRlbCBsb2FkZWQgYnV0IHVuYm91bmQuIElmIENJIGtlcm5lbHMg
ZG9uJ3QgZW5hYmxlDQpTT0YsIHRoYXQgY2FuJ3QgaGFwcGVuIGFuZCB0aGUgY3VycmVudCBjaGVj
ayBpcyBmaW5lLiANClRoYW5rcyBmb3IgY2xhcmlmeWluZy4NCg0KV2l0aCB0aGF0LCBjaGFuZ2Vz
IExHVE0uDQpSZXZpZXdlZC1ieTogUHJhbmF5IFNhbWFsYSA8cHJhbmF5LnNhbWFsYUBpbnRlbC5j
b20+DQoNCj4gPT0NCj4gQ2hhaXRhbnlhDQo+IA0KPiA+IFJlZ2FyZHMsDQo+ID4gUHJhbmF5DQo+
ID4NCj4gPj4gKwkJCSAgaWd0X2ttb2RfaXNfbG9hZGVkKCJzbmRfaGRhX2NvcmUiKSA/ICJ5ZXMi
IDoNCj4gPj4gIm5vIik7DQo+ID4+ICsNCj4gPj4gKwlyZXR1cm4gc3VwcG9ydGVkOw0KPiA+PiAg
IH0NCj4gPj4NCj4gPj4gICAjZGVmaW5lIEVMRF9NQVhfU0laRSAyNTYNCj4gPj4gLS0NCj4gPj4g
Mi41MC4xDQo+ID4NCg0K
