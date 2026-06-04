Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75CCCD6E4A
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 08:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A21D112738;
	Thu,  4 Jun 2026 08:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQoUkFAI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C462D112733
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2026 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780561579; x=1812097579;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MNKMaadps219awIGijcz+Huki00RYKfpuOcEwpcA9DA=;
 b=fQoUkFAIG6rG5fSVlhjMX3IsCKbBE7uDP7coHj5ctRPc6y5dk3Ov8R+o
 ab43QonYegluxjWEdh6LkkXt4d7wmV1kvzZuF04tpHmPuAAxSrqEeXVMN
 KgXz8alclWKrD7D9Yo6bOySb/zJqTEgTWg0B1YyxuE7j7keKxKP6qXEk2
 W0Qr/rVZKaOyWfxOwVuRCEFhqJX+HctRdVuhmZ3mxWajV9/Cdcq03UucN
 BVww8ewokTf86tCV/R0BEqZDCfFGcrqJnozBOLcx0lXCJkGna6DouOv28
 gURX5CKClW80AcnZVuUlXuibfbHFPDjefcDyp3Xex05ST+4foToVNU3YK w==;
X-CSE-ConnectionGUID: F05YMz/dSPu/DKRV3EW4eg==
X-CSE-MsgGUID: Foi1z6Z0TDa6KAUUSlOw5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="104045300"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="104045300"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 01:26:18 -0700
X-CSE-ConnectionGUID: NNhRLIReSP+uqL7OjB9JWQ==
X-CSE-MsgGUID: WJt4hUUCR229DOQ3A1m6FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="249402314"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 01:26:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 01:26:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 01:26:17 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 01:26:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ix9yGh4xwhSCVrdu9iYtzFUMP66ce8eyMwNR3N6+SmqepOcgJEaPpXIDsyO1VP9ZoD7jNZVbUVNiLBeRjJlrhJ8wj4XU//rtczOoS3p7WB3/JiCP1ZE/ykVfySi5LLAkUF/uUf8lvFU5j6e0gjEedjT/iOJvrnbnPNlXyoniOu7qf64Dhe8w9kmEORkmPzoLnGBt3uQI8KzAH3JMQwNAfcVyEptxSRX20r1ESoCdvRORCaPorc5jsELM4g09oIc9rilvNRMt4zFpNuu3YPg2FQWpU532nRVYAjcHaAZhEKNAT6hsFGmP2HRhrYmLqq+kDIhHcQzLGbqKYH5bumw4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSzEOYpX70zwdO8YCP7HrrGu3IC1TaUvWtYcF89QneI=;
 b=op+jlTkuCOvSafJ9v3KGaedPzLtlZEPvcKE9Zhb8GYHTjraEdCrIjB0S1JjqcM8/mgC/LaKGDw5umyxCHdOXfFW1HeqdwcODRBDMFPg4sLQLKK8lY9OztY1eqCOjZXdjjhjVWxDeqWMFoHA3NsO8zTOHPFc9E3fC9qq5CalX3uVcDgyUBCxVeJAyNLVNAYBnOwLsGybyLn5WLiEg1IE65KECX6VNzcs7KY5ztrnVlOHid5XX6Uol6v6RQ8IZc7dk1ZUTwATTS947dIk5ckihq8DDokZEEvDozBFJteq1ZjGt1WmSrYa4K2fjkNhB3n0QSFYNgn0ZCklppVCA2DXrWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ0PR11MB6815.namprd11.prod.outlook.com (2603:10b6:a03:484::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 08:26:13 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 08:26:12 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH v1 1/2] tests/intel/kms_pm_dc: Add DC5 DPMS suspend/resume
 validation test
Thread-Topic: [PATCH v1 1/2] tests/intel/kms_pm_dc: Add DC5 DPMS
 suspend/resume validation test
Thread-Index: AQHchJD0PmUvPVvJe06eRT8DEroE1LYu7Ksg
Date: Thu, 4 Jun 2026 08:26:12 +0000
Message-ID: <DM4PR11MB6312AF917153B5FB93531CE790102@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260113132639.13411-1-mohammed.thasleem@intel.com>
 <20260113132639.13411-2-mohammed.thasleem@intel.com>
