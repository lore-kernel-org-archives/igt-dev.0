Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89E9CF043E
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 04:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8187F10E63F;
	Wed,  9 Oct 2024 04:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YflhZf75";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8378310E288
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 04:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728448307; x=1759984307;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=ZOAnla/TgNWrnjxiRTiFdSM6s1cj9kB/DxAOS+RZluE=;
 b=YflhZf75d3vOvryAaM+egQYUND9obG5FM8oEMCgOJCMA26/+K5q9+2Mk
 Xbguhj0yOG7e1wGfOhthpn3pBYxKB7lbpQ7jOxW0oDvtqztFI7n9YLTVh
 INqV3Wv6p8MKRudtYLvMTn/JVZkq+qEnef4off9QEc03zY/MCeuRBHdli
 JgRnHFa0AtymoVPlIqHNR0zngISzyYXkncAoSo3RXbMFCxAc4Qdp3yblb
 lC5y9/bw3RNs08YQMMgRkt+UDWcvnHO+EkOY0dumhH0vZvXUaNckYDYHS
 kO1dIKwHk5qYKeyqE2dYG9YUzFEtjJ5sa1NgxvMdVAvLYCx12MzLqiPFg Q==;
X-CSE-ConnectionGUID: ztptozjsTCmMyNXggscbrQ==
X-CSE-MsgGUID: D5cmK5K1T4Gk6yIrMnWuuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38310756"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208,217";a="38310756"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 21:31:39 -0700
X-CSE-ConnectionGUID: dFqdcTS4TLCWdN3dH49JYQ==
X-CSE-MsgGUID: 80Rq2drMRB2vJjSgc0nQKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208,217";a="75783360"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 21:31:35 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 21:31:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 21:31:34 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 21:31:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/+3azbfquPuJ9CLUw8jitpM2MwUAtoSq/PMR6ZB0QsiPzD7Z7/RnOIs2rJQMOXaGauXJRzVvtmheZcwAlso5Jpe80PuaAQ5QQNzgrQQybffwaiIYecZmhm8hEL9047nA28Q0QxC/zL8+cC2IzyxcMZrZKvhyN0gk1I2VymrreqKR8LsaQk8LZZdjnPVMXIzpovlTk9fCTe7w/A2ItENn6jUI2iu2aze1xwpzHuXemv9di4zt5TbWAWPnsJFk8aGpMAF88lskI6yjFw5aErxAv6bR9c2026Y3FvbNR83So159S3p967W4NOeil7Lw1HAMdGfxztKrLjlMDZUIKwKmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMCPfkxCuGRsY5jE1hF6jUIEZbN2MXadPdhaQctFB3U=;
 b=xzM1Q9+C68JWgHAKzOKoXdaOfFNaSzcBKzK4nSOU9dkPhngdpNGX/5vCMK92SyXOwyDEkOQa8XFVg9g16bQvIqWmqJ2VPfi50KIy2pu8AJDGYH1M1YtkgU/nRTGIxnBJbcAS2xHdaVJAsHTdLQGeb2paSRK1j4qbfLYzW9MwNnWuvCJn9lW5s360MlBRpdeZMT0qrdv2T4mhCzGuWxdANySmzfHEocnW18vPTW9/AqCHfQ/7zpmwzqk1NWBhpBjiCJrBuk+idK4PT/y2mDzLp6KXTIjvkJd2CzcwKEy9B7K4IrOEdLrOVgxA9xX9+q/lUseD95ll/JpOFE7z/4ygnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by SJ0PR11MB5813.namprd11.prod.outlook.com (2603:10b6:a03:422::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 04:31:31 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%6]) with mapi id 15.20.8026.016; Wed, 9 Oct 2024
 04:31:31 +0000
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>
CC: "Samala, Pranay" <pranay.samala@intel.com>
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation
 in HDR mode
Thread-Topic: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation
 in HDR mode
Thread-Index: AQHbFNtFBHnfhdT5iEKkTUs9/AugurJ2EFIAgAAALRCAAAbAAIAHxh+k
Date: Wed, 9 Oct 2024 04:31:30 +0000
Message-ID: <SN6PR11MB27047F18FC2823284053C086DB7F2@SN6PR11MB2704.namprd11.prod.outlook.com>
References: <20241002145503.910536-1-santhosh.reddy.guddati@intel.com>
 <20241002145503.910536-2-santhosh.reddy.guddati@intel.com>
 <SN7PR11MB675059F459088B309491341EE3722@SN7PR11MB6750.namprd11.prod.outlook.com>
 <SN6PR11MB27045F424115435C60CC64D9DB722@SN6PR11MB2704.namprd11.prod.outlook.com>
 <SN7PR11MB6750A1BADDB0334F62DA5420E3722@SN7PR11MB6750.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB6750A1BADDB0334F62DA5420E3722@SN7PR11MB6750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: bhanuprakash.modem@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2704:EE_|SJ0PR11MB5813:EE_
