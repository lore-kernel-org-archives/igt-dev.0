Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E0ECD5BA4
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 18:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F6C10E21F;
	Wed, 20 May 2026 18:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixJtWvlW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0235910E21F
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 18:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779300085; x=1810836085;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Hfat+og4Ze71CEd+itExbDGZQU+nt7E1dhF23Jak2hE=;
 b=ixJtWvlWtWU4a9TAkk4biqnxldkaI6aI8CETHGZ0fzUnRQT+Vpj+O11A
 rxPwwxD9tQDm0scGUtTsEKogZAyOZo8H5hiXEn1m8L10pdsFoNysWYPCk
 oB30xNkjZe3FtUeI5Gs+MddaECMlAd3NBA96m8G+aXXLA47RBMMbRfmyt
 cb2snWoJjfl3g3p09BxKv25kiwap2Cx7IvVi5yY7pvwcOQySjAYWcBczN
 MkFhY9r5l+1MfXYVo4QEgbzSed0vOWYxpVYvqFK8g5R8F0Uro+1cw2U+N
 TjQxEX7aWCSUv3r75qEenOjuyP94I8dxgX6Ps/XTkhMu+eLYqRkdxDUbe w==;
X-CSE-ConnectionGUID: vKfnnAqARceoR3bcLkvLFQ==
X-CSE-MsgGUID: qyLqNoeeT9qg7TGQ5e4iSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79359925"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="79359925"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 11:01:24 -0700
X-CSE-ConnectionGUID: MJfhlfezS+SWPT1ex+0LjQ==
X-CSE-MsgGUID: dZ7VMqHNQgyQe6Q/1VO1XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="245276538"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 11:01:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 11:01:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 11:01:24 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.21)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 11:01:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5jmA01UPcF0CIjeLC8gmr7y92nVBpTO+ePdcM8G/iJyQXmDxa4gUqP+cxzVx7AHsIO6jF2kfqDWkcyz60XHvVi9MpsYbo5WHj/08biGOZNl8VmL8U7z1+4E57QN9MKO0nsdq3+ZgwUHw2m5EDmXzqRxB1BdCc5xC2rACRC1G77r3R+F5zcWpBtOln5QM5Ye2gjgYGcmUOpqpZ/HxbF9j4IA00RVwcEroZne2wtFXFHIYrk6YIh5JBkubmKDJrVn8PlmNATrykylrdaqVd6h6F+oUyP+Vv9ZFzq29n0GrgfVEGBUyYQH3wS3rlGV7A78pDO5CwPNIuEAGOqViBrJtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hfat+og4Ze71CEd+itExbDGZQU+nt7E1dhF23Jak2hE=;
 b=ha/3v39zuARIqbJ9IeIg+q/anfn3GGTJCyra2uyk5X7za4htIHj6+Eqr0BPvBmmweBZk+R3s0AMk/psYuwPEW/BZrXTgRgHC/yOnufjiEheCcrJKoDMfjnsgWBrM99ayxTZ1p0R9Ui9kTVKP8VeT/ZfRhHKmYDlDLzWAk9+wHZ9TVGRlRSSBTRkKt014lK/1/r8qiIjfF5f2gdFVOzXpdoJ/dRNbvRvN3ek6Qk2EX0f1tZTm43AwrsKR2lcnYLHYXa6ZgPt7MOnC8ZnXT8doCJd+3wNuL/pMW2Gx9JIXk3BykWutSB1GbibfqKqcpTFs/LJLTncxQkldXlvgT139gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB2842.namprd11.prod.outlook.com (2603:10b6:5:c5::12) by
 PH7PR11MB6401.namprd11.prod.outlook.com (2603:10b6:510:1fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Wed, 20 May
 2026 18:01:19 +0000
Received: from DM6PR11MB2842.namprd11.prod.outlook.com
 ([fe80::8022:1ef8:d7b3:cb62]) by DM6PR11MB2842.namprd11.prod.outlook.com
 ([fe80::8022:1ef8:d7b3:cb62%5]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 18:01:18 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH 2/3] lib/gpgpu_shader: replace open coded ibb data copy
 with helper
Thread-Topic: [PATCH 2/3] lib/gpgpu_shader: replace open coded ibb data copy
 with helper
Thread-Index: AQHc6D8shxvdM3PhmkCOLb3j3TWokrYXM6vg
Date: Wed, 20 May 2026 18:01:18 +0000
Message-ID: <DM6PR11MB2842B96DF8A18FF889A945BFE5012@DM6PR11MB2842.namprd11.prod.outlook.com>
References: <20260520-ibb_fixes-v1-0-d0c8ab2d07d3@intel.com>
 <20260520-ibb_fixes-v1-2-d0c8ab2d07d3@intel.com>
In-Reply-To: <20260520-ibb_fixes-v1-2-d0c8ab2d07d3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB2842:EE_|PH7PR11MB6401:EE_
x-ms-office365-filtering-correlation-id: 7e4b7a6f-6b3d-4684-cbf0-08deb699cabf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|11063799006|38070700021|6133799003|4143699003|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: LHYuVv3ZLoBspkrH4oDLOVu7gQmvqwZnV6xouaGTGAVd/+VFKkfJ6PCsYXMZENsu9pOEJYMddfSrEPaCs0rYsKFpFPxLH1PW8WjtJXSfFDzrbI7/4iGeQAacgNhSHlrXPU8JaXchaXTanX6ZMfreixJVpyVpmFcc1TEmCU/4AZNi7jwnMWwT6IhFDiP9J+K+OZeVI3rIRFW9aOzhn0Ur4BSZwHvrj8OT7tw3jGlmwNBJIiG11VOAuYZOUrhtnCwjF8nls5jrJXHZjv8ZAdM92XkRk6XPgXJUr+u11ffpzVQB4Kig/eafobNI2WWb774RReFlbcJjNmdmccOoieDm9QYUQY06k4DT51wE21nJjHPYcjT1bCLdLCnJyQl0jsUMnQGxmmUL4ZBpTvIctnFdY7kpFS3okzBJOz4Vodr3fw4ceIfFBTKFBgIrPVXn4BJdmqeinslGg6ach18ju7fEflNyhpc6k0VD59qsVjrxQ9gMPwqjwjp/+JU8lDQE2fx+aRFW8+9CgUMQsEWnJ+rEekzQoN9Ew+ccxaWBGot6/1zjRWI53ygfvIJT4m4g07GMs0J0hHDNa/0fPYxiVkpCuxgtUm0Fll4FlH2MUqQVO1rFPok3A6qaDuHoBmhqonD7Y1iaPxS+6ntVZ7haFc35vjIVDjhNS1cxQjCuW6dcuJbhj0skz5aXwLGwOoj0MBON21PkDsB/VOkMyHj2qx1arHB6Jal7dFnAmdZWSkh2x/TSaXBFuNH8A3j40uYviVtS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2842.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(11063799006)(38070700021)(6133799003)(4143699003)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFJiNVQ5NS9jbU5zYjB4cEQ2dnVrNXJWMXFoWmN3UWc5WFIzOHdpUjRHTmRI?=
 =?utf-8?B?Tkg5UTBBano2b3NLQXJMNWxDQjMyUW5GS3BBNXFXdVZZUVdneVplOFIzL0pO?=
 =?utf-8?B?WWM1OTE1VklpdUpNcW1nT2pVMTVyeG5uMWhza0xBeXA1K2lBaDF0NnBDLy8w?=
 =?utf-8?B?aFRzQTd3UXk2WjNxZGVrRTZyYk4rc2tlNFRyWkZ3ZTRPdWx1WUJBbnhDNGxH?=
 =?utf-8?B?MTkxSG1ZNm90QlErMEUwWFdyQVNqS0ZtRkRXWUNSOENDK0hMWE95cnNyd3Nx?=
 =?utf-8?B?cGg1T0s2cGpBRTZlb3VwdnZBc1YydVBvT3MwR2lEaFk4R2xOUlBCUEJyZGNa?=
 =?utf-8?B?R3BYeGd0RG1iS25GZWZ3RmwxMmNwaTFSRHlSallmVWxqZWloU2FJaDg4Nldz?=
 =?utf-8?B?V25kQjJkSTNIaUFvTVpWd2trSnNHRkRTaDd6V0Y0YVBnU0F5OHc3QXA5NUxl?=
 =?utf-8?B?azRuOEt6blVvUHpMSjZMVldzN3FTSHNiY2JUWjhreFI3SGt6SkVRbEVBK2Fy?=
 =?utf-8?B?YTVhN0l2RFYyRFppSzlTWDhqL3NkdFFZRi92anlhekRMN3dBbFJxd1VrY25C?=
 =?utf-8?B?eWEzRkN1UUoydEVrWjNIdWNGZ3lvUjJiNkNUVlNjUVdieHlHTUN4bExaRHIv?=
 =?utf-8?B?dmNNT3l3VXArUkxmcldWdGc0LytuTXpIUFFJb1FsS0QxRStrekREMDcxODA4?=
 =?utf-8?B?VmZobWhBeWhrekZWL2RJNkdjREVOclVxWGFWZUp2aXBvdHB1bk9lMHJrWWI0?=
 =?utf-8?B?VE12R0tHdXJ4WlREUUxPTnFVazZaR1pOZzh5RnZEZlh6NTFjL3ZSQzcxbExx?=
 =?utf-8?B?TWJUZEVKMVh5UXVhdVJEa0g3aUc2Wi9VeVRkc2puWU95dDRyVFdtYWRpem5s?=
 =?utf-8?B?QnBocVdnWWZkOERWY3hWaUhtV2VBUVNVQURmQjRPbk9OK2c0eVZsVGo4YmVZ?=
 =?utf-8?B?eTFweHcwUkhDc0xUVVhFSUc3RVB5YmNPYWcxa2ptOVlnR01OWmxXbFNhb1FJ?=
 =?utf-8?B?S09KQk1IWHBwdEZNb1YxNkVlVHBzQjhrTm9vTWFBbDNPOVkwQVBpMzVwR0lM?=
 =?utf-8?B?ZGRWU08rSVgyWGxiSGlTOTRkQVdNRDhZeW92VkVIdkY5UndzQk5yOFFqMm9W?=
 =?utf-8?B?Y2V2OUlVNThCMmcvRWU3OVZOdjliNmdMR05RQzlUa3ZMTHh6S3NpMWVFSnZX?=
 =?utf-8?B?cEFnWUlWQnJXaUlGR1Y0KzhjNjNucTdPb2pRaDlFaXozdVl5dDFuNTQ5MCtj?=
 =?utf-8?B?TWJZOWl2MHVDaEcxR0o4aFIyYjQwaG1ia21BbEt3ZG5Wb3l3c3diL2theXEz?=
 =?utf-8?B?QkNYQ3kzbXI2RVRCZmNKTWcxMlQwWHNDWnpSTm1ha21XcHdqVDRaMU0xVnBO?=
 =?utf-8?B?djhuVWtyNXlCWEJCOVhndXFScHBGNldYZFUvdElQazNEK3phWWlLSWwvdHV2?=
 =?utf-8?B?WDZEdXB4U21ZMTJxVnYxeGRjdmhMTDBVVkc4MnZ3TjRSOTRoVndDczRFQlQy?=
 =?utf-8?B?d3gralVoYU9hTSs1QnRDUXhoNmRHQzd6aGltdHpONGxtL1gvRnJPekFJd2kx?=
 =?utf-8?B?ZStjN2JGNXJ6S0l1dXZZNDQ0dGZOVDBPaCtzN1diYnpNYTZrQ1ZlVWR1MmZ1?=
 =?utf-8?B?TnN5R2ptVFRpZEtKMUVoTHo5UjRQcUVEcU8rdXhFQ0dQeGFqdzVHa0JtMDAx?=
 =?utf-8?B?OW04SFkzWkJ4bGlPQUYvZW96ZklPcTdocEFiSExpOHY2Skp1eTFVcUk1MHVu?=
 =?utf-8?B?MUxsREpKcXdmSHozYlpINFByMXhmYnlwM1NqZ212c2NDWnI2TEhORitVMk9w?=
 =?utf-8?B?MlZ1b1VmbGROY3J1ckpIUEFpdjMxckt6ZkE5VWRRNWFid0ZCakFvRkV3NTJ2?=
 =?utf-8?B?VjFkQTlPVDF4ZkQwMVFJWEdTUU5td3pkZllNSGQxUkZqL2RvS2wvMDFCc0d5?=
 =?utf-8?B?Mlh6VU5lcGpMQzRNTXZxNlVqS2FQVVJuTFVId0R1RUV3Mlo1R2pObjBFYTlY?=
 =?utf-8?B?TWJMd3BOTEV1NDdGUEsxTlJOY2lidE9aek1xWTVxdm9QZ1kyYTlGS1BHV1Ex?=
 =?utf-8?B?cDJweXhwNWxzeGY2SGczSWwveTEyQmRTdm1iazRtano4NE5ISG94ZWVKR1Z6?=
 =?utf-8?B?SVV0ZW04SnQwdXdBL0FGSncxckdoMGcyS05KRk1sTWNDc0NZVWJaWG1zUTBR?=
 =?utf-8?B?MEhrVGc2enEzR0ZpQWhZdWZUdXFwNUlVVXkwWXVwbStvejl4WS8yZkN3UDFq?=
 =?utf-8?B?emFhZ3RPZlpIWXlKZGlpTmhzYTdVQnVRWm5Jbm5SNDhoWTNnU2p5ZklmRUdK?=
 =?utf-8?B?bUJkWjRpTVVhYVR0d3hHT292bURKdFp5VDRIQ2RqRzBxMVJZaEFiY2hVbHpW?=
 =?utf-8?Q?oJikgjHnK/yQO1g6D8z2st15pZ6SP1qlsOOZmCyJgwNn7?=
x-ms-exchange-antispam-messagedata-1: 4ZOiKxBnzcelag==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xw4SNOxfgCW81EKjxLp9ZSR7Z1y+Z8+sL73o37fixFq8PVc0ntD71zwYb0NgYOH3rjtC/2MCx1MYiymEDy9ftYjOq0p4zCoJnt3nIG3r5KDkhoVAbMpw6gEyW30SykzXXUoxjb8sO7Sx5PatyULYKfIm8clrf6IrvKtvu8FKYD+u5G6Dq0LZAfdSUfUcQZzIhPFGoshCab4DIoorcqfQaJo635c8k1rX6K/ZeQk185RCJVGFHu5/8/qNVtU8urYge4BfKBYp2OxICu9qpD+dXCF3iutDUVyjUkV7eqtRkJ26FkDV1YGnnTxNv/svKFFvYWTv/l3u70FegIPkaDHyJA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2842.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4b7a6f-6b3d-4684-cbf0-08deb699cabf
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 18:01:18.0386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HAu+NNfTYSbcOjFXFKTAI5ymAkTuUn5lOkYsP7LZrZRHkzwTKfS8Wnz1pzuZZZkGiIROt7jej3lMnFkmWmOhsGooVQ1idMcmbir4OFz/XqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6401
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEhhamRhLCBBbmRyemVqIDxhbmRyemVq
LmhhamRhQGludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE1heSAyMCwgMjAyNiAyOjU2IEFN
DQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBLZW1wY3p5bnNraSwgWmJp
Z25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT47IENhdml0dCwgSm9uYXRoYW4g
PGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+OyBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmll
Y3pueUBsaW51eC5pbnRlbC5jb20+OyBIYWpkYSwgQW5kcnplaiA8YW5kcnplai5oYWpkYUBpbnRl
bC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggMi8zXSBsaWIvZ3BncHVfc2hhZGVyOiByZXBsYWNlIG9w
ZW4gY29kZWQgaWJiIGRhdGEgY29weSB3aXRoIGhlbHBlcg0KPiANCj4gSGVscGVyLCBiZXNpZGUg
Y29kZSBjb21wYWN0aW9uIGFuZCBpbmNyZWFzZWQgcmVhZGFiaWxpdHksIGFkZHMgYnVmZmVyDQo+
IG92ZXJmbG93IGNoZWNrcywgd2hpY2ggYXJlIG1pc3NpbmcgaGVyZS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPg0KDQpSZXZpZXdl
ZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KLUpvbmF0
aGFuIENhdml0dA0KDQo+IC0tLQ0KPiAgbGliL2dwZ3B1X3NoYWRlci5jIHwgMTMgKy0tLS0tLS0t
LS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9saWIvZ3BncHVfc2hhZGVyLmMgYi9saWIvZ3BncHVfc2hhZGVy
LmMNCj4gaW5kZXggZGJhYTlhNDU5NDU0Li43MmIwNTk1OWU4NzkgMTAwNjQ0DQo+IC0tLSBhL2xp
Yi9ncGdwdV9zaGFkZXIuYw0KPiArKysgYi9saWIvZ3BncHVfc2hhZGVyLmMNCj4gQEAgLTc2LDE4
ICs3Niw3IEBAIHN0YXRpYyB1aW50MzJfdCBmaWxsX3NpcChzdHJ1Y3QgaW50ZWxfYmIgKmliYiwN
Cj4gIAkJCSBjb25zdCB1aW50MzJfdCBzaXBbXVs0XSwNCj4gIAkJCSBjb25zdCBzaXplX3Qgc2l6
ZSkNCj4gIHsNCj4gLQl1aW50MzJfdCAqc2lwX2RzdDsNCj4gLQl1aW50MzJfdCBvZmZzZXQ7DQo+
IC0NCj4gLQlpbnRlbF9iYl9wdHJfYWxpZ24oaWJiLCAxNik7DQo+IC0Jc2lwX2RzdCA9IGludGVs
X2JiX3B0cihpYmIpOw0KPiAtCW9mZnNldCA9IGludGVsX2JiX29mZnNldChpYmIpOw0KPiAtDQo+
IC0JbWVtY3B5KHNpcF9kc3QsIHNpcCwgc2l6ZSk7DQo+IC0NCj4gLQlpbnRlbF9iYl9wdHJfYWRk
KGliYiwgc2l6ZSk7DQo+IC0NCj4gLQlyZXR1cm4gb2Zmc2V0Ow0KPiArCXJldHVybiBpbnRlbF9i
Yl9jb3B5X2RhdGEoaWJiLCBzaXAsIHNpemUsIDE2KTsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIHZv
aWQgZW1pdF9zaXAoc3RydWN0IGludGVsX2JiICppYmIsIGNvbnN0IHVpbnQ2NF90IG9mZnNldCkN
Cj4gDQo+IC0tIA0KPiAyLjU0LjANCj4gDQo+IA0K
