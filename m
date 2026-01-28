Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C181AD35687
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 07:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5850C10E1E8;
	Wed, 28 Jan 2026 07:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CicACRV1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A131010E10A
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 07:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769583844; x=1801119844;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m/Mo3/j8uYutweqeK0d/LwmIpADxxSCLV+glygTdM3Q=;
 b=CicACRV1HygRhd3zr0fZW9GyzIJeuZ55M/NV9SD7kQbc8XwFrFrpUPt7
 VwSxtmcsY7DpBijBj56b/7ECiVTD4R89yqXPzLubyiQ/SXxq6PIawx5gj
 EvxFnSIW3MmD1Tj+Eel0W4dpVK6kFAxErKYx94ilvssm7WOf/37dWNmcW
 C40ZPS7YaBC+Q0RQpR11EXNSwYkezcUPI7IqVMKQ6eGYEk2yDG8gtr//X
 h3OFetypR2He/woPTpf4Kbqm8RCgWqQhDP7CSMn13AIHE6ur1fjiPVvJm
 J7BQi9QD6dMufGPhDEu9SAib8RD4Jx6+IpcHAzvPxCXt9dbGUHISoYL+h w==;
X-CSE-ConnectionGUID: oJrw0ZCeS5eTV2k4VdYdSg==
X-CSE-MsgGUID: jwdw5pqQTGWgtJ+kf18OpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70845787"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70845787"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 23:04:03 -0800
X-CSE-ConnectionGUID: 35Hb/U4PSxqSTHNl78JqAA==
X-CSE-MsgGUID: /csuMl4SQJePrPIhNz1+oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="212667646"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 23:04:03 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 23:04:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 23:04:02 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 23:04:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fz0dN2Ap91yPyDV/V7xSp0RaktuuN9DwLHCZG72cRm4IGO8YBSyRoC7A0GlLt0kmiK2np0gtTiaWcIrP0a66OocotpeNbJBcP7mOapN+tFkks8kyeyTVBh3T4oIogFPvNhUiPXhWMpf/WVl3PHYYxXAqVjr5pwd/KyZ4W8SBp9NW419Hs5GCXmAgE0kzvfUuCb3PzFHhEgRh/ClnuKHJV27FkEq3f71M7lB5EkdZbiU7ACUf7CjQpnlVmtfih45GrBLD1Wi9pTg8may744TvRovQE0uRWec4SmF5MFx1h602ROUIlHS0um8pRvSijb8yvQQHFY4GZDrc38cM9AdZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mKyuMb+V07e6fcayzvMJTFDbMsh/L8fj77J9gXjUjw=;
 b=b+UWu1KvmcBxelYgcc+NdSLAx03t3E4AA9gnKxAwDX1z6oEVtjlth2ImuFHCjMeKnNZQ7DLhdGvdvXuH4LIHt2Rti2faIxHmxRkpWG7rEzEQHNpd5mjDjJmXgRXQWFqo3CK5lSNGaf/dxclAy/OJ6W2/Ht2VlTCTwwPH9b4+WSQ4BGxrDXn14P0wsbebusNBRCuZROdUcb/51oi4/DIEXx4+GsNsY/moqN4kVWq/XnwXuLrfb6v9GrXWY2NYQluaQoPwdLfjR0+y/dpRlZf8DYKo2QMsoxXBxjriHj6mD7zSWLHm8aCyfr4xMKO66mftrGkRMnlQUIZq9EU3UYRLjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 07:04:00 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 07:03:58 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Mika Kuoppala <mika.kuoppala@linux.intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Rudnicki, Piotr" <piotr.rudnicki@intel.com>,
 "Sokolowski, Jan" <jan.sokolowski@intel.com>
Subject: RE: [PATCH i-g-t] drm-uapi-experimental/xe_drm_eudebug: Adjust
 eudebug uapi numbers
Thread-Topic: [PATCH i-g-t] drm-uapi-experimental/xe_drm_eudebug: Adjust
 eudebug uapi numbers