x-ms-office365-filtering-correlation-id: cdffa555-bc95-4390-8d82-08dce81b3faa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?Windows-1252?Q?4rpKclsjUVPVNoKG0IwfmOJJR7F4aWJZfsnqVc05Z06v93xSY8LV0KxR?=
 =?Windows-1252?Q?CUyu1/NAaTwczIwKqRbZrfDmfrB2jkOJ6W2Is4gv9dgOCTzhgn8jb55V?=
 =?Windows-1252?Q?R+RkAKOJ78Jl5n6J1zHpxk2ZDYY8poE6qO9xL97rznWU0nLpGZFXF1bg?=
 =?Windows-1252?Q?RgkXZh1s55gHrt+BSE5iouajtVopuyF7f/zcC+xaHnQtEee9rmuu8h9j?=
 =?Windows-1252?Q?MUfKBtSMQ18kX1kgE3Hq/FCCXkwGN0XizjdgSIkt94yJSXGsFi/WCSAY?=
 =?Windows-1252?Q?3fZ1VUvzC6k7LYA6StPbOuIbTmNdyQ5mWFRHiWc90OKuvE1fw9URBqWK?=
 =?Windows-1252?Q?kgZ1KmJc12uTSIWDMVDwakHfVQcN5Ug4uK6utxRxTWjHZ3ZPVrgD0A6M?=
 =?Windows-1252?Q?IQbIaykR8mI3+2b/tiUxUQfMPv4fKVegGcUs2slN+7SFO4lZ3VeHt5hE?=
 =?Windows-1252?Q?nFgZxUaBwHe8PbMNkMTa37egsOcI4BnEuP5tK9LuEoMYkt5OZDrZ43rQ?=
 =?Windows-1252?Q?r6Qthy0Ac+FMiCVWAlr+5RmkK2VqkuMj+m1l/iUpFK9IgH8KY0EG9aga?=
 =?Windows-1252?Q?VVLTRUInnf38pEEi2q1nTHD6/QRABQIiiU8fvkBmVlOejSXtW4giNu21?=
 =?Windows-1252?Q?nfF3Cttt4F21k6CJF1wsxfcfEQz+ANuoQWp2svlokjPuShDx9SCaKxXc?=
 =?Windows-1252?Q?ypgEDHaEZVn95YOF3TOg14c+aXR7ghPi7juGXgjV9nqqf+pwUaEcF2FE?=
 =?Windows-1252?Q?p/Hmc1Iuud4snxJWcAR0U0Ul3gimpbFd71r/nUfZxAe5HxxZ5oEbpf/1?=
 =?Windows-1252?Q?UTwFan6BSKx7Y6LHlxPzy0YeXZ1EAM2pABI9ed9zGf6gWUNECVxHcX/h?=
 =?Windows-1252?Q?3pMq4Uwqylv92sF2RoVRuOMYY5Wfja+A6DvOby0oUqIdXsiCEB3EHmQv?=
 =?Windows-1252?Q?z63Vx6khAo9XPcQdWngH6We2wE6Mz1YQigkm2LbSn8jzK8DdWQtcMO63?=
 =?Windows-1252?Q?5RVRGaST4DaAXxzbpRSiwVzz41BoQXyI3d/KTg8qcSqBkTsK6q5guWT0?=
 =?Windows-1252?Q?5K/7pE2Ga/fIyUf5wMHAbzQcGMR0AfM/E1dSHbyU6UddikHr/waDXQSK?=
 =?Windows-1252?Q?ULG+F5UlrinpbFt/uoELtgny1MN9hbaLpwaehAeMMXGLQtlaK4SJb5j2?=
 =?Windows-1252?Q?QcgP66ti8VrhcKsbFaZcZzpsbnHw6+12MTJYs2Q1DHALLiJB3QPOVgw5?=
 =?Windows-1252?Q?1CqYW2Q+MfO+BTvrGhwMEh92UjUy7gYuXuRh/w+noCz3tS4grpXyRMGD?=
 =?Windows-1252?Q?wUO4LIDiy54D0IBk6rI00ESDFnZuMwAzTCKZ7/ng9TYQLpeLefbk+v68?=
 =?Windows-1252?Q?CP84lBVNvZ08YfSEC0KHzTbVraK02iIgxI3Q9POVdSsSCmlP+Ml/LfE8?=
 =?Windows-1252?Q?V3NSMt4W+VRTXL7pMmMd0w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?MnzDd4RdlhoTt4RCTIwtmLrrOvOJ7SMidRbAu7exJSiblcwQI2RDTbvU?=
 =?Windows-1252?Q?gt6gcGvkL5hb9TRE4pwGQ6Pnk7hYlQc6JZo4XYq2b6nYDMLFk4dC/2sf?=
 =?Windows-1252?Q?5Apl9kH2u7ZrRCtT9SV0v8DCdoX9fJk7OxhpeUdwGUVtONLo05dun+RT?=
 =?Windows-1252?Q?IstUAaBoUVvOCHUGGyO+QV8yJ8j6l+VuafktpJEfJd1Le0+fy6SPdnQI?=
 =?Windows-1252?Q?SRJ7IJILQAAfcHfBAclTDsxvoFH/Ivdxe5doHqMdj/oN7lRT56EhiXeK?=
 =?Windows-1252?Q?qL3ACSbCKlUPkDXEi24DD3VlEHpPE1cf2ThzYtvafa1vX2vNNlXDmBik?=
 =?Windows-1252?Q?jjbkwoa7+qyiBZE7LA12bjiQCcrDiV0QTpzvqFw1X8jsrgh4IAIEjDmM?=
 =?Windows-1252?Q?ASE74EF9dZjMlO8QD/qhEpX87Prk5RYBaze1Lv57pgrB0IlchHmeV7oD?=
 =?Windows-1252?Q?L6lzr/t9wN4ux/VbM8eNYJIZsr56yCN3Z71sE9RdoJRJG62mcub/vS60?=
 =?Windows-1252?Q?Ny6jvcbCd12/0KVrMIQUBzRfk/UW0Ksa+dotJIDs31Cw7S+ATD14PPGb?=
 =?Windows-1252?Q?SAbDfBMM67PVTLpBvtyuP0eVi2AX6BHd9HQCgU5N0GCsW16pvYBc/W5l?=
 =?Windows-1252?Q?dEsqW3fFtd+hvYC7zbdH11z0Q7TAX17BnL9fQ9eCUJlYZb4eX15D/oET?=
 =?Windows-1252?Q?HyTDwO+DrlaEB6Rz9kI9wENbV3o16gGLYgqKjF/AbkTLf+JShi4Jb1eN?=
 =?Windows-1252?Q?mKitxLnvaMkEENUV1n/AlUH3j65I/zYaFO8G2mjozy+Gysk/1OTf109O?=
 =?Windows-1252?Q?3eGnWLpnVodm0UebeRjFwOXXEoQ+IZkRq97JCgTZIOO+MT24zyaI07Il?=
 =?Windows-1252?Q?2WH5HXGN8LLjis9rCLmy1Nzt06Csm6v5TkfJl/EtQ3VXSBZQ6f4qcyi5?=
 =?Windows-1252?Q?nQg5g5nIY2zPB6WY83GcaexFmz3yPMQxrPfDRHaQA41K8BQfe9WalRDD?=
 =?Windows-1252?Q?iV3uYz0bGtG4FFRCn2Vjkn2W+WinZ5wak4QTlG0SwG1hhcl6BA3OxRF+?=
 =?Windows-1252?Q?79CPQOGYPNV/1HD31uMxiCphHUo4Y1MlyuaNWfujJfNUG2mbPye4xRg7?=
 =?Windows-1252?Q?4lXc/T6wOoD8L2/TZmnpQgvfL1vdEhk+BYiAeLuShDGYM14GdmqhPaqt?=
 =?Windows-1252?Q?zvrsbiMx8Zxn/CE2CNEFbyUHP/TUnNjHyTJatRcEpTaFYco/mEp1zWrx?=
 =?Windows-1252?Q?kdsPweMFyLYypisiYgtilHSwZE5o3cCwEwyuxFZbcSOp8KIDXLdIv9Q7?=
 =?Windows-1252?Q?nLck8xNH3rWr9jpgIuxIcF0Dy8aMKWGTJU1RhLpKnNnh6HqaaFYWHqqo?=
 =?Windows-1252?Q?58cFpPqwbY7a0v6fxOC07alDFomqokAjk1xQHKw+O6dXnn2nhTz2KO5T?=
 =?Windows-1252?Q?6hM/zwmYstH6NwL5OgUyf42tF+Xx5wsS+p3SXXxyGNV2huR+9w9M/Imf?=
 =?Windows-1252?Q?jamKZw2i0bXu6Sc82KnaO0RVXxZAynCVeUf2yNGtT8yAnyYn/9keEf/3?=
 =?Windows-1252?Q?t95+qYW/Jq8nv26x6kJl86NaDjHcr7b6nM01dY2ndf5+lonUZwqTcKRg?=
 =?Windows-1252?Q?n7J//q9viz23IXG6hc8uZa5b7d7vHC+MV8SuGQp0aDZgOLHw9cclxJdA?=
 =?Windows-1252?Q?ZseQHqEbVoiBxs88tbZCVh9yKaSUQygVVvVFxbDgUa2L9b0Gi/Cxzg?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR11MB27047F18FC2823284053C086DB7F2SN6PR11MB2704namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdffa555-bc95-4390-8d82-08dce81b3faa
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 04:31:30.9579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b0BmSfPjfRx4rXmYvos+lxPwY59jNoaT4cl2EOtf7Pqt7JS5NaZMeqJKtmAPBVHvzcuwti7VV4fkvSY4Av6DczdYGcZZrmOtaK/r78bLINA+Hhtvp3VSamHNSHSWcrcN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5813
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