In-Reply-To: <20260113132639.13411-2-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ0PR11MB6815:EE_
x-ms-office365-filtering-correlation-id: 0fe4ae44-c961-451b-d350-08dec212f030
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099006|4143699003|11063799006|22082099003|38070700021|6133799003|18002099003;
x-microsoft-antispam-message-info: lHBS44gMHhHS9T7VYRXfO7o6a5aeW2zhiLiAL6E9iyjZZAvG/NoWL0z9J2SwVUifpsevYZ5f4lZVowYzJpfrCLhmVOyA9IIufh/Mom5SRv5Qq+I7gnpaVa8zTGUooehG7BoOjxXQTplPMmdHpapAzV/GprT8I5BC2iaW6F9MXfqhL6N5JMPCa19BYti1Ns31BDhv+jy2FHeMoPmEKwP7kbVr1a9t2ccD3RIbXtAT6aRr9CMwhzXiKSuETDesEMaW+IGrrYTx5ymZCQyW5nrFAiMbBViGy4MkFQcOC1lTSSgW/tR82NYhXp2jzpTSxyZ4ERDI3WMXhygqdK+8wB/WoT/ITPRNBuKBqiJUynAbqdxeRKRqOsPJxQ4z5ybkNysWk7ULAmRrzh7K4IXn7w75Q78FLJTb2jBB8iECY2/eGXlE2nM4ctL95fc3GugIh0hdnOFIWpC1O6TIXIFy0m2uPWPI55oqDgbJPpPR5AROXe7m1zmsLNcoQDr3ont1mMj4Vs2OXZO+cgtnU4dNuLhSrcXkFzoC+IVvcaBpg5kkrc3hSPV2rCxJZzBMETafBjWTd3MTMJZIsHNGwM5hzGH1UmBMYpua+X9OsevjSUDHXSuelLr4kytBpBJe3TIca6eG/9QAiuywASt4B3JU91KhfF9m/CRsKcDdMypAgi4KHVnx7Dw1nq40BBi5tertcOvrUYJrPtQ1oQ6kypeXCk+XhuXDuVua4LTU863Yemkz4nbjcYPo2Bk+oUiDS1EY/kRU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099006)(4143699003)(11063799006)(22082099003)(38070700021)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hCcehgiknRr43mXeEjRLUU1WiphW4cftssffdoospvT27Xjsw0i0+6u5637Q?=
 =?us-ascii?Q?Aq3PyJJciFgvZM+/d9+6wrC7k8pGyfB1oDJ7D77tk0/y88pxO0UD1gHRNDJl?=
 =?us-ascii?Q?seObZpSZsCpyKR5R76tbiwrwDrXRJNQt2KI+eG5bcEFRlcy8A1AhQRaD5KWT?=
 =?us-ascii?Q?8BTrStBzr8wCPySVw39WD+gbgdjcpwc0cZZmRKeLp64LGweZyx8WI4Wbo7Ar?=
 =?us-ascii?Q?IUKjT1H4i7Oxorz7cWagodkoq/dcpih36YgKsaTc5RXjg0pkCJuqAlTyIOG/?=
 =?us-ascii?Q?tpHOT8a/jkrxyBiRUrqbgcUyXdaAqffLWREKgH2DK97/cujb4k6TQSIaFcT2?=
 =?us-ascii?Q?r14H4cWdLD9T726mvnntXpOHC07tK/VDYk27aM4sN559BWgm/qK8nUxDaTSz?=
 =?us-ascii?Q?fB7Fb/z5WYcG2XDHMvOXFQ2vw59szhXd8KnNSLIUYSauVVtty+HF7t/fHFJO?=
 =?us-ascii?Q?ilz8wCOTrjywDw3gXNxM4KSwg8e2rhG1v9Swy4lk8GUsmv1k3ZlpJo+NiRO8?=
 =?us-ascii?Q?1OHk/wiCJtGc9dxkPoMcU2UdfP2w0WnZcOsa/uXmR4ZIENsCjphaMfuiDLRd?=
 =?us-ascii?Q?de5qClfQloFQqXrj0RzcYly5zH8a897uLcf/9OFemeK3mmOdloidex9SOvEI?=
 =?us-ascii?Q?Y/D1NR3VgbobMQ78c/tm/iF7+BY/htLF0tPriaUZZpibo57k+T2qWEc//VGe?=
 =?us-ascii?Q?MYr31hsLqWcPcNJhNOVY7boueXqU9qJBxqygmVfEPbeyZW4NBavTBikAXbPp?=
 =?us-ascii?Q?mcsrqi3HeSuGMNQ8Z9aJY+/PgxE/M3La2sO7TKXmPwmIN6QSeTpvO8OmKtcH?=
 =?us-ascii?Q?tSHVPjluohzG5LHBwqlLWq0nGvFs3atweRMYkFZibvHqd5W7RouaTfiCuCe0?=
 =?us-ascii?Q?eE5KX4EnzxLg9kbwTtN3jrhW8Kj4U1kXdb32eE42p5hjUju/SPPFwE4VtmTm?=
 =?us-ascii?Q?Z7+dGfdSmudg0Fd6Qp4HA2E5ayu3FMhX/3UJLPrBpb1e5bQwfhcaEOOGv7JF?=
 =?us-ascii?Q?UCqnn/XE6UTomyAIrGt/RdEaE6c6qYSwreHRgcxTxocJmuzNI5V+kkNe7Ey5?=
 =?us-ascii?Q?Yi+HDy9h7bUD4DTqT6ZYqj/Oicp9goZIzx7U1LKXmSMNrM4ScjhURGaBQ9LS?=
 =?us-ascii?Q?EJZjv4JstdXvPUIhsJT4CY3LZj3QXY87sFj6RPlGwgZYatQEv4a+ggwV4tW1?=
 =?us-ascii?Q?+1G4Kfdl48cOTTrKoAog2m0AczXeEHBimQs2FcZYX0SqoBu2zsEKeb+CGkj/?=
 =?us-ascii?Q?iZHN05qlr5TV9L1mF/QQFBYo2iLEIT062W64h+ejI0M1mncI6wLR1NTf1kee?=
 =?us-ascii?Q?OlWmcH5VNLBslVXbXDw52UUhHFldkW1XxxPaz81mXcHZvkDZ9RYMaE3Q4QJ7?=
 =?us-ascii?Q?ZC2iVBSuwcY/BHP4bL0ZPexZW4/ZZ9YlqxiTuP01WusqMlx+6/kot9pVYVuL?=
 =?us-ascii?Q?4YzV76h8PbGIqwF++fU8ulcvBhCVHMD8KZfnrKdJHVjqtzzy52Xn0+JVYRsu?=
 =?us-ascii?Q?IVJyvjxCMapnNgC0LUwkkW+j8RAWIMjMoJTf+HP1QC4QEhJb9qMYsvqU33zZ?=
 =?us-ascii?Q?tCWnw3191h7tKzRUYGWfy7qJF+0U8cmwLs2dVo3t0/8pUTfJTcxHRsS6n9qz?=
 =?us-ascii?Q?Q7lT54vAhqgsPJBiQCad5Z1m6cyfgKfePb572EmSRGWAZduzSPRXPw5EqcTK?=
 =?us-ascii?Q?cvxxbZFGKSHJOG6VpqWC956muCmkEv2F8ig37aQTOx0D3wZt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Jqd5wMyO+ByysL/cH9TpxWHg4hkC2C0jOX1gazWabZvcsbKMnjQu6DSpLC0/lCgx9YhE1T69u/Me8DUkSXiUoJuN0esZQLuqCdlqoMa7aQwPUN2zDThbdK6i0v0NHNu3toQu6fIoQkmpXeAqUweodE4ZU8IplQH2C4t1AI+uTxaX4jHXwCA2PVPfjbJg6jRV2zApCZCqxtjUorjq3EpwmbBPzVMWBsUBC69nZbuhzVbJOpotYmi6U5PT++P60EyDu+QTglkeYibDf0M28fqKSA1zi/a6RftNBHqbxZF71KtN04Trqh6xFg6kIRR8kEO+v7F85dDaZ1SFxiL7NUHn0A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe4ae44-c961-451b-d350-08dec212f030
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 08:26:12.7794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: npQX5GanoHs3BvpLhY8itSoeIVpAg7i+JjII2PMDUUE0qVAr659YwI/lTGwVvdvpvySe2O0sAil0akHM49/rog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6815
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
> Mohammed Thasleem
> Sent: Tuesday, January 13, 2026 6:57 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH v1 1/2] tests/intel/kms_pm_dc: Add DC5 DPMS
> suspend/resume validation test
>=20
> Validate DC5 state entry before and after suspend/resume cycle using DPMS=
.
> Ensures DC5 functionality is preserved across system suspend/resume
> operations.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 5e59ba6e0..ba00fd96a 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -77,6 +77,9 @@
>   *
>   * SUBTEST: dc5-retention-flops
>   * Description: This test validates display engine entry to DC5 state wh=
ile PSR is
> active on Pipe B
> + *
> + * SUBTEST: dc5-dpms-suspend-resume
> + * Description: This test validate DC5 state entry before and after
> + suspend/resume cycle using DPMS
>   */
Imho we can change it to : * Description: This test validates DC5 state ent=
ry before and after a suspend/resume cycle using DPMS
>=20
>  /* DC State Flags */
> @@ -721,6 +724,14 @@ static void test_deep_pkgc_state(data_t *data)
>  	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");  }
>=20
> +static void test_dc5_dpms_suspend_resume(data_t *data, int dc_flag) {
> +	test_dc_state_dpms(data, dc_flag);
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> SUSPEND_TEST_NONE);
> +	test_dc_state_dpms(data, dc_flag);
> +
Extra blank line before closing brace
> +}
> +
>  static void kms_poll_state_restore(int sig)  {
>  	int sysfs_fd;
> @@ -841,6 +852,12 @@ int igt_main()
>  		test_dc9_dpms(&data);
>  	}
>=20
> +	igt_describe("This test validates display engine entry to DC5 state "
> +		      "entry before and after suspend/resume cycle using
> DPMS");
could align wording slightly with SUBTEST comment:
igt_describe("Validate DC5 state entry before and after a suspend/resume cy=
cle using DPMS");
> +	igt_subtest("dc5-dpms-suspend-resume")
> +		test_dc5_dpms_suspend_resume(&data, CHECK_DC5);
> +
> +
>  	igt_fixture() {
>  		free(data.debugfs_dump);
>  		close(data.debugfs_fd);
> --
> 2.25.1

