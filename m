Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325B1D116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 13:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94F810E3D8;
	Mon,  1 Dec 2025 13:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GH7yB7U+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF86510E3DB
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 13:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764595143; x=1796131143;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rJhzbUxDd95SaNEv3Ydyzz24t4EKCeXI8XeuZ9hGQ+k=;
 b=GH7yB7U+ekuJWfZyie+MpU+qJnHwfZnu/hxlD3kmLMkLMn9pfJ4QcNK3
 8X6KClnGbahJk8pDJ7aVXjZl7fKE6Ol46ZYYH62GRsgHQxgZz0rgM9lx9
 w0PbEguEGWS5qJPy/94z/4Q89AgknZuf1eoS7S5sJt2ZFqMj9y0W03P5R
 3+zfQlDHzZUhy7kO8fbHzBPE16D68/ldW31EoDny6j4QjXDjQ8IMCXrbL
 Tl855+O56cqc/nq7kdQQgyKVKrhQec3XkqG6EnbLKMkaza+O+DPyGY2VL
 /qPQib0yU79q/YEV/yKAS9F14ZzO6va+6AAmXbFlOO427sI5991t2rBwT A==;
X-CSE-ConnectionGUID: VrQDNS1mS7K5U4SaZhLOdQ==
X-CSE-MsgGUID: UNmVuUGaRwqIONsW1ByNfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="70393638"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="70393638"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:19:02 -0800
X-CSE-ConnectionGUID: VyUSvcTQSFiPQznaAXy8LQ==
X-CSE-MsgGUID: TSbkP3b8Q3yzOBxnO5p6vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="225054507"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:19:02 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:19:02 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 05:19:02 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:19:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LaZjF+H3xj/rYdXWR7i79aam8Q3A5NaU90hm1L/gwMcK9FCz5uuLiZViehoAY5WvIzL7d1uuZ3dXLd/Q4umNYuguC5x8DUPLahpoPGjqCN4+CbYNR6X0XGpCLUHG+jrDLTON8Lpshd09K0/PWIE+FjA34qLrVrwu/r2ZWaSx0byP8hBR4X53TxD1S3TtxIkEbq2pNgwW6uqYOWkvdghToZ/oJr9tfZTrjZ4KuNxlbHmy+Vz3mTZoROcmLpEA0E0hazaFLVTSlcvVPor/HFVv6N2o5b5e4j7Yfjjy/1Bk8LTTbJqnqnt3JUSDmMpaMb4WK/564tMpqSy/s+NTEJ0AQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyMzozdMiIbBWhnQhaMOVZxsOsCBOYOlZMPSwSBBnc0=;
 b=CzxUY5e7nHYvpipQIx1kgyTIempVTc/1EA98Z6YBQz1u01KyjSKJ9bZT10vtcnHz4BhIRMuFBcfSpBpWgVwsn5QLwg7zspXW1qZHorNn5QFR9ioExIMCkvTMzylQM53OKdqtOWo+stNVmlLg42UqV7miWqWKzSR2O33ikpBCNYp3n1ZGEP7hwDyFkp7X+ifScfm/1BHWSNtzKGhYStjj+Xx4LmeHaN0+J6LRRFedwkeO9tofN22/+NqVwBP0Fd1v8hALazgIqVnHo8FioFmeURPO9DEltcVKmq7HKNpY0ipiKN/is3JDyqRJQDlRlrhXP3f7nuWk1dnN6aPuY3AKMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH7PR11MB7964.namprd11.prod.outlook.com (2603:10b6:510:247::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Mon, 1 Dec
 2025 13:18:59 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:18:58 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v9 09/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU conflicting madvise test
Thread-Topic: [PATCH i-g-t v9 09/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU conflicting madvise test
Thread-Index: AQHcYqFyXlP/jTM51UqoUhvwywC0MbUMxMcw
Date: Mon, 1 Dec 2025 13:18:58 +0000
Message-ID: <BL1PR11MB5525C344F0FBCE84369D994E84DBA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20251201090349.326673-1-nishit.sharma@intel.com>
 <20251201090349.326673-10-nishit.sharma@intel.com>
In-Reply-To: <20251201090349.326673-10-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH7PR11MB7964:EE_
x-ms-office365-filtering-correlation-id: 6d85aae7-6a2e-4c72-d5b3-08de30dc2fcb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?tj3Nascn8OrfQWo9kFtGLYGCCke+TdRG7uyz2H1i3esixdIF3venxvOelQET?=
 =?us-ascii?Q?DEGcCPtFyA0/hw2eItNs9YacYc/3fuBGwvC8NmpQO5Y/ChoZrQVexfCHAOmM?=
 =?us-ascii?Q?mfFRdJn3lteXiWw+YYMM5oSUbJlMwQsaQBWzBl0rvqe1SWQINKwY+5NiXIeJ?=
 =?us-ascii?Q?Ia7UGejpl9h3s7JoXhTJWT5ws7cX/adOh6ZOnrVsFGKz9UrQUWQ43BSd/+nl?=
 =?us-ascii?Q?E26J1BdQO34yz26Bg3gkv2rzWA7o5Qa2AUfvDq4ZKg7w3mOhGr6hYu7WANpC?=
 =?us-ascii?Q?NkpKH9/sDAAqBCzUVG/Wgd76nlASOIhGNv4Te9c2QEpP3MHC0lO9hpfNH+Bm?=
 =?us-ascii?Q?C92E/qqtL+yDZdoXx/UIcZxFvmhQwV4RtEftOgsrHd1X3iKBf9NFDNlTDkuf?=
 =?us-ascii?Q?rMv7aTckMP0HI1GNdSaI0B1B6mmp4TK6tRoOy3uiH9SYwYX96Ph9EfYIcHRg?=
 =?us-ascii?Q?jinf3PQ8yY9noheux2gRqvdJzpe4L8VpGlOYe5gXm6CbLLt++OcF2FoxNg3j?=
 =?us-ascii?Q?L0KluacA3ytkpgQPVksmIoGk/r6MEEBSchNLPollDvTh2XliAA1vmeHRhqht?=
 =?us-ascii?Q?jXgpSRHZqGxdliqqOp7/GmdcX/bcGHIahv1WSk5joVrnTNIb8A/2Cf++cUS3?=
 =?us-ascii?Q?2MqzcS77YoNDRW/W2mZL23cHFPF6rGcYNBJ3PizgieeEcN/91R2ywBoJSER0?=
 =?us-ascii?Q?awYrBOCRqfvqLBqWM7TnCUtbRg8W7XLyGCP6pUhlf8TYcpwFJAIWA23SZXRd?=
 =?us-ascii?Q?0YyZJ9ES+9A2LOgUB9+LbXSz8DhqrUiG6gMEHuB/4cWuLYxMBcMSuUMiCIyY?=
 =?us-ascii?Q?IKNIjhi5E/S6acFSfvssRA5GLGfuAkH9/JmcLjyvfNMyKT0vhp89GS4Wyy56?=
 =?us-ascii?Q?hgeGCyNKYnbb6ipkTSwJBKZeQjal4HYYphpittLU8/3PLlC9X1Z56AblyYqB?=
 =?us-ascii?Q?BjGD2P85C6Mrw33a5fJKPH097PmKkEp04wi6TbngpT+CCA5nUnhLTM7khp8U?=
 =?us-ascii?Q?tYI19PaUveGFqAKUNdyy7dDw1fyMojCewUDfubVCmx6iMLQk8VALTVwT/ztR?=
 =?us-ascii?Q?cUIp40HyynjX3swF1oLfyk08RNhYh/eEP0jOtI+RUUOlNwKrm4ExQ9CqAMyx?=
 =?us-ascii?Q?qLUpjqCwwMEAlvIpQ5Adha7X2yicvTmJ3RapkJLH++lFEvb5tCKw4gb/WoW6?=
 =?us-ascii?Q?LNLxJOu8LBg8DRqXwtXmxmJ4f1QAeLkUhKNCEXEOhmfimVhAfa09JVVQzxD9?=
 =?us-ascii?Q?WKM4TOyqQcqVcrkdYKfrSUO88fmPnUgmJEgqJWwde/var2O2aAq983oNUBcD?=
 =?us-ascii?Q?zGihw6akx/m9LpSH3mRjmhEMw+Alq8vDm5SLfhAOM1P8Ig90hFAaUa7pDxAO?=
 =?us-ascii?Q?9whTN0kUnYojqFTFI+kDl8QqrBzKO0USBVTc1lF/R77pqjFOCW2+HzdJAtqs?=
 =?us-ascii?Q?Sr4NQDZKRowt9wJN57jfjXmpjwV5KbnUZgduiXLn3+0zJLUdgl64+EcKFdXs?=
 =?us-ascii?Q?zFzIR6VAq7pqnpqpUgCdjxm6D0Frrum5gapg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qy9zMPPbb69aS4xa0Rp1O/lpAUYNL3LBAz6jCUMbfJdr5mZUWnaHNTwGiRwr?=
 =?us-ascii?Q?VrbAXwAFlzwoFVdqB1bai/eDRTjLqZjc/kt0aaSOSLpeSY1dGxDcfftMIE1R?=
 =?us-ascii?Q?hUa5AwiSU2mho/Tf/AbE4NVwlUbqTURTsJV2FupnKbh6WXHlhh0ivFI0fBGK?=
 =?us-ascii?Q?M16hzwTBU1rMO3wUzD2051FzznzWPpn/vF8hjVa7i89iQH5Erom04a35uME6?=
 =?us-ascii?Q?EfWKVYkj6Wb/vb4N4S/hsEKDdukLioHq4aC2Dqyg6iI6ct1D9mTv7TReLL/y?=
 =?us-ascii?Q?QuBLhHqvKNGc1AVVmitXRtP1ZUNT7fqh5uCaJgaUZhAVg6fiYiGZGFiWWHvK?=
 =?us-ascii?Q?0inD1amdHjg5Lu07S50/1E03JOd4oD7sBANamBEIP2XCVFC+XXqionPjJQqT?=
 =?us-ascii?Q?wc1nG3KGECEjAte3feauX2Nr5qvRqcOBNovC0ybraNZsmt1QmLetkmbBWsaX?=
 =?us-ascii?Q?fFVP/TgEdpEpk/o9mJsmbMXbOUaqz0CQOzstVEkORJ4RKvtn45/jFDstZAO3?=
 =?us-ascii?Q?4enCqJxpOp86SFqLn15XmcX1TqUEO3DB6+XLe7izpgLsAGtvxZ504Ze5ssCf?=
 =?us-ascii?Q?KMyoCs6V9OSDNHHrOcmItbVeCQJkpiwjySnNJTWMkmpguyVlzHBAlK+1qVD+?=
 =?us-ascii?Q?cCVnHNnNx1s1mzXMkPWNLGxHfez1n4KiEMb3Iq7xggfFTqsnKFYaXBVMkqHO?=
 =?us-ascii?Q?WeJbNQzxQH7JeQEXZQVknIXFjnWH0RlAxg6BZXTTwHE1Wv80QeNP6yjBQaDw?=
 =?us-ascii?Q?YIpjJ+lgL5pFGFNHzOkoM4cH1xAwbp/qXxwWdQlJCSpNrEp5QqNmqAZAKhk+?=
 =?us-ascii?Q?jQHiJJG5Wc3MAZTVjOmrOrpJzkoVGSrC5cZKENUklQ+AbXiVB/QsVlfclnr+?=
 =?us-ascii?Q?bodAJRK8e3GPqfXnvggDqkg6aRLpLVWOTiBUh2eTE+PuvudFTHWBLzyazoiT?=
 =?us-ascii?Q?+9+7Zk7JG7qhF5ThGij1Tj7HhNYmcBLHGDvIRg9qU5IzVJD5CLuTwsFXD9BI?=
 =?us-ascii?Q?eEPwtLrXBNQlpiYz4qElYlvXoTktrOfPGhkqNE0l4wYL4RRAUedn2P4sP8s7?=
 =?us-ascii?Q?1J3d5Sh5Fejo9sLw0rMEmn2by+21TNQw8J7wDQMv1VH2vrBSGzOsi7QcR2wF?=
 =?us-ascii?Q?xlNYHBeyvESdy+YhS64uCo8/Rhs8z3eT3nHsUaRbBzde/rZ+s9cKSwrZwtq9?=
 =?us-ascii?Q?4Wh3oDBKJfOvri2k+6UjMTg36SJ5QJBqWUuqnssz/nkny268dt1Fc5CKwa7R?=
 =?us-ascii?Q?vvBqQEpjCYjUWKYaSAyqJagr9HXcS38bzQS63Kybg7x6FpQth7E4Ae9tGQPb?=
 =?us-ascii?Q?JaSmKqLzibaPDPW2TwmME/k6Jh3dNDwRAKQYQOxilJ8OxIqxG0fcNOUy6tvS?=
 =?us-ascii?Q?8qlh4qV3bhxu31zDh69Z6HzWRthGEjI/P+iIV+w8HbuziAuuxVVsmGn4QN37?=
 =?us-ascii?Q?UB6waKnFELlXIPiqnSrm3xGCNu47/LNdVMM7wQfV4nWDLmNcLLgkwVW7lm4n?=
 =?us-ascii?Q?W509p73CkfFHWUmb0eJjsYuBhv6+Ku1sK2P9k9Ru24kUyTJACdZvc+vindZ0?=
 =?us-ascii?Q?D4eQFyTM6UhR3a6xJ0Ryp+0daTQbROydY6DOEFFa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d85aae7-6a2e-4c72-d5b3-08de30dc2fcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 13:18:58.5892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GxxzHuYBJJyrGZ2XhBMiarKA/R+2Asj4WNlrxv0i/ZiljGaGpFffIhyHCF9p0OtV4keFeQsO61RtfxilbsSseVaGU0SlCrz95U0ENaIzhrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7964
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
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Monday, December 1, 2025 2:34 PM
> To: igt-dev@lists.freedesktop.org; Sharma, Nishit
> <nishit.sharma@intel.com>; Gurram, Pravalika
> <pravalika.gurram@intel.com>
> Subject: [PATCH i-g-t v9 09/10] tests/intel/xe_multi_gpusvm: Add SVM
> multi-GPU conflicting madvise test
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> This test calls madvise operations on GPU0 with the preferred location se=
t to
> GPU1 and vice versa. It reports conflicts when conflicting memory advice =
is
> given for shared SVM buffers in a multi-GPU environment.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_multi_gpusvm.c | 143
> ++++++++++++++++++++++++++++++++++
>  1 file changed, 143 insertions(+)
>=20
> diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.=
c
> index bdbaa7a16..688ee0757 100644
> --- a/tests/intel/xe_multi_gpusvm.c
> +++ b/tests/intel/xe_multi_gpusvm.c
> @@ -110,6 +110,23 @@
>   *	Test concurrent atomic memory operations with prefetch where
>   *	multiple GPUs simultaneously access shared memory to validate
>   *	coherency with memory migration and local VRAM access
> + *
> + * SUBTEST: mgpu-atomic-op-conflict
> + * Description:
> + *	Multi-GPU atomic operation with conflicting madvise regions
> + *
> + * SUBTEST: mgpu-coherency-conflict
> + * Description:
> + *	Multi-GPU coherency test with conflicting madvise regions
> + *
> + * SUBTEST: mgpu-concurrent-access-conflict
> + * Description:
> + *	Multi-GPU concurrent access with conflicting madvise regions
> + *
> + * SUBTEST: mgpu-pagefault-conflict
> + * Description:
> + *	Multi-GPU page fault test with conflicting madvise regions
> + *
>   */
>=20
>  #define MAX_XE_REGIONS	8
> @@ -123,6 +140,9 @@
>  #define BATCH_VALUE	60
>  #define NUM_ITER	200
>=20
> +#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
> +#define FIVE_SEC                (5LL * NSEC_PER_SEC)
> +
>  #define MULTIGPU_PREFETCH		BIT(1)
>  #define MULTIGPU_XGPU_ACCESS		BIT(2)
>  #define MULTIGPU_ATOMIC_OP		BIT(3)
> @@ -132,6 +152,7 @@
>  #define MULTIGPU_PERF_REM_COPY		BIT(7)
>  #define MULTIGPU_PFAULT_OP		BIT(8)
>  #define MULTIGPU_CONC_ACCESS		BIT(9)
> +#define MULTIGPU_CONFLICT		BIT(10)
>=20
>  #define INIT	2
>  #define STORE	3
> @@ -199,6 +220,12 @@ static void gpu_simult_test_wrapper(struct
> xe_svm_gpu_info *src,
>  				    struct drm_xe_engine_class_instance *eci,
>  				    unsigned int flags);
>=20
> +static void
> +conflicting_madvise(struct xe_svm_gpu_info *gpu1,
> +		    struct xe_svm_gpu_info *gpu2,
> +		    struct drm_xe_engine_class_instance *eci,
> +		    unsigned int flags);
> +
>  static void
>  create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct
> drm_xe_engine_class_instance *eci,
>  		    uint32_t *vm, uint32_t *exec_queue) @@ -616,6 +643,11
> @@ atomic_inc_op(struct xe_svm_gpu_info *gpu1,
>  	if (mgpu_check_fault_support(gpu1, gpu2))
>  		return;
>=20
> +	if (flags & MULTIGPU_CONFLICT) {
> +		conflicting_madvise(gpu1, gpu2, eci, flags);
> +		return;
> +	}
> +
>  	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
>  	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
>=20
> @@ -697,6 +729,11 @@ coherency_test_multigpu(struct xe_svm_gpu_info
> *gpu1,
>  	if (mgpu_check_fault_support(gpu1, gpu2))
>  		return;
>=20
> +	if (flags & MULTIGPU_CONFLICT) {
> +		conflicting_madvise(gpu1, gpu2, eci, flags);
> +		return;
> +	}
> +
>  	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
>  	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
>=20
> @@ -985,6 +1022,11 @@ pagefault_test_multigpu(struct xe_svm_gpu_info
> *gpu1,
>  	if (mgpu_check_fault_support(gpu1, gpu2))
>  		return;
>=20
> +	if (flags & MULTIGPU_CONFLICT) {
> +		conflicting_madvise(gpu1, gpu2, eci, flags);
> +		return;
> +	}
> +
>  	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
>  	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
>=20
> @@ -1101,6 +1143,11 @@ multigpu_access_test(struct xe_svm_gpu_info
> *gpu1,
>  	if (mgpu_check_fault_support(gpu1, gpu2))
>  		return;
>=20
> +	if (flags & MULTIGPU_CONFLICT) {
> +		conflicting_madvise(gpu1, gpu2, eci, flags);
> +		return;
> +	}
> +
>  	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
>  	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
>=20
> @@ -1235,6 +1282,98 @@ multigpu_access_test(struct xe_svm_gpu_info
> *gpu1,
>  	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);  }
>=20
> +static void
> +conflicting_madvise(struct xe_svm_gpu_info *gpu1,
> +		    struct xe_svm_gpu_info *gpu2,
> +		    struct drm_xe_engine_class_instance *eci,
> +		    unsigned int flags)
> +{
> +	uint64_t addr;
> +	uint32_t vm[2];
> +	uint32_t exec_queue[2];
> +	uint32_t batch_bo[2];
> +	void *data;
> +	uint64_t batch_addr[2];
> +	struct drm_xe_sync sync[2] =3D {};
> +	uint64_t *sync_addr[2];
> +
> +	/* Skip if either GPU doesn't support faults */
> +	if (!gpu1->supports_faults || !gpu2->supports_faults) {
> +		igt_debug("Both GPUs must support page faults for this
> test\n");
> +		return;
> +	}
> +
> +	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
> +	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
> +
> +	data =3D aligned_alloc(SZ_2M, SZ_4K);
> +	igt_assert(data);
> +	addr =3D to_user_pointer(data);
> +
> +	store_dword_batch_init(gpu1->fd, vm[0], addr, &batch_bo[0],
> &batch_addr[0], 10);
> +	store_dword_batch_init(gpu2->fd, vm[1], addr, &batch_bo[1],
> +&batch_addr[1], 20);
> +
> +	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K,
> +			    0, DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0, 0,
> exec_queue[0]);
> +
> +	igt_info("Testing GPU1 VM trying to prefer GPU2's VRAM (should
> +fail)\n");
> +
> +	/* This SHOULD fail - GPU1's VM cannot prefer GPU2's VRAM */
> +	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K,
> +			    0, DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			    gpu2->fd, 0, gpu2->vram_regions[0],
> exec_queue[0]);
> +
> +	/* This SHOULD also fail - GPU2's VM cannot prefer GPU1's VRAM */
> +	xe_multigpu_madvise(gpu2->fd, vm[1], addr, SZ_4K,
> +			    0, DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			    gpu1->fd, 0, gpu1->vram_regions[0],
> exec_queue[0]);
> +
> +	setup_sync(&sync[0], &sync_addr[0], BIND_SYNC_VAL);
> +	setup_sync(&sync[1], &sync_addr[1], BIND_SYNC_VAL);
> +
> +	/* For simultaneous access need to call xe_wait_ufence for both
> gpus after prefetch */
> +	xe_multigpu_prefetch(gpu1->fd, vm[0], addr, SZ_4K, &sync[0],
> +			     sync_addr[0], exec_queue[0], flags);
> +	free(sync_addr[0]);
> +
> +	xe_multigpu_prefetch(gpu2->fd, vm[1], addr, SZ_4K, &sync[1],
> +			     sync_addr[1], exec_queue[1], flags);
> +	free(sync_addr[1]);
> +
> +	for (int i =3D 0; i < NUM_ITER; i++) {
> +		sync_addr[0] =3D (void *)((char *)batch_addr[0] + SZ_4K);
> +		sync[0].addr =3D to_user_pointer((uint64_t *)sync_addr[0]);
> +		sync[0].timeline_value =3D EXEC_SYNC_VAL;
> +
> +		sync_addr[1] =3D (void *)((char *)batch_addr[1] + SZ_4K);
> +		sync[1].addr =3D to_user_pointer((uint64_t *)sync_addr[1]);
> +		sync[1].timeline_value =3D EXEC_SYNC_VAL;
> +		WRITE_ONCE(*sync_addr[0], 0);
> +		WRITE_ONCE(*sync_addr[1], 0);
> +
> +		xe_exec_sync(gpu1->fd, exec_queue[0], batch_addr[0],
> &sync[0], 1);
> +		if (READ_ONCE(*sync_addr[0]) !=3D EXEC_SYNC_VAL)
> +			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr[0],
> EXEC_SYNC_VAL,
> +				       exec_queue[0], NSEC_PER_SEC * 10);
> +		xe_exec_sync(gpu2->fd, exec_queue[1], batch_addr[1],
> &sync[1], 1);
> +		if (READ_ONCE(*sync_addr[1]) !=3D EXEC_SYNC_VAL)
> +			xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr[1],
> EXEC_SYNC_VAL,
> +				       exec_queue[1], NSEC_PER_SEC * 10);
> +	}
> +
> +	igt_assert_eq(READ_ONCE(*(uint64_t *)addr), 20);
> +
> +	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
> +	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
> +	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
> +	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
> +	free(data);
> +
> +	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
> +	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]); }
> +
>  static void
>  gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
>  		       struct xe_svm_gpu_info *dst,
> @@ -1346,9 +1485,11 @@ igt_main
>  		{ "xgpu-access-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_XGPU_ACCESS },
>  		{ "atomic-op-basic", MULTIGPU_ATOMIC_OP },
>  		{ "atomic-op-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_ATOMIC_OP },
> +		{ "atomic-op-conflict", MULTIGPU_CONFLICT |
> MULTIGPU_ATOMIC_OP },
>  		{ "coherency-basic", MULTIGPU_COH_OP },
>  		{ "coherency-fail-basic", MULTIGPU_COH_OP |
> MULTIGPU_COH_FAIL },
>  		{ "coherency-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_COH_OP },
> +		{ "coherency-conflict", MULTIGPU_CONFLICT |
> MULTIGPU_COH_OP },
>  		{ "coherency-fail-prefetch",
>  		  MULTIGPU_PREFETCH | MULTIGPU_COH_OP |
> MULTIGPU_COH_FAIL},
>  		{ "latency-basic", MULTIGPU_PERF_OP }, @@ -1359,8
> +1500,10 @@ igt_main
>  		  MULTIGPU_PREFETCH | MULTIGPU_PERF_OP |
> MULTIGPU_PERF_REM_COPY },
>  		{ "pagefault-basic", MULTIGPU_PFAULT_OP },
>  		{ "pagefault-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_PFAULT_OP },
> +		{ "pagefault-conflict", MULTIGPU_CONFLICT |
> MULTIGPU_PFAULT_OP },
>  		{ "concurrent-access-basic", MULTIGPU_CONC_ACCESS },
>  		{ "concurrent-access-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_CONC_ACCESS },
> +		{ "concurrent-access-conflict", MULTIGPU_CONFLICT |
> +MULTIGPU_CONC_ACCESS },
>  		{ NULL },
>  	};
>=20
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
> --
> 2.48.1

