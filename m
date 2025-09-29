Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D813DCAC5B0
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 10:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE4310E3EC;
	Mon, 29 Sep 2025 10:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JA5jpWLu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE12B10E3F5
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 10:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759141382; x=1790677382;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=upq0y/Vh1ol//9G3NWPR2UTFK3pK405wbSNSqPJqb2k=;
 b=JA5jpWLu2/ByiNiX5nKgzoTDjJXVIZsr1NYM4aceolxNsZ/YwpeuYw7U
 D01gMTdrt3lzqchnV8h3aUcvF4XVJLavn11apfh71HQkvRrQQJo8eXtV5
 TSs8Sbh23/71Pplt6ObtZQsR+EGr/E9Ch1/M1oUQuhyohI1ODuyVIL3aU
 eUSxWfQJHso0jt55APZkZ72yifJ/V+gmG8dbfzWDRmQDiuF6gDcO1cdfZ
 IeydEDTr2tmmdmqnB5pCNxRKTlWqhLhh8JTT6lpv+4xPmQ0rULy31QKY2
 Xyec4s/oeyoQ8IUW3GMYi9fx14tHQktGd54rCABlpvppSKbIAyxYsUAPG Q==;
X-CSE-ConnectionGUID: px/4uwaxQNyAE+QXV2fMsg==
X-CSE-MsgGUID: DYNuKIojT2K8m0Xhqi4ZXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61426669"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61426669"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 03:23:01 -0700
X-CSE-ConnectionGUID: hbG3WbKfTAO6Wuppknat9w==
X-CSE-MsgGUID: AHe54/GyROalcDXrYZUVLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="182617285"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 03:23:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 03:23:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 03:23:00 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 03:22:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njolGdmdIT9UBjn7R54NDKVrr10eyNmYv0f70R0jbI5Xir1kqL0V0AxVuQT18RxHoPHbH7BOo421/3RAgcoOj9j5N40px8tVBL+movXStT6ojkG8oQZMGh6NsrD7c6cwm7C7FKkTR8Z/A1eSyptUTzPrpI/3XbFQLS5t/pMBIJ7miTUE0HQYpfg5B5XzzZELYexK6xbX68Q1KK/o7RuOIp3VHa117QBtxUycUiiHGTFt2QgSlC541S0087IJSUivYmnj3ReedVKrBxD4rUTWH7oBMkS/OQUYT+nh5mwPPvWUl2gEPKwnD578d+DOmTFH/Ghnq/2sATmAM24syoKaQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xdT7PDNLPLQZRkf3XP3j8CUVpS46/gUjO8jeTVAWpQ=;
 b=cFd2PPS6E2EjjHYVtXoVSpE1rKAS16gRo0AOTlx+JZH19GxSG8apUiEIeH+RG9VJlygLFKzUDepbQGLBZkByYsfPEqDYis/PKsw+yWxSr94aO1VT3HChgm+W3f9r4DuZayxuin65+0B6kQTuPAq8DQtbEmBjNTfVN2khDIyZlGn0hKOKRpzpVn61M6BJZ3qP9ORV6kowtp85xef43cLj4+VfttN3dMlRwoHYKGUVVe2F0iDVhDeEu8fmGnX4eDbUiF8jheYmKgurHAmkzuY4XWjfwkPhR6pyKw9Tkh3cfxpu/Cm/yM3JxrZFKV7XaNBLfBIZEzFpq25RANO4zlv6fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by IA1PR11MB7679.namprd11.prod.outlook.com (2603:10b6:208:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 10:22:56 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%3]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 10:22:56 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_pm_rpm: Add system suspend idle
 test case
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_pm_rpm: Add system suspend
 idle test case
Thread-Index: AQHcKM6krr7055wKJ0OCtzXvB0aSqbSZTRMAgAb6iICACbucYA==
Date: Mon, 29 Sep 2025 10:22:56 +0000
Message-ID: <PH0PR11MB4806051740CAB94BC07B8CBDE41BA@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20250918190105.37420-1-mohammed.thasleem@intel.com>
 <20250918190632.37576-1-mohammed.thasleem@intel.com>
 <DM4PR11MB63120CA419902E603E263AB7901DA@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB63120CA419902E603E263AB7901DA@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|IA1PR11MB7679:EE_
