Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76E8C47258
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 13:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4440B10E7DA;
	Tue, 23 Jan 2024 13:29:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029C110E7DA
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706016539; x=1737552539;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gKa1GUajNrcdTKcOdli99lSbqzHu1wxirG3pc7tu+Ck=;
 b=iRi/Y4stJrjTUTMN7crduIp7cbu0WoJTif9HNxMhCsuLyDW7ME81HnEY
 MU6Jv8yRkFn05YSTWFS26sSQw7B091zb7oHeqThxt8k8M5U9FQ9e9EHP6
 OnKPAqyHH0GU+Op9WETXHRjD219t5ggteLqOkMYum01QZ2mHiXeVdERCp
 L+JQAsm7bTB7+Osp33uKN1eL1Oan/vSpBk/E7vLLGoMm2jwSJCNAaBVzN
 B6nFQvuyvzlEfMl48ykhA+aQ4LSVvDPr/nCg8jrrN26Iyv+YhsDmUdMPQ
 Ln+NF9LBAb6KAzI56hlQflaG+8cTarwkcDheRnuYghX/i2j5gl5dFATAz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="391944095"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="391944095"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 05:28:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="34414761"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 05:28:59 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 05:28:58 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 05:28:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 05:28:57 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 05:28:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHo4ZpPhQgODazffH7jLD1hXahCvoJCjxqlDnJsvpjdY3uJL/KYcS9GkjI0DxaHZw2kVLlz3s+7OZdj74nCA8BMrzxVHT66FyJlCvNqM5e1PRvaMHVikanmtG6KARwweXvlkR/8I8OClIGpsFZ8mmcGTb9DxeEzYytvIQX8umEuecCeMOrSExVmRUlk8cPVGyt3sj6yM0QiFXd0zyAKLw96Gj4jdu3zQtKn2bUNze/JigWiMeaSjKtHIn4BsOCx3MmjrcVe4SXDb6klp9R0sB6OGJzTNeijBR/P3rKCShKeIWDpQER66rasAL3ZxEY8K8INCKVdPEDJC+R/CXrNGsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCfmRBfRAkEOXYK1AS180DaYppJu0E9lg8zK+A1QsrQ=;
 b=FxQC05uBcynyAu2WGTb6AaUyVCcYDvusxq/16cg5PqiHAGrMd1UcYUFEx8uoD/PM3m0ZwZbgwW+hR+sPa2WDGljuUXRL/0rONxO1HKrj3d+tpbAN+gQoeYnmwCgY9sAORWzdkwEaN5GQH0Ha07rKHOLOa82fth/vwF+heFhlR7tSt/HWMqBs8zeZDUlDX0+V7kmTE7Vm2qrNvgeS7wHdsFN/8a/rR1eEs/ffhhbIKKXXzsfcNayv64zx2soXgytQ9uG2nGZomRs7ORZWyj6TrNeDhqy5pwZX208QIwJAcLdjm8AIjkdFq58AWPLoqCe6gq7CtSZdpQQqsHKnaGUPtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SN7PR11MB7465.namprd11.prod.outlook.com (2603:10b6:806:34e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 13:28:50 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7202.034; Tue, 23 Jan 2024
 13:28:50 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t] intel-ci/fast-feedback.testlist: Remove system wide
 suspend testing
Thread-Topic: [i-g-t] intel-ci/fast-feedback.testlist: Remove system wide
 suspend testing