Thread-Index: AQHcj7C+PfSRfie7BUGpCrrRuaXxqbVnKIxA
Date: Wed, 28 Jan 2026 07:03:58 +0000
Message-ID: <DS0PR11MB726405AD13F0780DAF0E60F2D991A@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20260127171624.2148681-2-christoph.manszewski@intel.com>
In-Reply-To: <20260127171624.2148681-2-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SJ2PR11MB7425:EE_
x-ms-office365-filtering-correlation-id: 2d164e1b-9b75-4305-d28f-08de5e3b6871
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?y0SCyCes0vGJ6Fq3Sz/x6Y6CbWMMhmmJBqNUfKot/A+M0F192FuxctsGyp?=
 =?iso-8859-2?Q?0Bo4kEG0gImqifNjHRSJu8tIKb0PbFLrUeE5nHa/knD6bxlvVbqFoERZ52?=
 =?iso-8859-2?Q?FtvbUj0uYBnSwoyAQB5KnKUN2RPVC5PuElBOx1agU/krmKrd6ZkfEWSEtB?=
 =?iso-8859-2?Q?2bPtO5W2CjARtmewlWEQlqLSoE6yPfeONZIEp/lt4BQ/i+BUK7qswZhouw?=
 =?iso-8859-2?Q?BiHP4BrEZ0BegnEzvegiwe2eJkEoUuOQ2UyiVALTurEIN70mBk/Q8PYcEc?=
 =?iso-8859-2?Q?ooTAIfM6xE5LZ7jmS08TQZUhza6kd3UuXarWr14Qxz9NU/8URezp1WdMGP?=
 =?iso-8859-2?Q?yU9X3dESVKPajDEcnHiexXYR9xvTfl/fRVNWiubosfV8KUQUZMRhUKJWjf?=
 =?iso-8859-2?Q?2b9Hc6HEdkjDFiYsBDR1v40y3KdsARbiCCVeobscc4ZRxGiKfL16SoZrxP?=
 =?iso-8859-2?Q?25rx7jpgTf61mbvx008MVDa7oCUr1gzi1HdaHGBLE+DpdotfO/ybWyN1bi?=
 =?iso-8859-2?Q?HbcxuRE/7ycSYTw2IDKRMeS1cKo1XyVoFiGBIjAVWLGpnE27WgHhFkUgWc?=
 =?iso-8859-2?Q?zJU5v9FiXyJxIrJPBG8HQHnJ4VppgYlhgMfelfO6ySLnHEi4qCw9DVFR5K?=
 =?iso-8859-2?Q?zUhNLxceuAhf0sNHajeBu2rm6R78AIBgdwxLI0bds6sTswe55Cvpwmhjcb?=
 =?iso-8859-2?Q?LPFe6htjAad26tvucbBd9lV+qL/+w6++3+ULXeyMQ0rzcf6ixTSl5WLcby?=
 =?iso-8859-2?Q?rB4vrfCfNUs9aKI8pOPC3l12hW3KtqliaUdmCEqyLmvFwCDo9CjsxZSPRu?=
 =?iso-8859-2?Q?6IbaBgJWZfJM8vAtXx5bq4QKHgolKdqs1rYYAVkQhB16Younzy4XSZppkJ?=
 =?iso-8859-2?Q?T1tOHnT/ZrLkjdKlMl4ONFCep3OdKrTxjnzkaNxoHRi2drIuKQDLkVTZIE?=
 =?iso-8859-2?Q?Q4ng2ANNmTUGSqtBecEMy9AvYyaaOdzaKV7izO4+C/OyJo67RxPDe8iTSW?=
 =?iso-8859-2?Q?vfnwJBlGhbqvq+p6mHO8cqLYm7wyy61muihSfKB+SFyiHy+QryzQzCiC9m?=
 =?iso-8859-2?Q?3Ti/MCsaMD1yzw21hkPR4+B9pGb3vt3tbfVte2yAnlOglo16MisiypyL9T?=
 =?iso-8859-2?Q?Wc9VjlBR2e9dpR5tlOClR8Mlf+ghaR8N6SsCcbC7aXlSFuAyvtyipqbJFk?=
 =?iso-8859-2?Q?89LVVQrJAfGhnhrnjBvs/nBWD7nV+TvlILggnB1o8Rofly2LzZJDMuy8kT?=
 =?iso-8859-2?Q?14WRwmcb8yjjNmdSk9sBmxFm9oAGXDDZVoS5/ATk6FPo0f7QoR4oUFchVg?=
 =?iso-8859-2?Q?5yNQLUc/5fLgMLBelR8HpZL0bx+MgqnXrNB551JxtC6/KMMiDIaIbkYf8z?=
 =?iso-8859-2?Q?eIGlboY3PADiDuGpSaPmOI/c/AnQjS1wbOtLb9juTiw1wn62vh55y5le5A?=
 =?iso-8859-2?Q?MS9VMfRoHBLBc/elCVSJUW+dOVO0e7Y8QtoTKBNQuOGSmhk3NHa+jFrlf/?=
 =?iso-8859-2?Q?NuQ6L5c1XxwDgYHM0DvUdxKXjModrQ7UaUc5GmfuzAgsjIvDUjsHNBVdjW?=
 =?iso-8859-2?Q?eLTO1UJEbnP3kLOxbbSQmVZk0pgzMhtonBVdldzukc7bpAMQTAMlUhcsVC?=
 =?iso-8859-2?Q?MCQVkAvB/bKZRKW3W5EkTPHCNJ44vVw4AQNE4B1CB3twJFYGGDqjtLxddv?=
 =?iso-8859-2?Q?z144WggaR/FmUJcfo9o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?bkxOlBsVvYDTNEddngo3DWAvtZO9YvrC/mrpTFOo3CaKF/KD4aZtX9tYQ8?=
 =?iso-8859-2?Q?d785yvgVxd02t+ErEeke6TZstCkEt4tpmnVRID0RYO7HUIhIy68E+SV3UE?=
 =?iso-8859-2?Q?1ruWBZlfwHXupHp/rHGAcb1l7SGEk76Tbv9Q+d7kKpMbUrGGM2bAr8S1zh?=
 =?iso-8859-2?Q?TBWwdidIyaHfTpL4ucb1K0XhoKstHlmjti3V8k+lfCO5G8pAIBC7Fc3erN?=
 =?iso-8859-2?Q?beUOLE4kXMzLRTYYcCFwSE+WyMU6pTt6rYIiwEUKFMXF6O3Orm8xNqK5/b?=
 =?iso-8859-2?Q?UAy7ZmDjjwEOWCAp+sd36FfUHFiKnVaLa6Ep8Eu5cxer6TuluLD8RhAPOk?=
 =?iso-8859-2?Q?1x1rpB8OIUbQrNK9k5R6zav0dBW3V6yFWi2TfYl92W+D/dXkPg9xXxYdF3?=
 =?iso-8859-2?Q?/IgtCaY6uwuDVwdle0uPhAj4+JtNZaj6s9XvWbr+GAmSaBNuudHRaILqOW?=
 =?iso-8859-2?Q?0ySTz1nhXfYwHhLLFMd702diE8yvjXWWSQsVmb/m9YCPKwwzmsnCQ5OAYE?=
 =?iso-8859-2?Q?t2CvtkI/WkrcTiNBoNgsChEgvHsx8jbFG5SMqgo4DSO9JVvJ2xXURoxpzE?=
 =?iso-8859-2?Q?4+Iez+CMqg2qSOozO4kKu9OBFBV2CBRyCVoijcLg49VIYgEarD/xtPrKYC?=
 =?iso-8859-2?Q?jaynQtiVhe9pwj1Oyd8TtKnzuF+cJgMHXEasQMS0LFh1P4yBobypPTNsZs?=
 =?iso-8859-2?Q?civkUHbN0bbvniEPCtBZI2IEBxb8ygwxfLf9s55b3isWEL3o4sfW+COC/z?=
 =?iso-8859-2?Q?7IstmvYf/6/L+38DW5bFJ7i9T5rS4lEWKQp7MP7Zc1naVen7BzG/p2F6xJ?=
 =?iso-8859-2?Q?fXyTCh4LNhXe4oqDV6ru7OsHnCjgbOhyAD6M4rEiv0fIQJoQY3wifgmIet?=
 =?iso-8859-2?Q?m/g84cyFlEzIANCg5rhSbCvykq8Vb59LhbLNM+9v8dtAMmFhn594GzxEIl?=
 =?iso-8859-2?Q?YEXo64bPOvfiQp0kb8l7+CWU9ikNDcyBbc6RdRNDtpFmkrgiHSMjbM/u9A?=
 =?iso-8859-2?Q?Kjk3Wg9Tz5up+JNDEY00foxj3B8WItky8EdNCLY956LcCaFXvriI6YjDXt?=
 =?iso-8859-2?Q?4d9/MQTzRNjOtU2hRi5xMs6/lRqo80OhsFtYdzsLAZXxG78FeW7noURxc9?=
 =?iso-8859-2?Q?sHnNSAplLl6qcNKzcHV8hIX6p8lXK7qUX4G9bFni/vw9SoAwlHn561h5FN?=
 =?iso-8859-2?Q?ROAq2OEwWp/Sr+hMnBNHaO9PsyZgvC8Um/HxlkEWcltSiWeM2rEFryd8aP?=
 =?iso-8859-2?Q?DHeiU+oFLnYRo4pOK1eO70Zmp6FqLFKEKwSrKLi7mATrMYJsskeR/0UgIF?=
 =?iso-8859-2?Q?JT/A7S3R7meSXNl68PeVyekE+K1lyDxIbW9boM95Xdah/KCk12/Od7stWJ?=
 =?iso-8859-2?Q?Bfrx3R0U88U9XVdTqmkYEHlBeRA1pbhTZTLTqt8ICITi+OSLth4s3O11BX?=
 =?iso-8859-2?Q?3OeHtsar7JuoG6Y/WlYfddPC2nf7AYfW07Zol1jn4lZCmDNmDl7pSvXcmp?=
 =?iso-8859-2?Q?gSmI6WqIn9ChUCkRaQdXsRAjBJfBilt8VEgSZ7t+yuguF8HKviU/zrRRsF?=
 =?iso-8859-2?Q?VAJ9udY1m8W5qnI0kYkciVDHu4lgwCyWANVX5ywIER8fnDZVsP0+ZgAL4f?=
 =?iso-8859-2?Q?Owi19fNHSijHlOB19jKHDfwND0l4w5nQFMevs+X2tCYMN6AJWU1ZT+l72V?=
 =?iso-8859-2?Q?Clx5nQMmJRVhsFUzjA1sfRHn8USe57IatLKuEtULx4Pn+d4C9NMz1LMJRO?=
 =?iso-8859-2?Q?JSPxWl0Y+a/H9pnhDcsDJeiC1qNaViljzCVp6QZ6ngG/lRUCa7sU148BHG?=
 =?iso-8859-2?Q?cX/AQmP2TzJXdsbY+AfTiwS9flU3280=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d164e1b-9b75-4305-d28f-08de5e3b6871
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 07:03:58.1252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c4C+MG8ApJGPJk/n5wLCMi0LAnq6f6izBgy/mH6wHfDVe5MXJpPjSXII7e8zDNVf6IJBnBBOsliCF7fdrK2zQCG0jmgVxpkjKdb+MPlNMzzvHUrVqInIQOg++7B8n7Jp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
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

