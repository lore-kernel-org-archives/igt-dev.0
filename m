Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F9ACED249
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 08:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF2A10E317;
	Tue, 18 Nov 2025 08:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTcSEuYo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A3110E317
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 08:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763454027; x=1794990027;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TOeFlL3Ncz1wu0d7l+kUUvpiITL+19RT7f7+YkNcwD0=;
 b=HTcSEuYoh1bFWHevKQMhVRVr/vUJg17jG7fHFsGFCoKwkLnFiXC3H9ml
 w2S5SI2FPkbsX70bUlcBg4LBxCXbJEp4hn8qwUUt5M+bR4cB6G8Q1XX4l
 S+p+qk3/pDJT6U+o6q2K3pz7CFUfWbZ0pyaEhtQXzA/Rq3XTHv84e0cKo
 X0ZNIzm5MlBHAMuPl4n0iLp/FriisFARA2hMaq4XIffOazs/PowqTCjeE
 ZMJ1C6hQMn6PUZDHKFUn0VzTwzRdd6NUJf/5fiNqnr79xvxDaFWNVWY/L
 dEX3vvRq3BMfN5VljuUi2rptlMzdx7bgvjTquVLki+DMZPc+Ig+BDMAFf Q==;
X-CSE-ConnectionGUID: qziMxrsrR+6+g0QYOF/lYA==
X-CSE-MsgGUID: uHFYG1+qTZusA7tAx1ngvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76820488"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="76820488"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:20:27 -0800
X-CSE-ConnectionGUID: /SGvqBiTTeaaA36xitT0eQ==
X-CSE-MsgGUID: BbatbTdSRoCHE5hKKBxMsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="195610613"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:20:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:20:26 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 00:20:26 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.36)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:20:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSt/kMs/yzszpGZUaivdvRazEuaJID4wKmSwdB4hntKmUv535OgqNQioyxyxITlPeJrR7ziibCnEPr+WVTOmoVT/9/Lz9zlpo7NK3koxJrXZXUXSrri/+DUqppT9HZAGLocb6oZJlaYTsFL3S8N+Cz+I2/JSZdl2QGDHPRIwjxb5Hir/03LWmX0rI6TlEge6P2L5TYVrOvUagop5Ou5WeS+BIwQr7m7B+KYR6vEy94euiwSkWCqxd7Fw1yghmkQ2IgShWjU+z1Kbq2j0XTg1EjvXdJE0GT0wZujAOtvN6RWIJCNoRFKxAMik6T1SBzeSNn7e9/zqB4wddxFn4fHHLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6x/BZooIugDdITYJ7bZeDmVdR8GYeza4he8Dj/ZzwU=;
 b=ys7UP7R468FJtV6Q31/AdDQMPRyUYIHUfSzsYei9bF4Op9Mktvt44yeLQlrjmtUj5HW+5qsR8vBbuokMpWKNKQ2wEdhqjd+Sh907DOLZnLxtPLIUb+8p1GW7X+uA6tZfrohgcLPVXrNfjuD5UvY8iQpHJVxizjc8sJ5bRGWD8c42ANMGK9q1+zN5faGvcDMn3tpAE+yT6cU6DSxM29sb7v5DNbFGoqvU2eqNZEhqkb4QyEQM2QR9lWzx4cTbAuy8PgYR6gjebENTbKjFeweWXWkqUPzyBEp2slYLMwjlKd7/pk2ZCA2A4sAFX39lxwwy4Jor5A8J/atpP5OrNzKOOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 08:20:23 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%3]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 08:20:23 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "S, Sowmiya" <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v2 8/9] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Topic: [PATCH i-g-t v2 8/9] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Index: AQHcVHk09dXKJQTrYkSAuP/uH9b/D7T4HTpg
Date: Tue, 18 Nov 2025 08:20:23 +0000
Message-ID: <PH7PR11MB6053E73EBADBD0902CBEADCDE7D6A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20251113085801.3088957-1-sowmiya.s@intel.com>
 <20251113085801.3088957-9-sowmiya.s@intel.com>
