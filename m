Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4BF606A31B
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 20:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KHg1Rg6c
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AC3112232;
	Wed, 21 Oct 2026 20:53:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8161121FF
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 20:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792615969; x=1824151969;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8Vq2GEupWKV6XUhz5b/TsW8mY6XCgm5SsVCp2JRo2Bs=;
 b=KHg1Rg6ccv679QsxmmX5GbfHhRusKnxwBbNXmdlgO9L2y3FOROFs9EAW
 MV791wcNUuEgohc+0Xf5cz8+aGHG1TtAYHdutJBEY8Dd2AKwQOLiCjCz2
 CW8mphstOWK5vwf9q0qxWCmtfEEAUenPvAgxi982lSOL35dOWCh00RZyc
 zY5d6ehe6PX3mDD3XTpOxltdU1gyUviAjqJY8sN5eQd7QgCChqjL+f4i1
 nSI2CICmq44ns0xZ2Jf+0ZUyWf/LNRRSsUM1XzypdND1Zb15baUJfLqef
 Rz/8vCf9vjCaeQjqmt0s3lJnhBqnWXmMi3QnR7WH3n0A9UmALFnzl7R/K g==;
X-CSE-ConnectionGUID: wzaZ+OqzRPWxL1sZbLBxdg==
X-CSE-MsgGUID: zd9xj3XjSvujqE8v/97yXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1252238"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1252238"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 13:52:48 -0700
X-CSE-ConnectionGUID: I1QF69spS8KbjRRDVr3ecg==
X-CSE-MsgGUID: 6Qz4DeiWTgWgrwpg8ACH6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3240720"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 13:52:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 13:52:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 13:52:47 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 13:52:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiXJJ/eojkHkAujvVagzO0Fbd7gApEFQ7ViICJ354RQ82Rv9Ip4+zLv9OdNMUxSWDQATJw+Btxe/t5/vSDkgxVMJ2HEM4XV/YTWNDdY09cyDcd/voP5Lwb0cDoycprvU9y1oXrkVPY8uFtJyia+RPD00fYIbilFq4jvytApg0XnFEv2vQN1VmRZ9pbnvkcF+DG11oNSfqNIgpbrYCUp+tqldpZMk8lRy+nUAOXeoP9pe0Zcj6rpRNA0QGalsz/fOKiLiKjwAQrLwAbEDDsJqXQl/zmc1ItirUbyeHtfXIH7m0tbgHOwDQHkP4HAXZxXjkpk/yePqCcdp0Vtcf3ctlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bhvk+DGFlJHJFZke0Ob4397a3YFM9qu0TnHZcsuk6OU=;
 b=WEm94Ia8LtVS3DLXtP2LAXm+p5SFa7f8MDprGuei6VRn1Mii0J0euMQERPbYgcMWyVw0y+rkmKsfCRO79u9v0KM0Zb8fmU8WJyKLh5uXJeBAaXchgc6/uz1m6AWeT+yQm302OLk1/C9H9AVp8CetWSXrNzVJ6vI+3rmo2Q1Y3GTGsu5KFKvueXcZkvCcxKvNh6YEQayTIRv1OynGIin1SWtgmMu0lnv+ekJ4UpkDYQE1NQ4HBiCsQGcmWcK2anknaz7p11Q24KlZc7elz4gT7nul0RZ+AjZ3pUFSeHQzFcBKP5ZtyDEjVI3AktwWrEQhq2J3T+8TD7ERRDKb1xEmjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by DS0PR11MB9502.namprd11.prod.outlook.com
 (2603:10b6:8:295::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 20:52:45 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 20:52:45 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Scarbrough, 
 Frank" <frank.scarbrough@intel.com>, "david.e.box@linux.intel.com"
 <david.e.box@linux.intel.com>
Subject: RE: [PATCH i-g-t 0/2] Support PMT for BMG and CRI devices
Thread-Topic: [PATCH i-g-t 0/2] Support PMT for BMG and CRI devices
Thread-Index: AQHdW/Y5ZG/H8IdDXkmjG8pBHVlzKLcIhCfg
Date: Wed, 21 Oct 2026 20:52:45 +0000
Message-ID: <CH3PR11MB04614921246BC82520BDD5AAD6C1662@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261014160516.3542311-4-michael.j.ruhl@intel.com>
In-Reply-To: <20261014160516.3542311-4-michael.j.ruhl@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|DS0PR11MB9502:EE_
x-ms-office365-filtering-correlation-id: 3685b533-04ed-43ed-0d95-08df2fb54218
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|10067099003|261021121427099003|261009223027099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: z0rYhN5an1GAP89iMpT4zwkeltfXxfEPAkXo5Wa/dkZCsS9Ddg7zrLI1keAo1OPgsQKAt22MFTBlXK0xWy3rLLF4MxOv/y/uVKWfskAAH7Na+j3gbvSOf5Xww8yYTiJAOIKXzrD2e9O9ZY3omhm3+R4rYrQsvRFCyDJALscH0M9NXqEyuhdBeGoHyuLcwrJyXFTFQqg+DPTJcs7TpHG3DFoshKqY1a+lIxD9nR5wkupxv1vbvmGQOWiSh7dIqy3oOWfDLYOAper83wXQwfIeQArdUJ61oc7Od+0gpg7nuluRrV9xaKGHWMql++1Kiwn/203y63T+5BpjDq1YbuGKqQWm1tAAImJCS+UDf4ALoLbGgPMHxxoAMKFPa0lSe9fE7TfB7mfmDTHmagOqd6SJc4o/t1lyNm1hoyZN1faxYS28ZHM4cjVv6mSh4qIupRXQmKM6+yatGnOuv/t37PvG/0C11XblZZzCZKpwnLhv7upch7M9BLVTPGzgzz+v1SivadUr7JPszj6Ky1IC2YxKMhND9X36q5adrVBl1rOwJ1FZr8vNEZ2v6UV1HKadJ0n09y9RvGePzZYkVo4xIMy2e5IkYNKmvnAJUUhfEmjC/nWh/w8KI8SZi/4cc3vG+GKxNTCsNz1ZHrbvKoB0vASn9MzRcXeUFw3wddxihgGQ8dBTCYeHC74HAufJWxXZnX2c41ZrKbTzmQHRz7UK4Cb+Paoa9NpTAfQ0QU56BXpDvX4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB046149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(10067099003)(261021121427099003)(261009223027099003)(11063799006)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pVy6GxGVsY8Dtp/twkYAnrER1coDi/1aTtVrMJkVRtSyLSJ9PO+ChxT4Uwsz?=
 =?us-ascii?Q?D27Krs1f92E1FzEUxKUlosaIOqsK/w9isCGd5MNoweNjnCCGXUfJRY/HmGDq?=
 =?us-ascii?Q?S2kZq7oMJiQKvNd+7ZeqhvxH7OWnTt7AjIsz0C8orNHLpVFSTO3cfvm1cWcP?=
 =?us-ascii?Q?pJaXhR5AuLJywCbA4CjDqivTUCNFHI26DcMaJKeccjD7A0Iy7SO1hw65Pbur?=
 =?us-ascii?Q?+bLQ/rfOwNMl+WZSzvZNBTUVyHUHdNG30LzchgGVAOZDHWKteN1sl4ZeYh0l?=
 =?us-ascii?Q?v3lubbw/k3XkYzZR5PIQ1WqcY9NHdxWqQ2VBwPLE+lsZx5ZXUO2vblhUpLTF?=
 =?us-ascii?Q?nOHCldNPrl+c44rf3UTGUjMoQ8rBdVFDjEdyUNn1RrxFTQUl2GQjjwYCuup1?=
 =?us-ascii?Q?yf2A3Cl6aIlNtk2knzT9zjcTLWrrFMXqLXXqPcXEGgNRGmI2ObB5/W0imNMW?=
 =?us-ascii?Q?CV+ZmCMfpbf9Rdru4UdaOF0IUcIYzFXliqV8HJr92PikYc5xguFfvZPqEb2O?=
 =?us-ascii?Q?WaETN0nNMHQSAWFk+uW5HyjukNLiDb0UJu07wKQu4TEAtAWbcLMtXNPMHOov?=
 =?us-ascii?Q?hBZ065toN50y/Dgq8umJMjWksEYifIHB6q+XMa7qHRJIk2kMgSAPs7TwJLGl?=
 =?us-ascii?Q?QSr/82q7sUjsfKFeA1bo+WaE3kuJocxPfpXWtrywjHkKA+qp9jTxU/muVNdX?=
 =?us-ascii?Q?DT8b5zHLsANPXhof02BBcNzVoOkln05wbA6P8e6bwYE7iGNbr5XjyGYr4HyK?=
 =?us-ascii?Q?a12YjdRsHPaeJXx2FQKWTowpwfpU486uP9mH9meBy0SZd0jfzBzvcTM4N5gg?=
 =?us-ascii?Q?9A0AyTqtH9+aTeFqreZlYPF0X7BIt3e+Y/+XyYyc1b1Q65Jwvpe2z0g6o8o9?=
 =?us-ascii?Q?WYhfNAJ5Xmzsl/O4RDaZTaUsxByeIRK1pL6UOXayQGWmbq4EiDVRhf3YZZeS?=
 =?us-ascii?Q?fhojhtOuKGrBrWQPL2qhnR0ulZisDuLWn5NVsVP7u/h0SAfEbgcjAXOmnb/n?=
 =?us-ascii?Q?OM0/pAM/95NMZ2YLjwvLVyLRyXSAO/dYk6LaqY8k4KxU8j3QSXug61Xv49Qe?=
 =?us-ascii?Q?wIAzsAHHlzzP9U0kxjzIOLB53s0Vgqfjd0iwNjhtF/xezyMfqBT1khbqvztL?=
 =?us-ascii?Q?getrzkRCW1jD52dxSlOCnE2FJzV//zEFXaxy27HTKb48BnLSwNDc0ldZrrgn?=
 =?us-ascii?Q?rkqoL0xHM6e92IbIazHPjC9i8xnmEIuPO70Yvns6zrUrXvBqnwbJ3u5napD1?=
 =?us-ascii?Q?Bn/jWs4wDfGlLcuxgy3VBZwI/TXisTCf99vShlQ8MHttA2UdNcB7WyNvo3c9?=
 =?us-ascii?Q?yq2j7lsNyHebGavgF/bic/EohbdzxkUWM35xU1nirOtc48xQcjAXUk6dukZR?=
 =?us-ascii?Q?Ezwx6SSH83mvGoLBpw2NajVijXR3zsnvlBNFUzKZCv/j3pN0Jw3ja/fbWWxN?=
 =?us-ascii?Q?tuJaI/sVSABgkb2MLpG3QxhhRcraf0yGQqtJuDvbPBcuYs6miQtzwMv0XLr2?=
 =?us-ascii?Q?BWcMislLfCJNV2K6qcsLLJpo566uxpCPexkDfOQgW6wNbK7CBKzzG5yOyxIX?=
 =?us-ascii?Q?XG0qGV2VfA5vs3ZNDHQeBuve/XS4KfgLiEITcylgXFGGYmx4mSIFcbe1h90K?=
 =?us-ascii?Q?jka36AX/2K5lwyYmUwuV6kHw0XgZP/LttV0LwxD8QXC5xJMsZsFmET2Gs/qa?=
 =?us-ascii?Q?AFjFwx/jKruiJgQ6z78jQ1FRKoHoKcgfMzldwLLTVcweuwE6QYFajBSLC1WH?=
 =?us-ascii?Q?tdbhoYYD8w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Zl9poV+BRbiiZhapaRGSYzhCy/V7ZWAfQTQSIxqJQTZoEI/I21xujmHNglmvHHhCBoou7XrVGaQ5j1llmbzPGsboBj+Zk6mGu08Ng8fA5L/lGPZyFDXwjG3G3kGYXJOPwkZ6F5t8eQOu7Y0a+lPMx2tKT5x0b2qvnNWTrXPFit0FjWWU6xZ4k1/yJMgjzDiAQm9XyrHQg7ziiTmlc4yqYpLJ63WgRReosKdosmNjOBysDhzneZiJWpbCNFNCAe5bRG//S2Mjsw6IfooRMscUpHM8cXn0+/ZglBJsRScLOFGIifdKJ39SEDXVLPfLqoIJ4GL/074wI5JeQj+SCnJ65g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3685b533-04ed-43ed-0d95-08df2fb54218
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 20:52:45.3958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WhYJN+1pQdp3Vifax7AYPc8aPcRabA9RfTMauvuurXDQEUv7WEpqIyyZY52ay759djz5/CPCLwBI2CrCQeXZlkfyPVK8/FF/TnA9JoMwC3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9502
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ping?

Not sure what the sequencing is here...

Is this IGT reasonable?

Thanks,

Mike


>-----Original Message-----
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Michael=
 J.
>Ruhl
>Sent: Wednesday, October 14, 2026 12:05 PM
>To: igt-dev@lists.freedesktop.org; Scarbrough, Frank
><frank.scarbrough@intel.com>; david.e.box@linux.intel.com
>Subject: [PATCH i-g-t 0/2] Support PMT for BMG and CRI devices
>
>BMG and CRI devices have PMT functionality.
>
>Provide tests to exercise that functionality.
>
>Michael J. Ruhl (2):
>  test/intel/xe_pmt: Add testing for BMG PMT features
>  test/intel/xe_pmt: Support CRI PMT
>
> tests/intel/xe_pmt.c | 645
>+++++++++++++++++++++++++++++++++++++++++++
> tests/meson.build    |   1 +
> 2 files changed, 646 insertions(+)
> create mode 100644 tests/intel/xe_pmt.c
>
>--
>2.43.0