Thread-Index: AQHaTb9eZZy8ViDE9k+pPNExhZmUa7DnYrzA
Date: Tue, 23 Jan 2024 13:28:50 +0000
Message-ID: <CY5PR11MB6211D90334A2E63E28645EC795742@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240123060047.2844372-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20240123060047.2844372-1-sujaritha.sundaresan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SN7PR11MB7465:EE_
x-ms-office365-filtering-correlation-id: 5cd168f9-516d-40e3-2b6b-08dc1c173c7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PajXogDDQV8/EURGY/A+8/iBRKrOmnMdm37FbHgGCwgxgGbJLO3/CIhrDJ8WgY2lJbwjjbCTM64vCFexy4pL5CvdOA2qiQYqfRRqog7ggze5u38krFgRJpljdmic9Ihb8zuv2XSKszm9wSmp/Ju0lIKBZNo2ixVlV3oSivG3Z9jZeMlVR0o2JZlddBzZVftvgU6t3xpbLkFMvVd3hgogWDrVLLtjQPql/rGgK5lCddUY4jLGZ+P3h/+yp7ZpLCnFIoLvrGiB1eQP12tkzBlHCpez6whsM1VgoJS8nnX8w70U0G6UGjN/gIpU3WeYtJsVPZcweBZaJKJjtUqw7YFuW+3lje9tGwt4N0StsmbvyAUuHLgcFA04CTN61h8Uc1slbaDJ8fU4Xxm6y52nstoXaECKhv8WUgROPPAhw57hUUBseBM0txVRO1xlED/qnS9rYNfJe3eDubOZqCqy/0+QbKaewe2o9p3LE3buqSNnX9vcxoFHgPV1UhG+yb7yz+PG1UnngWtEoZjQlgCU/4RMi6C4/hEIQ+nf3nVmKtIsr54oZmMau+Lj8gLeUwIGFwf0y9EUVyt5VEEE74umWt8FzmMtr5LTmT/Zi5E13sRe0A/aF5BBPObbtcBL3Bh4/SQe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(55016003)(66446008)(5660300002)(66946007)(66476007)(64756008)(76116006)(107886003)(66556008)(110136005)(316002)(26005)(6506007)(7696005)(9686003)(53546011)(71200400001)(478600001)(52536014)(83380400001)(4326008)(2906002)(86362001)(122000001)(82960400001)(38100700002)(41300700001)(15650500001)(38070700009)(8936002)(8676002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HXQaGCo5l7oI8lTv2b7nroG/86K7AG7ciOOyCV3/Q9xSZ+Q0vp9YNCnpMy/K?=
 =?us-ascii?Q?DEhlvs8iQxFtUIIO0aStgMCOL77tTBZEkRTOlcQxWInGntWB1dUCRrcQ3O5d?=
 =?us-ascii?Q?2S0YXKMtaTDj9USxRXeD4B7xMet4x4dknz97cFBVf+msKRtRHw5klggcpAcD?=
 =?us-ascii?Q?eGKPZ9PlouWrRdhvJLN5pskLDUBNta4GVIK+OCUkyjr+YyRwPZbJZP8K0fNj?=
 =?us-ascii?Q?b50vmZWjWiqW/TtSPASdgwMkVP5WN5Riv2ZguwocoUrG2uJY8tASNDmoGiUR?=
 =?us-ascii?Q?WiOo4jcE5weV9r7pQekHcBHs9ydvsJG2dZQ1X6mvMtTyxBOD30IyHiSWo3DK?=
 =?us-ascii?Q?3jRli8+U3vuL9vU01MTMT2rpNtyPv2zOKh8AsJoJDqYygl3z5JPudp2JitQM?=
 =?us-ascii?Q?GA1HOE03u4rfgUDPX9c5yqFY74qogifTGfQjqE7bjhEeuJHR/GXw06ZqcTpL?=
 =?us-ascii?Q?Xugp1KxxRY+wzPPQ19HJBqdempAMaydWF16kqk+4JCuh57Mf7Jm3DrnLKYY2?=
 =?us-ascii?Q?MWkNGG3zbdHnAqDMZG+QiwhujCy6DVg4l5Fj4aGDsjh2TS7mJ85CMaCPpmwE?=
 =?us-ascii?Q?bl+iTbBFHglBJnIMaDdWI5kvWKaTcClkB8qtQpOoRE9esi6kz/ycBwj/rCyP?=
 =?us-ascii?Q?hNUgNLvGA22Eij6o9jA/eHuM34FDO7wXug8/H/QI/N3hIEF6HzST9xfWhoGI?=
 =?us-ascii?Q?QXKZvV8I07bWVq8pqypUnTTjSS1N6vBQXummesjv7aPKLZJ8QkO5UUgwvzS+?=
 =?us-ascii?Q?+yw/kSVRNnZCaWgkrRlSHw+KXQJNHuiepQVgZLlp/v3dwaUvYe2v3l9Bz2yl?=
 =?us-ascii?Q?z+dMr6CqC+TNeEJ+ciIbhT3Eol79NcSq4iuBMwzQBH6LsSdDp9bwhVEH2kIl?=
 =?us-ascii?Q?BHAEXLTRQ1DPlTQP/EHzjHLONZA6i+cWoE9AK8c9k4J3cLh8+e+XzXOfEme1?=
 =?us-ascii?Q?BjV5bLuVwPCmNOpo4IWg23ifCZOpqhs1kHp31KuQr0t39dsWYZmTVYhQ+LNe?=
 =?us-ascii?Q?d1VBAEVz8YeVrDmR33uuJRLj7YQh4RcahOlAVS4h62fKBkK92+3JmFpBxnzJ?=
 =?us-ascii?Q?zRuV36TYr22iweEmCqeC53OcE0mWPqIAoWfx7iI861IM/TeCG4FxZxrGvPy4?=
 =?us-ascii?Q?c2pGAPjKr0/ceWtENi18JkGgkRTTOexpVdSTCYLuk+OsVEpM8jQ2OndE8wgo?=
 =?us-ascii?Q?WcX9Oxf17y5+5n9uK1iLfAbb1PI1SbZZM1wnnXif+q+C4hst4dejSEf4GMEh?=
 =?us-ascii?Q?bQ2wpebY22enb/piuCiVi6QOR1UjipKkR4UjDNHftgPVHfIotpjcdj8Yo8HU?=
 =?us-ascii?Q?lKC35JQwLL1I/f4h21kvtLvsklkzqYU8KFh0TpVcXAMkt09ScsZGGheQ/Ool?=
 =?us-ascii?Q?o9kNDaRFqhnpVMrYksJeYyjsbzTvvK+4Yd84n5Pava4hZjZBqZZl9hQdbog1?=
 =?us-ascii?Q?H7pGoIcApPynXa1BrhQ++tfAz8v6/K1mUTnCcELkVSM7XAhaYwZvsKpNL87g?=
 =?us-ascii?Q?N6FZYlP3hzGMrlANltXNQM2LteYya6KRcLAT2cGhBT+5GVW0/vS9bo9j8o6A?=
 =?us-ascii?Q?T/pi9zyc035CuMqRcJjL/Y4qxpTENZkn6PTn6nSz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd168f9-516d-40e3-2b6b-08dc1c173c7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 13:28:50.4169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KkQ+KB8z89sYJWVqtPm8JM4iCh57C8ylESJIoGUtfX55PewLOPxKcrCoNv+3/Y7AX1dVG4qAUyslh/Rdc7THykIbw0aYx47A/Jg68mm7kJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7465
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
> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
> Sent: Tuesday, January 23, 2024 11:31 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; Sundaresan, Sujaritha
> <sujaritha.sundaresan@intel.com>
> Subject: [i-g-t] intel-ci/fast-feedback.testlist: Remove system wide susp=
end
> testing
>=20
> Remove system wide suspend/resume testing from fast feedback testlist.
> This will be in place until we have a proper logging to from CI to obtain=
 reliable
> test results for the same.
>=20
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Also pushed to origin/master.
Thanks,
Anshuman
> ---
>  tests/intel-ci/fast-feedback.testlist | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-
> feedback.testlist
> index 60ce1efa4..662e49cc3 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -168,10 +168,3 @@ igt@i915_pm_rpm@module-reload  # Kernel selftests
> igt@i915_selftest@live  igt@dmabuf@all-tests
> -
> -# System wide suspend tests
> -igt@i915_suspend@basic-s2idle-without-i915
> -igt@i915_suspend@basic-s3-without-i915
> -igt@gem_exec_suspend@basic-s0
> -igt@gem_exec_suspend@basic-s3
> -igt@kms_pipe_crc_basic@suspend-read-crc
> --
> 2.25.1