--_000_SN6PR11MB27047F18FC2823284053C086DB7F2SN6PR11MB2704namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

++ Bhanu

Hi Suraj,

Thank you for your suggestion regarding code sharing via header file. I hav=
e tried to share across the test files unfortunately in the current igt  se=
tup, we cannot re use with importing the header files.

@Modem, Bhanuprakash<mailto:bhanuprakash.modem@intel.com>,

Could you please help if these functions can be moved to lib/igt_sysfs or l=
ib/igt_kms ?

Thanks,
Santhosh
________________________________
From: Kandpal, Suraj <suraj.kandpal@intel.com>
Sent: Friday, October 4, 2024 11:14 AM
To: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; igt-dev@lis=
ts.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Samala, Pranay <pranay.samala@intel.com>
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulati=
on in HDR mode



________________________________
From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
Sent: Friday, October 4, 2024 11:02:42 am
To: Kandpal, Suraj <suraj.kandpal@intel.com>; igt-dev@lists.freedesktop.org=
 <igt-dev@lists.freedesktop.org>
Cc: Samala, Pranay <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulati=
on in HDR mode


Hi Suraj,

Agreed, we do have similar functionality in kms_brightness, but it requires=
 some adjustments .
I plan to move these functions =93backlight_read=94 , =93backlight_write=94=
 to lib/igt_sysfs and make the necessary modifications at a later stage.