x-ms-office365-filtering-correlation-id: 3bba74e1-ecff-4c33-3b81-08ddff42285d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?N2K1DWOmUBzu4Ae+YHEe6zB7sdqLBlJpo8aCXR8xRBzPhOZxVnjvZqhq+EPV?=
 =?us-ascii?Q?RYm2nMaUNnJstfAOU9zwvkrLMgGhTi9byUxH7vf58w2dNuJlvmBrxKEvGQL2?=
 =?us-ascii?Q?VER1/h11qFUrmW2477HcBtj2S1ecEY9pOg8p80Z+Q2iRuIycIyJ8llUXCdx7?=
 =?us-ascii?Q?+xBOohJ/c3ZNhExrKNcMgl63BUI0rwDQc1TKLfVk5/i6rUNTKtN0GpQ8B9Y6?=
 =?us-ascii?Q?oBn7/QMQBOfmHcqCCM0Z9MKF/tkwtgz8YmM0PG86DUICfVveQQD8L3PqgVZ/?=
 =?us-ascii?Q?GiO8LphYqsnbhx5n85VYvDJxO6H/5NpmW5uRIKmO4fYKWNXq0gknA3u58Sgy?=
 =?us-ascii?Q?IY2nh1gCStq6S22LPv2MkOUqlwJyZrHpPTVq8/fu9MsnOgf1+9zYDeKQsaH8?=
 =?us-ascii?Q?3DXQ5AafF2OCYK3FWFy3PuqdniRQYQV/BE2sVRsCDiebIQbcHiQi/B/7f/en?=
 =?us-ascii?Q?Oj6zE1WevnMuyTPLz2fAWr9moAqcOkgWfVUR/RdiYxLLcwPrn2B3371F9hSU?=
 =?us-ascii?Q?Mqd4BZoK46I/31w3zhClJH4J5/nu8FsZkRnzuwBalwEN6niVP9bUAFZJgN3V?=
 =?us-ascii?Q?RbJt3ORdcfsVJASU1xJt5bLnuswSbKSMHTdAQivNzKwCgdWyK4WcdwhlKbtU?=
 =?us-ascii?Q?hD51j4OVeBuhluxrDGpbYMWu64aIabx90PxAhUYL48eoKR9eLSfVdpoqXLES?=
 =?us-ascii?Q?WAYVaSN2ViFzmz2NdUeopPobDHHWmYPM/ln+hM8W3El3fLyKFAyGokuTEHpv?=
 =?us-ascii?Q?2i/qeLkyKGfzRbVMRKZfmzhWZxoaY6q8BaJp7+hkzqC4X9RK5R0RL8gnVTMz?=
 =?us-ascii?Q?zx9unklKgU4cI9owHISJvq1OGNjLnCwRgxDHgfCgA6l8I/eOaXwuxqQzAFKW?=
 =?us-ascii?Q?8IF02r9XckMKI7oOJxQlSKW8c1I+2i/gLwh3NlSp+nSjW8pzrxpnrCO+iUX6?=
 =?us-ascii?Q?sXwdS4vamdvf9QmWMJ406tHKyGZN+XBJIQGdJuzkZaatGo17f+W7EAYHHDk+?=
 =?us-ascii?Q?P7Wa02HIEWdzAQsQrIj8uR0y0JwDXQWwqqlzPgVRPVys0QZozSi/GmnJGYVx?=
 =?us-ascii?Q?Y21E4MpIQzNOWWI70xwEOSxbfhAB9FwktCIqfAC5mU48/VO6Jf06QxuJUz+j?=
 =?us-ascii?Q?mT6XZttsGFXNdfG4ivYyRKHNXLSvhati011dHcDGpIrgl3/FkF+tj6v2wDep?=
 =?us-ascii?Q?6hJB8kKCTxthNdCxqk/B5Pmc/2F0KIPAY+EYuvY80ur54VeT2qYcS5F2vqMt?=
 =?us-ascii?Q?DTmO83H/kgzgu/oK+FpWb1/8Khv1+tGhZy1FfxBVvemSLwjlrTDU/EoNfHgD?=
 =?us-ascii?Q?+3qtHV1eCT0RIuYIfSEmvqrKOT7BulOTvUseEtD8DfMhZ9Ai0Ld94kNYRAZB?=
 =?us-ascii?Q?O1fUnuXPZUDSJUWMIQBVg6XHTPWyTPNUjdPXd77HE3AzuR9678fSVLJDN9bD?=
 =?us-ascii?Q?TTjDLerSfpii/8Fexe1fvGNHYDbhJs5wTA+pALbHGVy+afl96FjrpockJwXb?=
 =?us-ascii?Q?rdvmRO7XU2yPEeNXIrHAMSgjkm1aOacjcpee?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2BYVQC7B0czhs4hT8Fcl47zleudY3TrgvLEdvsH6/gp1Gfki1Q3yOzbOzGPp?=
 =?us-ascii?Q?pEwcM2N1bqsV8kjEWJSFVbGYkEWyuN4UIihFN+o6rayvQx7wMkS3axAJBVwF?=
 =?us-ascii?Q?EnQrJJ63RhDtUdK1L8EO9QwUrfndoowrH9iHHoYRWI4EQ25SGl6slj2hzk9g?=
 =?us-ascii?Q?X+Z6dCoYz5N0zo/1CCReOxB5iSqo0PD67vXpOz5EZkgjU1UHuJA9LpMEJdQf?=
 =?us-ascii?Q?VQpFVInt8jWEnj6Uyw/wmZkAecYyEUebr2C5aGOca94jU7qQEvQ273rW4qwT?=
 =?us-ascii?Q?kCp66lxxsFf/2R1qBW30SLvejqB+PflSj9zaaMm3idiuIeva5S4k5cIFuh0l?=
 =?us-ascii?Q?w/b+V18I4CykPee95V25JnObSXrE5lUqbbZjIKGx3Dft72RXS759vjRKOaPy?=
 =?us-ascii?Q?Ks7CX8sPfJrOzDmdKJ6gNFhOVhgMUlLVDJcvtQb6nQXsgcBSrZh7mbtOuCTt?=
 =?us-ascii?Q?/PY4sXijP8J34liblqcaDJHH5pK9HlMNTExpziEa2JsbRiAXS/3AfT6Ea1S4?=
 =?us-ascii?Q?Onn4BZnIfNGL6o2XJYQ/RfRvKneBQ5x5Qqd9vOtiyHr1pEt+UXyL4vzpYcwt?=
 =?us-ascii?Q?h9AhAj5wvtpFCiOAmmCcMKuYASI8nUq2t5KXeO8bWcktPsHSqR7TxwLP7dJH?=
 =?us-ascii?Q?4zBndeVWfiVGVhBaQofaBgWdSUV8jMDijTXRHmmBkbMmfVHjOszE6y/TCnBr?=
 =?us-ascii?Q?X9LSUO4zmTaKdYHfH70/MayMfCytYYu8bo9g/vKwZFsoePShDX2GJ/JANAx6?=
 =?us-ascii?Q?3IQcdKPo8N+9YOG6gGjUqq85nKt7rL3mXutKmzto8KAcCmvAqiBOZc3xuZ1a?=
 =?us-ascii?Q?FBI4OAZrGbuT147Ykp/VBBCQTVS0mBAB7Y32gXaTx/kQjVVHcz7aRA7EORff?=
 =?us-ascii?Q?0jMw9EmvOPce97q2BGgo6sRWE/+pB1jLW4+d2zZar0jVgT61FL945LAVtihM?=
 =?us-ascii?Q?TQhooNJTDx6rGRL6miVMmDAnhJI1kM0xlVfU8FzExFX0XNrWFzvRmlh4fJGc?=
 =?us-ascii?Q?Xc/e87bZKlY29HvBQboXvULa3fQvIAfC1sTVleqLw1hgOoMBOgnUGmtjfr7a?=
 =?us-ascii?Q?RrWmAsqrf81qDLXDnygRNPygpviScvtZTj1MQCwZXiAYieS3VYiRminqtL9q?=
 =?us-ascii?Q?ccHYRCAvcugPHwbmrhoPHcZiQes8xITThbrxP0ey8PfOGbjiBny4lUBMRw2E?=
 =?us-ascii?Q?r/g7iMlwzq7UhEvaJ8XU22q9EcD/729bdSzTJvKVRuH04lh2Y6P527VMpQdv?=
 =?us-ascii?Q?cl8F8C4nlXRFrR2LLV+zb9k4G8jhsztf76xPmYmJ4d1wdmZSH4+1lJ6cZ7Ks?=
 =?us-ascii?Q?EiM8p5al3Ed7knGOYbUfzzKg/Aczuv0XN9Tzv9PKZHjzdwKv817aIzwqtEHm?=
 =?us-ascii?Q?KsT/rNniE/FqSYNKNYysjdf4pjOEnlt4WSUWf8Ns4GzTGPiZFLl3BjOeO57B?=
 =?us-ascii?Q?7mc7F8J5yFLsx+2ZCMpY5pIIxbHq2NKydHtT0HEegzcUgvZ/WtuIKUdPLKzz?=
 =?us-ascii?Q?+qb5clbuzZatZ/6v4niy2FQ4Ri/3gZBETgoWesE81q4cespKULBC+bPMmu9X?=
 =?us-ascii?Q?RNnVVaT2RVo+0Dx13WenNWIMDYpLkEPpEqRTxK9XphlChNhw4nMpGzGF0AFH?=
 =?us-ascii?Q?rUR41681fwXiN405Wz9Lbxr0l72xZCmPCSuC5h+1l65AmrmMo8VVJY+47a5J?=
 =?us-ascii?Q?lIAVpg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bba74e1-ecff-4c33-3b81-08ddff42285d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 10:22:56.6186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D/LQpX+LOnn09zld2OAIb/OKfV3rj9ocDdcPA1+d/+VAa9VMdoabN2G/m7KLyOa1QbrwV8E7CLm24X/Fh37kW1guo4DxI0SkQGzKmDwy8RU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7679
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