Acked-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, January 27, 2026 6:16 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Rudnicki; Rudnicki, Piotr
> <piotr.rudnicki@intel.com>; Piatkowski; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sokolowski, Jan
> <jan.sokolowski@intel.com>; Manszewski, Christoph
> <christoph.manszewski@intel.com>
> Subject: [PATCH i-g-t] drm-uapi-experimental/xe_drm_eudebug: Adjust
> eudebug uapi numbers
>=20
> Adjust DRM_XE_EUDEBUG ioctl and exec queue property numbers to not
> conflict with the new uapi introduced by igt commits 4164b19c2daa
> and f1770346a78b.
>=20
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  include/drm-uapi-experimental/xe_drm_eudebug.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h
> b/include/drm-uapi-experimental/xe_drm_eudebug.h
> index 5aeb6a735..8e74ced2f 100644
> --- a/include/drm-uapi-experimental/xe_drm_eudebug.h
> +++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
> @@ -19,9 +19,9 @@ extern "C" {
>   */
>=20
>  /* XXX: BEGIN section moved from xe_drm.h as temporary solution */
> -#define DRM_XE_EUDEBUG_CONNECT		0x0e
> -#define DRM_XE_DEBUG_METADATA_CREATE	0x0f
> -#define DRM_XE_DEBUG_METADATA_DESTROY	0x10
> +#define DRM_XE_EUDEBUG_CONNECT		0x0f
> +#define DRM_XE_DEBUG_METADATA_CREATE	0x10
> +#define DRM_XE_DEBUG_METADATA_DESTROY	0x11
>=20
>  /* ... */
>=20
> @@ -54,7 +54,7 @@ struct drm_xe_vm_bind_op_ext_attach_debug {
>=20
>  /* ... */
>=20
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		3
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		6
>  #define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 <<
> 0)
>=20
>  /* ... */
> --
> 2.47.1