Please provide your thoughts on this approach.

_____________


Why not just some simple code sharing via a header file rather than the who=
le lib/igt_sysfs complexity.


Regards,
Suraj
____________
Regards,
Santhosh



From: Kandpal, Suraj <suraj.kandpal@intel.com>
Sent: Friday, October 4, 2024 10:50 AM
To: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; igt-dev@lis=
ts.freedesktop.org
Cc: Samala, Pranay <pranay.samala@intel.com>; Reddy Guddati, Santhosh <sant=
hosh.reddy.guddati@intel.com>
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulati=
on in HDR mode



From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com<mailto:sant=
hosh.reddy.guddati@intel.com>>

Sent: Wednesday, October 2, 2024 8:26:33 pm
To: igt-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org> <ig=
t-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org>>
Cc: Samala, Pranay <pranay.samala@intel.com<mailto:pranay.samala@intel.com>=
>; Kandpal, Suraj <suraj.kandpal@intel.com<mailto:suraj.kandpal@intel.com>>=
; Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com<mailto:santhosh=
.reddy.guddati@intel.com>>
Subject: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation i=
n HDR mode



Add subtest for backlight control on hdr enabled edp panels
by changing brightness via sysfs.

v2: adjust brightness range, refactor and restore brightness (Pranay)

v3: reuse functions, add flags to avoid duplicate code (Suraj)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com<mai=
lto:santhosh.reddy.guddati@intel.com>>
---
 tests/kms_hdr.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index f123c6b36..0f07e770b 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -64,6 +64,10 @@
  * Description: Tests static toggle with suspend
  * Functionality: colorspace, static_hdr, suspend
  *
+ * SUBTEST: brightness-with-hdr
+ * Description: Tests brightness with HDR
+ * Functionality: colorspace, static_hdr
+ *
  * SUBTEST: static-%s
  * Description: Tests %arg[1].
  * Functionality: colorspace, static_hdr
@@ -81,6 +85,8 @@ IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bp=
c switch");
 #define HDR_STATIC_METADATA_BLOCK       0x06
 #define USE_EXTENDED_TAG                0x07