-----Original Message-----
From: B, Jeevan <jeevan.b@intel.com>=20
Sent: 23 September 2025 11:11 AM
To: Thasleem, Mohammed <mohammed.thasleem@intel.com>; igt-dev@lists.freedes=
ktop.org
Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_pm_rpm: Add system suspend i=
dle test case

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of=20
> Mohammed Thasleem
> Sent: Friday, September 19, 2025 12:37 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/kms_pm_rpm: Add system suspend=20
> idle test case
>=20
> Added a new subtest that tests S0ix (suspend-to-idle/freeze state)=20
> functionality using SUSPEND_STATE_FREEZE.
>=20
> This expands power management test coverage to include modern=20
> low-power idle states for comprehensive suspend testing.
>=20
> v2: Update subtest name with system-suspend-idle. (Kamil)
>     Update the subject title.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_rpm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c index=20
> 344ef8c94..1610404ff 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -128,6 +128,9 @@
>   *
>   * SUBTEST: universal-planes-dpms
>   * Description: Validate universal plane (set/unset/change) with dpms.
> + *
> + * SUBTEST: system-suspend-idle
> + * Description: Validate suspend-to-idle (S0ix) functionality.
>   */
>=20
>  #define MSR_PC8_RES	0x630
> @@ -1685,6 +1688,9 @@ igt_main_args("", long_options, help_str,=20
> opt_handler, NULL)
>  	igt_subtest("system-suspend-modeset")
>  		system_suspend_modeset_subtest(SUSPEND_STATE_MEM,
>  					       SUSPEND_TEST_NONE);
> +	igt_subtest("system-suspend-idle")
> +		system_suspend_modeset_subtest(SUSPEND_STATE_FREEZE,
> +					       SUSPEND_TEST_NONE);
What are we waiting for in wait_for_suspended state, is it same as SUSPEND_=
STATE_MEM which wait for Some dump/check pc8. what is it we are checking fo=
r FREEZE we need to provide more info description if it is same or define t=
he test little bit more. =20
	-->SUSPEND_STATE_FREEZE tests suspend-to-idle (freeze state) which execute=
s suspend/resume without entering platform deep-sleep (PC8/PC10),=20
	     unlike SUSPEND_STATE_MEM which enters full suspend-to-RAM with deep p=
ower states and wait_for_suspended() waits for kernel suspend=20
	     completion - for MEM it waits for deep sleep with PC8+ residency vali=
dation.
	-->Will update more details at description while merging the changes...
>=20
>  	/* power-wake reference tests */
>  	igt_subtest("pm-tiling") {
> --
> 2.43.0