In-Reply-To: <20251113085801.3088957-9-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CO1PR11MB4979:EE_
x-ms-office365-filtering-correlation-id: 9a3f58c9-2316-46de-026e-08de267b5255
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?y4puuXkzog2oj1MvO9TeVCeqiRms2VYgy5cixruk2SOO+ubQGTIbxiXE9q6c?=
 =?us-ascii?Q?pzUcodTMRxB9dCFHMKY40hS2G55rHhEdMQWDjxiKyoIW7GfOW1OFPHn/O4E/?=
 =?us-ascii?Q?NC02VAEp2n1zzHUPf5d4j4x1YX4hbOziN0ovVRTPLJp47SrcFRWKyzDAIRyp?=
 =?us-ascii?Q?s2BDSyI6kWR+YlqRcOSrq+LLDT+t1rX4WkQdH/cMvXKEq6ymd6GZzfvmlJdK?=
 =?us-ascii?Q?rtk8lNNUi0V/c6O5P/t8Wxljy3gRgsheJ4mz5Sg9+42IJA/QUBrhLOjKHvvZ?=
 =?us-ascii?Q?eVkLslV79DuUNXHoGYCBdLnSIgFnVEiv8vBSAbQm8GNRJshckxtL/CZFtMrg?=
 =?us-ascii?Q?3UmItNHr9uQSdn2D/HcpExXsPK1L5v23tjStHpNaQNRCA73ZXQ+F5Xd6Tn1V?=
 =?us-ascii?Q?IEMxrOnYT6GWRrQzkqT0iuBnc5yUVxK5OS49NiqujBf6/dW/ljWM33V+ZiI0?=
 =?us-ascii?Q?lTzSFTazAdEDoMMMh3GddFeqoR3pMGDb0F9UUfVUgsWImSf0MpHk3+whgkK+?=
 =?us-ascii?Q?l3W71sSwFX6CAkrQdSsZWh6TU7y4R1fa7a+O1v3lzjkv+4hjRQRC9j3wiXje?=
 =?us-ascii?Q?kpjqZRasANwkLVrs+3NHLK4n26EH6mnYDU5yo1QyuONycAJEHquc9ZUYwLW+?=
 =?us-ascii?Q?hrRsbpmspMnEELgIUKBu2oF7xRa+4Fs+gaoViodCmEAL2ea1Hp8BiIeFQ1wW?=
 =?us-ascii?Q?aRFWWVE+UE2TYhNHGa8dykaSKDxFdMN/ybLgjdaMvRSfOPT07LjmFKy71O/H?=
 =?us-ascii?Q?oTD63qO6+7AbwqRl9pVKMk4/+KKmvQWJX/hS4BRztoWPGvk+L8EE+ScwydLk?=
 =?us-ascii?Q?0sU272cKM1u801H83pnb4kOue/3B8yukgA+FzxlBAI4/pgV9GI2qCjVB3Eoy?=
 =?us-ascii?Q?2gG3FMfLU/W45Bg0WlGc5+PTGt97Uy11KZ0gMassi7lszhqWpkt98BJ5fIB+?=
 =?us-ascii?Q?wGAJdrayWIp0ut/0VJPnQkDWaDBEZ+nvldJOLOZxdrEy7Y+qC8qxc6i6ldQM?=
 =?us-ascii?Q?wKaNqsd0hpR/eMjEq3NFGP4yS3Tmu9I7gPI5HCyBFOHOtGvFEc58t600VGVl?=
 =?us-ascii?Q?sKVCw/HYJKtVl33isKtAx/Pdo4/PvH435myk9Tp4vxNGuihewVZslFw5rWzh?=
 =?us-ascii?Q?R4qU7qHyJqdwT43R1cW9Lwv1kY6hOoiQdKVO0gtHyWZ72BF4yQoI/gmk8Wjy?=
 =?us-ascii?Q?4+vGg4P/AXhOMHAiOcGEmHVWqEoGkpoSDEqLMJgs5w0D2/jG1J78W9g5/sbO?=
 =?us-ascii?Q?Sq8LE8RXLU5/b4b6FCX9oS1Lm+IgeqyH1MXW3fG2ZFMaULmB98n/AesiVl4e?=
 =?us-ascii?Q?smZog256tXhqp2mtVCsFK4/ja/az0J9aw5zOcTrp/MtvC665xwBChj2aGFGv?=
 =?us-ascii?Q?Y5VsFdKqsQioFDRvkMdsj8DwU55WBP42LIKU6FRBrJ8zDn0EGguTEYdfvVZb?=
 =?us-ascii?Q?Wn5W3z0+zLM4/XfRSy+EQu18B38UTrgjElawnqk886A7RY8MQsT7+x0JGksZ?=
 =?us-ascii?Q?EMm0F8B8VUwNeZTQBXE1mokRHna6BBthp01V?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jbk+yPBo6DxB58iRmWaZfHc/tOTO3gtc4wPuj7FfZJ9FadOZpqKE+4TwAxo/?=
 =?us-ascii?Q?6cw62V+y2vVCF2+BKgQqik9exDJ0cyBMxIVdkpvXkYGBfpGTEQfJusOTIdrZ?=
 =?us-ascii?Q?u6oYFj5Hrv6FsgQD0cpt25CXfyqQeCL73ipibejPOjVTiQTp2SiBeektT8Ix?=
 =?us-ascii?Q?v0ZgyWcO5JXNsks1JWmDCoVslfwHD97lvFsqoK06bfysQ2b5G1AcU9thgha2?=
 =?us-ascii?Q?sLIq3EIRnegMMREJ/LE9GMAz93SHjuc1Usey0PJ46Ea65q7DSnxQoBlKzjTL?=
 =?us-ascii?Q?Wg6OeEZl0Dxbz1h8gniPgpqjWhrQvpmw/SRc8dMn0HTGaO2XsYF8UUdrNNHw?=
 =?us-ascii?Q?lXrnIFOOewUIqesm4XQxO6nclpDJ23kl296xt4L7yNHbV8d6Xb5HabQMAWRW?=
 =?us-ascii?Q?c1pXWe4CuEe6F+DwJ6Hh9PbyK3DTyxYAT6ByzHA4i9IUBD1kTd/v8QKZB+26?=
 =?us-ascii?Q?x0j2H06EIP0/y3fEuiDJBWsufsoBg0UyvsO5Fm2M/10QwFldwHS0bFPIitW0?=
 =?us-ascii?Q?J8y++fiwmQx5MjnmAdF8OLlAUWaPZOVieduwEyy6TkaR/gJF+NyMT/jdM2E1?=
 =?us-ascii?Q?Tf8bWzS8QiwE98ov/8fqgjLEEXKRn1paiHCruv+XipASjvwBU7+ALb4nT4LQ?=
 =?us-ascii?Q?MpDPPCY4WVH+R1527iWAU0+VbN41mbIHSTDrnT2WeIbG/vmUtpQrQ1qBJDrY?=
 =?us-ascii?Q?NDzLgoTsa7x5ybsISTozlD6EwAn9bxZyGsITwNTxMkTLsQ4m3AzlR4g1tiSa?=
 =?us-ascii?Q?ABGDZrEVJP8dmuWDtsVye1BjZB8a0usu7IHVwTmz5cmB41MmIsn8ZdaZVkkf?=
 =?us-ascii?Q?dT5LSJrxrZC1UW4jtQoW8ChtL+ZE0H6v7h269dXjQ5BMW3JYaq9T18slJfGR?=
 =?us-ascii?Q?c72HQpXYUoIf6qwE+P0w3zbTUaeFoV1SW4HQPr8AiJzGV89yLvVi6ZGashNI?=
 =?us-ascii?Q?HR7dtvPPnjLoTLYyHFflT8SlbS+TOEAMpiWnJXYYM9s3ei/GP3be2IS3blME?=
 =?us-ascii?Q?T75qOFvfae7QgEFqbpEbYRhcjzE0JZsA883uWGsZ1TXD1jETdnFSRxLuNKcL?=
 =?us-ascii?Q?na2M5oNDOZl69wPzh7yPL4TgzeYLe0xGf4ISUjrUwnhFqN73r17/fZYEi4e4?=
 =?us-ascii?Q?K6Kkm2TnbQecD9clkwwDztKnFAjGNbFe0qR7KN8hWyoesgIQ9RuiPzkCcZyy?=
 =?us-ascii?Q?YF2rEbIuus7MmANjlTJW1ZQlW/m0wJMe7J1lSkgJUL0TU1w3RKnbyHdJl97D?=
 =?us-ascii?Q?ig08VPN6SxL05KOGXamrAV1RWZ8qefk+iErZRtGfWQWFBGe9JnacXasH2J6k?=
 =?us-ascii?Q?Mho2/71Jq7ofnVmDHgROPvsEX4STfPMzkTzHdInWW/s2B5HArbGApdj+hkoh?=
 =?us-ascii?Q?d5Lr/zlKfxDuCI5scI/Se9KbRbwWmfW+WAt3pT8YDUcgY9qa4PRvpms64eQc?=
 =?us-ascii?Q?QYFMhpK1nf1yzpg5Rhh/nAZfjDT9h8RIBdDwSBQOtya3Sid8dW8v7b9BBSaW?=
 =?us-ascii?Q?HD+P0HJ9hrfXhF9dHAg3lbfztarpBTldYK94uON402+HIZMqf3EKqIIzRSV2?=
 =?us-ascii?Q?RLBFNAcdiwf5jBOL2yXabeiDW+hxkKt7X6e/zbRD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3f58c9-2316-46de-026e-08de267b5255
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 08:20:23.6719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: byo4HNjFPbokVhJQJl4YDMiVBYaLuwgljAL3h3gX0PAxif62TVMWIYfa7RNt4h8KzZdhc/golA7oBQBuBCJJmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
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

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Sowmiya S
> Sent: Thursday, November 13, 2025 2:28 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v2 8/9] tests/kms_writeback: Refactor writeback-fb-=
id
> subtest
>=20
> Removed individual tests for each format for the test writeback-fb-id and
> introduced dynamic subtest generation based on the formats supported.
> framebuffer creation was now part of the subtest level based on format.
> This logic was previously part of the fixture
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
LGTM
Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/kms_writeback.c | 47 ++++++++++++++++---------------------------
>  1 file changed, 17 insertions(+), 30 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> f724cd33f..530915ea1 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -51,9 +51,6 @@
>   * SUBTEST: writeback-check-output
>   * Description: Check writeback output with CRC validation
>   *
> - * SUBTEST: writeback-fb-id-XRGB2101010
> - * Description: Validate WRITEBACK_FB_ID with valid and invalid options
> - *
>   * SUBTEST: writeback-fb-id
>   * Description: Validate WRITEBACK_FB_ID with valid and invalid options
>   *
> @@ -717,37 +714,27 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  	}
>=20
>  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid
> options");
> -	igt_subtest("writeback-fb-id") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors &
> XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> -	}
> +	igt_subtest_with_dynamic_f("writeback-fb-id") {
> +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> +			uint32_t test_format =3D fourcc[i];
>=20
> -	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid
> and invalid options");
> -	igt_subtest("writeback-fb-id-XRGB2101010") {
> -		igt_fb_t output_fb;
> +			if (is_intel_device(display.drm_fd))
> +				if (!strstr(igt_format_str(test_format), "BGR"))
> +					continue;
> +			igt_dynamic_f("writeback-fb-id-%s",
> igt_format_str(test_format)) {
> +				igt_fb_t output_fb;
>=20
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> "DRM_FORMAT_XRGB2101010 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> +				igt_skip_on(data.dump_check ||
> data.list_modes);
> +				igt_skip_on_f(!(data.supported_colors & (1
> << i)),
> +					      "DRM_FORMAT_%s is not
> supported\n",
> +					      igt_format_str(test_format));
>=20
> -		writeback_fb_id(output, &input_fb_10bit, &output_fb);
> +				create_fbs(&display, &input_fb, &output_fb,
> test_format, &mode);
> +				writeback_fb_id(output, &input_fb,
> &output_fb);
>=20
> -		igt_remove_fb(display.drm_fd, &output_fb);
> +				igt_remove_fb(display.drm_fd, &output_fb);
> +			}
> +		}
>  	}
>=20
>  	igt_describe("Check writeback output with CRC validation");
> --
> 2.43.0