+#define INTEL_BACKLIGHT_PATH "/sys/class/backlight/intel_backlight"
+
 /* DRM HDR definitions. Not in the UAPI header, unfortunately. */
 enum hdmi_metadata_type {
         HDMI_STATIC_METADATA_TYPE1 =3D 0,
@@ -100,6 +106,7 @@ enum {
         TEST_SWAP =3D 1 << 3,
         TEST_INVALID_METADATA_SIZES =3D 1 << 4,
         TEST_INVALID_HDR =3D 1 << 5,
+       TEST_BRIGHTNESS =3D 1 << 6,
 };

 /* BPC connector state. */
@@ -448,6 +455,72 @@ static void fill_hdr_output_metadata_st2048(struct hdr=
_output_metadata *meta)
         meta->hdmi_metadata_type1.max_cll =3D 500;   /* 500 nits */
 }

+/* TODO: Move adjust_brightness to lib/igt_sysfs to reuse in other tests. =
*/
+static void adjust_brightness(data_t *data, uint32_t flags)



-----------------

 Do we not have a function in kms_brightness to manipulate brightness let's=
 reuse that rather than writing the whole function here



Regards,

Suraj Kandpal



----------------------
+{
+       char brightness_path[1024];
+       int brightness_fd;
+       char brightness_value[64];
+       int current_brightness;
+       int max_brightness;
+       int read_brightness;
+       int fd, i;
+
+       /* Get max brightness */
+       snprintf(brightness_path, sizeof(brightness_path),
+                "%s/%s", INTEL_BACKLIGHT_PATH, "max_brightness");
+       fd =3D open(brightness_path, O_RDONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       igt_assert(read(fd, brightness_value, sizeof(brightness_value)) > 0=
);
+
+       max_brightness =3D atoi(brightness_value);
+
+       close(fd);
+
+       /* Get current brightness */
+       snprintf(brightness_path, sizeof(brightness_path),
+                "%s/%s", INTEL_BACKLIGHT_PATH, "brightness");
+       fd =3D open(brightness_path, O_RDONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       igt_assert(read(fd, brightness_value, sizeof(brightness_value)) > 0=
);
+
+       current_brightness =3D atoi(brightness_value);
+
+       close(fd);
+
+       for (i =3D 0; i <=3D max_brightness; i +=3D 50) {
+               fd =3D open(brightness_path, O_WRONLY);
+               igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_p=
ath);
+
+               snprintf(brightness_value, sizeof(brightness_value), "%d", =
i);
+               igt_assert(write(fd, brightness_value, strlen(brightness_va=
lue)) > 0);
+
+               close(fd);
+
+               /* Verify brightness adjustment */
+               fd =3D open(brightness_path, O_RDONLY);
+               igt_assert(fd >=3D 0);
+
+               igt_assert(read(fd, brightness_value, sizeof(brightness_val=
ue)) > 0);
+
+               read_brightness =3D atoi(brightness_value);
+
+               igt_assert_eq(read_brightness, i);
+
+               close(fd);
+       }
+
+       fd =3D open(brightness_path, O_WRONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       snprintf(brightness_value, sizeof(brightness_value), "%d", current_=
brightness);
+       igt_assert(write(brightness_fd, brightness_value, strlen(brightness=
_value)) > 0);
+
+       close(fd);
+}
+
 static void test_static_toggle(data_t *data, enum pipe pipe,
                                igt_output_t *output,
                                uint32_t flags)
@@ -483,6 +556,9 @@ static void test_static_toggle(data_t *data, enum pipe =
pipe,
                 igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"Unknown=
 EOTF [0-9]+\""), 0);
                 goto cleanup;
         }
+       if (flags & TEST_BRIGHTNESS)
+               adjust_brightness(data, flags);
+
         igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);

         /* Verify that the CRC are equal after DPMS or suspend. */
@@ -685,7 +761,8 @@ static void test_hdr(data_t *data, uint32_t flags)

                         igt_dynamic_f("pipe-%s-%s",
                                       kmstest_pipe_name(pipe), output->nam=
e) {
-                               if (flags & (TEST_NONE | TEST_DPMS | TEST_S=
USPEND | TEST_INVALID_HDR))
+                               if (flags & (TEST_NONE | TEST_DPMS | TEST_S=
USPEND |
+                                            TEST_INVALID_HDR | TEST_BRIGHT=
NESS))
                                         test_static_toggle(data, pipe, out=
put, flags);
                                 if (flags & TEST_SWAP)
                                         test_static_swap(data, pipe, outpu=
t);
@@ -734,6 +811,10 @@ igt_main
         igt_subtest_with_dynamic("static-toggle-suspend")
                 test_hdr(&data, TEST_SUSPEND);

+       igt_describe("Tests brightness while entering and exiting HDR mode"=
);
+       igt_subtest_with_dynamic("brightness-with-hdr")
+               test_hdr(&data, TEST_BRIGHTNESS);
+
         igt_describe("Tests swapping static HDR metadata");
         igt_subtest_with_dynamic("static-swap")
                 test_hdr(&data, TEST_SWAP);
--
2.34.1




--_000_SN6PR11MB27047F18FC2823284053C086DB7F2SN6PR11MB2704namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
++ Bhanu<br>
<br>
Hi Suraj,<br>
<br>
Thank you for&nbsp;your suggestion regarding code sharing via header file. =
I have tried to share across the test files unfortunately in the current ig=
t&nbsp; setup, we cannot re use with importing the header files.<br>
<br>
<a href=3D"mailto:bhanuprakash.modem@intel.com" id=3D"OWAAM179493" class=3D=
"tWKOu mention ms-bgc-nlr ms-fcl-b">@Modem, Bhanuprakash</a>,<br>
<br>
Could you please help if these functions can be moved to lib/igt_sysfs or l=
ib/igt_kms ?<br>
<br>
Thanks,<br>
Santhosh</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Kandpal, Suraj &lt;su=
raj.kandpal@intel.com&gt;<br>
<b>Sent:</b> Friday, October 4, 2024 11:14 AM<br>
<b>To:</b> Reddy Guddati, Santhosh &lt;santhosh.reddy.guddati@intel.com&gt;=
; igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Samala, Pranay &lt;pranay.samala@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness man=
ipulation in HDR mode</font>
<div>&nbsp;</div>
</div>
<div>
<div><br>
</div>
<div id=3D"x_mail-editor-reference-message-container" dir=3D"auto"><br>
<hr style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" style=3D"font-size:11pt"><strong>From:</strong>=
 Reddy Guddati, Santhosh &lt;santhosh.reddy.guddati@intel.com&gt;<br>
<strong>Sent:</strong> Friday, October 4, 2024 11:02:42 am<br>
<strong>To:</strong> Kandpal, Suraj &lt;suraj.kandpal@intel.com&gt;; igt-de=
v@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&gt;<br>
<strong>Cc:</strong> Samala, Pranay &lt;pranay.samala@intel.com&gt;<br>
<strong>Subject:</strong> RE: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brig=
htness manipulation in HDR mode<br>
</div>
<br>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<div class=3D"x_WordSection1" dir=3D"auto">
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<span style=3D"">Hi Suraj,<br>
<br>
Agreed, we do have similar functionality in kms_brightness, but it requires=
 some adjustments .<br>
I plan to move these functions =93backlight_read=94 , =93backlight_write=94=
 to lib/igt_sysfs and make the necessary modifications at a later stage.</s=
pan></p>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<span style=3D"">&nbsp;</span></p>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<span style=3D"">Please provide your thoughts on this approach.</span></p>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<span style=3D"">_____________</span></p>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<span style=3D""><br>
</span></p>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<span style=3D"">Why not just some simple code sharing via a header file ra=
ther than the whole lib/igt_sysfs complexity.</span></p>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<span style=3D""><br>
</span></p>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<span style=3D"">Regards<span>,<br>
Suraj</span><br>
____________<br>
Regards,<br>
Santhosh</span></p>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<span style=3D"">&nbsp;</span></p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0c=
m 0cm 0cm">
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<b><span lang=3D"EN-US" style=3D"font-size:11.0pt; font-family:&quot;Calibr=
i&quot;,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"font-size=
:11.0pt; font-family:&quot;Calibri&quot;,sans-serif"> Kandpal, Suraj &lt;su=
raj.kandpal@intel.com&gt;
<br>
<b>Sent:</b> Friday, October 4, 2024 10:50 AM<br>
<b>To:</b> Reddy Guddati, Santhosh &lt;santhosh.reddy.guddati@intel.com&gt;=
; igt-dev@lists.freedesktop.org<br>
<b>Cc:</b> Samala, Pranay &lt;pranay.samala@intel.com&gt;; Reddy Guddati, S=
anthosh &lt;santhosh.reddy.guddati@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness man=
ipulation in HDR mode</span></p>
</div>
</div>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
&nbsp;</p>
<div>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<strong><span style=3D"font-size:11.0pt; font-family:&quot;Aptos&quot;,sans=
-serif">From:</span></strong><span style=3D"font-size:11.0pt"> Reddy Guddat=
i, Santhosh &lt;<a href=3D"mailto:santhosh.reddy.guddati@intel.com" style=
=3D"text-decoration:underline; color:rgb(70,120,134)">santhosh.reddy.guddat=
i@intel.com</a>&gt;</span></p>
</div>
<div id=3D"x_mail-editor-reference-message-container">
<div id=3D"x_divRplyFwdMsg">
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<strong><span style=3D"font-size:11.0pt; font-family:&quot;Aptos&quot;,sans=
-serif">Sent:</span></strong><span style=3D"font-size:11.0pt"> Wednesday, O=
ctober 2, 2024 8:26:33 pm<br>
<strong><span style=3D"font-family:&quot;Aptos&quot;,sans-serif">To:</span>=
</strong> <a href=3D"mailto:igt-dev@lists.freedesktop.org" style=3D"text-de=
coration:underline; color:rgb(70,120,134)">
igt-dev@lists.freedesktop.org</a> &lt;<a href=3D"mailto:igt-dev@lists.freed=
esktop.org" style=3D"text-decoration:underline; color:rgb(70,120,134)">igt-=
dev@lists.freedesktop.org</a>&gt;<br>
<strong><span style=3D"font-family:&quot;Aptos&quot;,sans-serif">Cc:</span>=
</strong> Samala, Pranay &lt;<a href=3D"mailto:pranay.samala@intel.com" sty=
le=3D"text-decoration:underline; color:rgb(70,120,134)">pranay.samala@intel=
.com</a>&gt;; Kandpal, Suraj &lt;<a href=3D"mailto:suraj.kandpal@intel.com"=
 style=3D"text-decoration:underline; color:rgb(70,120,134)">suraj.kandpal@i=
ntel.com</a>&gt;;
 Reddy Guddati, Santhosh &lt;<a href=3D"mailto:santhosh.reddy.guddati@intel=
.com" style=3D"text-decoration:underline; color:rgb(70,120,134)">santhosh.r=
eddy.guddati@intel.com</a>&gt;<br>
<strong><span style=3D"font-family:&quot;Aptos&quot;,sans-serif">Subject:</=
span></strong> [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipula=
tion in HDR mode</span></p>
</div>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<br>
<br>
<span style=3D"font-size:11.0pt"></span></p>
<div>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<span style=3D"font-size:11.0pt">Add subtest for backlight control on hdr e=
nabled edp panels<br>
by changing brightness via sysfs.<br>
<br>
v2: adjust brightness range, refactor and restore brightness (Pranay)<br>
<br>
v3: reuse functions, add flags to avoid duplicate code (Suraj)<br>
<br>
Signed-off-by: Santhosh Reddy Guddati &lt;<a href=3D"mailto:santhosh.reddy.=
guddati@intel.com" style=3D"text-decoration:underline; color:rgb(70,120,134=
)">santhosh.reddy.guddati@intel.com</a>&gt;<br>
---<br>
&nbsp;tests/kms_hdr.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++=
-<br>
&nbsp;1 file changed, 82 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c<br>
index f123c6b36..0f07e770b 100644<br>
--- a/tests/kms_hdr.c<br>
+++ b/tests/kms_hdr.c<br>
@@ -64,6 +64,10 @@<br>
&nbsp; * Description: Tests static toggle with suspend<br>
&nbsp; * Functionality: colorspace, static_hdr, suspend<br>
&nbsp; *<br>
+ * SUBTEST: brightness-with-hdr<br>
+ * Description: Tests brightness with HDR<br>
+ * Functionality: colorspace, static_hdr<br>
+ *<br>
&nbsp; * SUBTEST: static-%s<br>
&nbsp; * Description: Tests %arg[1].<br>
&nbsp; * Functionality: colorspace, static_hdr<br>
@@ -81,6 +85,8 @@ IGT_TEST_DESCRIPTION(&quot;Test HDR metadata interfaces a=
nd bpc switch&quot;);<br>
&nbsp;#define HDR_STATIC_METADATA_BLOCK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 0x06<br>
&nbsp;#define USE_EXTENDED_TAG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x07<br>
&nbsp;<br>
+#define INTEL_BACKLIGHT_PATH &quot;/sys/class/backlight/intel_backlight&qu=
ot;<br>
+<br>
&nbsp;/* DRM HDR definitions. Not in the UAPI header, unfortunately. */<br>
&nbsp;enum hdmi_metadata_type {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HDMI_STATIC_METADATA_TYPE1=
 =3D 0,<br>
@@ -100,6 +106,7 @@ enum {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_SWAP =3D 1 &lt;&lt; 3=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_INVALID_METADATA_SIZE=
S =3D 1 &lt;&lt; 4,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_INVALID_HDR =3D 1 &lt=
;&lt; 5,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_BRIGHTNESS =3D 1 &lt;&lt; 6,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;/* BPC connector state. */<br>
@@ -448,6 +455,72 @@ static void fill_hdr_output_metadata_st2048(struct hdr=
_output_metadata *meta)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-&gt;hdmi_metadata_typ=
e1.max_cll =3D 500;&nbsp;&nbsp; /* 500 nits */<br>
&nbsp;}<br>
&nbsp;<br>
+/* TODO: Move adjust_brightness to lib/igt_sysfs to reuse in other tests. =
*/<br>
+static void adjust_brightness(data_t *data, uint32_t flags)</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<span style=3D"font-size:11.0pt">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<span style=3D"font-size:11.0pt">-----------------</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<span style=3D"font-size:11.0pt">&nbsp;Do we not have a function in kms_bri=
ghtness to manipulate brightness let's reuse that rather than writing the w=
hole function here</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<span style=3D"font-size:11.0pt">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<span style=3D"font-size:11.0pt">Regards,</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<span style=3D"font-size:11.0pt">Suraj Kandpal</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
<span style=3D"font-size:11.0pt">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif; margin-bottom:12.0pt">
<span style=3D"font-size:11.0pt">----------------------<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char brightness_path[1024];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int brightness_fd;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char brightness_value[64];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int current_brightness;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int max_brightness;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int read_brightness;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd, i;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get max brightness */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brightness_path, sizeof(brig=
htness_path),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;%s/%s&quot;, INTEL_BACKLIGHT_PATH, &quot;max_brightn=
ess&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(brightness_path, O_RDONLY=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Fail=
ed to open %s\n&quot;, brightness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(read(fd, brightness_value,=
 sizeof(brightness_value)) &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_brightness =3D atoi(brightness_va=
lue);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get current brightness */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brightness_path, sizeof(brig=
htness_path),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;%s/%s&quot;, INTEL_BACKLIGHT_PATH, &quot;brightness&=
quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(brightness_path, O_RDONLY=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Fail=
ed to open %s\n&quot;, brightness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(read(fd, brightness_value,=
 sizeof(brightness_value)) &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_brightness =3D atoi(brightnes=
s_value);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt;=3D max_brightnes=
s; i +=3D 50) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fd =3D open(brightness_path, O_WRONLY);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Failed to open %s\n&quot;, brig=
htness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; snprintf(brightness_value, sizeof(brightness_value), &quot;%d&qu=
ot;, i);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert(write(fd, brightness_value, strlen(brightness_value))=
 &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; close(fd);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Verify brightness adjustment */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fd =3D open(brightness_path, O_RDONLY);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert(fd &gt;=3D 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert(read(fd, brightness_value, sizeof(brightness_value)) =
&gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; read_brightness =3D atoi(brightness_value);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert_eq(read_brightness, i);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; close(fd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(brightness_path, O_WRONLY=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Fail=
ed to open %s\n&quot;, brightness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brightness_value, sizeof(bri=
ghtness_value), &quot;%d&quot;, current_brightness);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(write(brightness_fd, brigh=
tness_value, strlen(brightness_value)) &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+}<br>
+<br>
&nbsp;static void test_static_toggle(data_t *data, enum pipe pipe,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t flags)<br>
@@ -483,6 +556,9 @@ static void test_static_toggle(data_t *data, enum pipe =
pipe,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_assert_eq(system(&quot;dmesg|tail -n 1000|grep -E=
 \&quot;Unknown EOTF [0-9]+\&quot;&quot;), 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto cleanup;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; TEST_BRIGHTNESS)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; adjust_brightness(data, flags);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_output_bpc_equa=
l(data-&gt;fd, pipe, output-&gt;name, 10);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Verify that the CRC are=
 equal after DPMS or suspend. */<br>
@@ -685,7 +761,8 @@ static void test_hdr(data_t *data, uint32_t flags)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_d=
ynamic_f(&quot;pipe-%s-%s&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kmstest_pipe_name(pipe), output-&gt;name) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; (TEST_NONE | TEST_DPMS | TE=
ST_SUSPEND | TEST_INVALID_HDR))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; (TEST_NONE | TEST_DPMS | TE=
ST_SUSPEND |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_INVALID_HDR | TEST_BRIGHTNESS))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; test_static_toggle(data, pipe, output, flags);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; TEST_SWAP)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; test_static_swap(data, pipe, output);<br>
@@ -734,6 +811,10 @@ igt_main<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&=
quot;static-toggle-suspend&quot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; test_hdr(&amp;data, TEST_SUSPEND);<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests brightness w=
hile entering and exiting HDR mode&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&quot;bright=
ness-with-hdr&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; test_hdr(&amp;data, TEST_BRIGHTNESS);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests s=
wapping static HDR metadata&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&=
quot;static-swap&quot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; test_hdr(&amp;data, TEST_SWAP);<br>
-- <br>
2.34.1</span></p>
</div>
<p class=3D"x_MsoNormal" style=3D"margin:0cm; font-size:12pt; font-family:A=
ptos,sans-serif">
&nbsp;</p>
</div>
</div>
<br>
</div>
</div>
</body>
</html>

--_000_SN6PR11MB27047F18FC2823284053C086DB7F2SN6PR11MB2704namp_--
