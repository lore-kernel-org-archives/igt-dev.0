Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE85109317E
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 06:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEF010EA80;
	Fri, 20 Mar 2026 06:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LT6HPS7Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA5E10EA80
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 06:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773986401; x=1805522401;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6E5crKK6mCGwVlWtd3jQaQmAqwTA8XwD/DabB9ql7Xw=;
 b=LT6HPS7ZYwC3k1/N1e7Ybq1HmQeimvF1gxtyqQchS8OuoslJ6rVxxukR
 v3WqCiuZab//KOdoLZlG36qISWLTB4Wa4kd0ou+fLp/5jKtCR3dSpxfPa
 aQaZiSzGM/dvlSKqgDvuZNqEx58IvDXMLs2Sn4WxPSz8Jbb1lqH8Ntxro
 8IG6Xe19iNAJ8Wp1gw5KV7AeON2QIk+oOnnlFg0WlgJKO0IcX0Uzzkgs9
 1o6sXmq4awott40gngW8FfmL+/5T5IRFKFCtffBuJkLY9G4ki2KWDZSxQ
 JPTGUK1O+/OdYBOhz1XSLi9gZsPEoHQqa7rhk/M0ECGUqIeupHVUaQ6+F A==;
X-CSE-ConnectionGUID: 2PHi9bEpREefQRMkwko+1A==
X-CSE-MsgGUID: EHa4IkDnTK6erk62VNS4OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86544329"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="86544329"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 23:00:00 -0700
X-CSE-ConnectionGUID: XTiMYRmdRfapm7WXDdg/3w==
X-CSE-MsgGUID: reDdhAI1Q8qy/LHR4WCi4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227315708"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 23:00:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 23:00:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 23:00:00 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.30)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 22:59:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idvInONA805EIrTgv/BD+MxTJ55uXa57PN6F4I+e2jzmBCXHrPu+lfyCTZsb4I21bNrczuJMdRSKHVvakyqu4rNSb6Ncinxrf3ORkdX+bAyv+BZg26Htwth6XptAaT0YHVTHyzlAePIHXCiQx61mAiQadY+AKSszTABH3ffSXtn8aNke6NGaYFY6FB0nZHbr4V5IwkIXFdVoknKebx3zoyfB/6C0ErfAciV5Pds0ea0PIHeUK/TABrjU1W1n3so0vFursAc5fMCGBFmLGzE4pStzTicijzbjp3qEYngE95SvGrse6fjwBB50wH2KKa1xxujeO0t9JSWtGUXp8ugFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ru6BOqds65vFnHBbFeCbYefXbFG/bNB3BXbVJTr268=;
 b=n1g94P+u2yDLqy32wXDBjfW8/yJt/3lEVjQrxez6Uqpk5PODLXk2cndCOF1sRdkS/AW7jXaedmVeFZ3pQHiu+H8k/UxQLJPrvew2IQt0PkZiY4eq7Jiho7kTzm9JZv7MwM/QLFEJzm7WEW9FBQAcUhJjzAe0IX0E//BtIPSQ1NAed+pIr+ZNhXq5KlEoXs5DWiY4xkJfjRNQ5Z/UN1QGi13c6mbed80tjycMcGTPgLfr8veiSkUUGH6XPdD80vj/SkyYGaQ8t0VbbUr68jNNgoPuF0dSxUe9/NN3m2cO73iYLpz7K3FnbTTlrNzO74GMSYp9+V4QfOVxryl5W/SSgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS7PR11MB6176.namprd11.prod.outlook.com (2603:10b6:8:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.9; Fri, 20 Mar 2026 05:59:54 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 05:59:54 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_pat: Add negetive test to validate
 pat index
Thread-Topic: [PATCH i-g-t] tests/intel/xe_pat: Add negetive test to validate
 pat index
Thread-Index: AQHct2iYRQGTGtJZN0mbVwm0xqN3CbW27fsA
Date: Fri, 20 Mar 2026 05:59:54 +0000
Message-ID: <CH3PR11MB8434AD9C6F34138B73EBD9A88D4CA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260319062104.1582999-1-nakshtra.goyal@intel.com>
In-Reply-To: <20260319062104.1582999-1-nakshtra.goyal@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS7PR11MB6176:EE_
x-ms-office365-filtering-correlation-id: 57a9434d-ac69-41e2-5c49-08de8645e885
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: GBlCx7sG273tCzn1J8fh0j3ESoisj5LAvc7awmeYSu7L40Z/aeqcJnvpTk/hwQFAemVhFm8tnPQSRtfW4hSWwWBtFTgVwaJy/asU+FS5hIZQDzAmV9HnoDyb1U8L/9ntg/tVRDDD2eh2jdvmBpYi/aRmokaRqJ00PYWaysCG97Sf1ybSjqBaE4nyekzlzo6LuXucjywS0qbfLS7qerQQtxpRuvpQgA4QLrXja1kpnguqFRDp06qRDCF5bDdAfyPlc8cVieW0caVnP1iuj/xXJSFujABSEc1hE+oMTXhLcMitJuco66LzZPhIHXOhbgjJWP74dM61hIo96bRUQQLN2OK4FQ3VwIihWiiz4m3EABeSodyRUtlp6uYtNI5AMV6X+IfEukhusRpUnDItvF+GiCuRW8sax9ji3eEmzoTNdvShFp8QARzyPwt5VioMrg7Ua/qaiC/iKbvWDsPMUPxHoSsctKz7tvhhFpIO2L6jY9pZrktknKxxnBUKfrcQkVncvsDnWbM+5tEX74WGz1waVZLL9XSWY+KnB6RKs5c/H+SdmtYcCEuWmc/4YT8dpal22JxuOeHI0r602hkdR1ESS25ai4Ono6n0Qp8N8cP7vjytB9KbECyP1TtE8cF6V98vqHT92WN5GHEKK3wnsRvoYeti+J7vvtO7f40IOZ2qdy2Bn+bnTIeFlz+Wl9i5Cnk3SV2ks+mEpBXztoKqV2j50RWS86/APSs3hPvCSuNZAGtIrbr5JEd+UzokHtZp8UzF3e9tJKDKUaEYwqcNMj3RPJSqy7uF7CO4S9BlXMhgHds=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(22082099003)(56012099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1dnWcyuRrKvKmnI/v9sJtSrnZdyR/3gNgbg8PYH2SrnwJ0HB1be93opo5SXZ?=
 =?us-ascii?Q?GgshhMykr0sLNPNuIVV0RpE+PVoTSdExgpmxZRfFmQ3jRZ0/p+o43kJAPl7D?=
 =?us-ascii?Q?ZJlp84fBdJRIS5D7zAN6wgGrk3UIpb9YuDT+8pszctX55GSK170BJRQX1ClQ?=
 =?us-ascii?Q?3q7FcufC/f3RbEXE6vBQ5ZxdAnLQPHk6zVNs+FA61sCiWt+T/Bi+izQTC/ec?=
 =?us-ascii?Q?ctLHRpZiVlrSu9ZhzADntPuOvH1IcSl0zRheTTUXqAYkOah5LiaUFvRDh6rz?=
 =?us-ascii?Q?uTK/yqZmyRsl96qRIuHIIGD1eyJzVGEaK20roAfq/GWQqjMvooUYTZJ0S47/?=
 =?us-ascii?Q?LP6/+6AdSH0WNv8tv9QtXWe2BBnZdoOAQC6yFSKbDNLFml4rQ/h7DHqHYn0f?=
 =?us-ascii?Q?Nl1AVDYMGBStUkk07rw5QVaoSRhYy9dLgIfxTm8JEP7KmsD1//ODbI2oTcVd?=
 =?us-ascii?Q?UlDoUNm4Nl2CiN3CYHSr9yqYKQsd5O6IFUnsz9dnI6zgNAVIOnGCsS+h900W?=
 =?us-ascii?Q?xCx6A3JrmkiAOJLf3ZA4Xx+TC2X/7oWIjM+jZ8dwAw7+YNHZEAwiyII3MT2z?=
 =?us-ascii?Q?FTsBM1tLaPP0l5rbu2noSpqzeFZkYGLMtPjwcpZhlQxPHkyJMYr5g4LLMF1+?=
 =?us-ascii?Q?eRO9Gn6WesqWMKfi8XOZ3f5Jh3Q70vvbWcVIAWilIfp5qt6SaLOFghlm7zZI?=
 =?us-ascii?Q?D59NVL48kB1aTb+ekMPk16d1MDBEQConzF3WiOoxIFVJJ/KqbxWh9tp+6Wfl?=
 =?us-ascii?Q?Fz46r7AJTL7bJXZlWuFdskQI0Vb5AJr2hAoniSFRVec2gjx48aiGPdBFkt7Z?=
 =?us-ascii?Q?5ilb0brvR73mNPgLdCavX3pP/iiPiPXPFEvGUNojbhbHATGYeuKXSWvH1w3M?=
 =?us-ascii?Q?vSIJ4IOC65rbDM6drBjdkuepwrTqdkeb0kq1ZnaVFHXdYGKDbC2hVh0Q7Qfn?=
 =?us-ascii?Q?ncGj5wEAh27dVMR9f2uLI/gU6TJgH9wSFvHMV/5lG8J3vw7grUqn1wK8N3h+?=
 =?us-ascii?Q?k1j66BEWqrHW8Ap8Z/xoD8fkMulN5azwCK61Zc0r/wk4y67VEEBiBspLbnj1?=
 =?us-ascii?Q?mih/1uI2etfEtM0OUv+lyFjkJ+T28Nr6J+s8kGaHasPcSGCE57dlHcxbSZBF?=
 =?us-ascii?Q?r+QZtC1FlKlcFx3HhqzYFZLi5UYaCrMcDMgdsk4+DWnBThMf8E/scFT8Lm7+?=
 =?us-ascii?Q?AK+zGnYtdDBoR9AeQWDSonaIasPuLjbrm/rbImnBhWf1n3eWahN8IY82wr4h?=
 =?us-ascii?Q?BB3cZ4k6DcxN3+LlJIbw/aBVJKE8HUDCyjg4+Ufc6XvIHf2QMytmXPCzfz6L?=
 =?us-ascii?Q?R7S1T3BGvOszvssWIADo4VO9qY5b3gw9Ph5g60z1EOT0k6XAq+YnHulLNtt4?=
 =?us-ascii?Q?4xpKx9WxxndYszGjo9JiL/r/DbMtQbm9qzHGwf8OcQoAP7FIn7ugwFgQ2hN9?=
 =?us-ascii?Q?4gWmF2Tbtesorpd/EHYl5CAH95F8p39iaQDDsbxrz4e5Wyxu+Wa16WqXJTx1?=
 =?us-ascii?Q?8FhS2nXpUy356qQNkMr1S6xVfcvwQD5czKOWPQ6bYux3S7DmbevCZRRgmto0?=
 =?us-ascii?Q?RKMgeEQ/MSqh8g/uzkS74vUF2gkQEdTCZw8wvg1jWIWOesoV5HoOpZ/2VnKZ?=
 =?us-ascii?Q?PE2zV85o6vf9xHIS6SWjsMqWE94aUidd9CkQtEAlEljYFFyy+HUqdcbLheKn?=
 =?us-ascii?Q?8WQhxmoiCE7C6xYV/2w5OmZbpwVtKY4Bk4ZztPC2fMCLwjStSJe6+lDWbHmM?=
 =?us-ascii?Q?SQwIpbNhnukiAXZkhAOdn43dYE3tymU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ys4MLa5cf9tA0ejp5jH8i7VauIGKJOqhp4fdE9OyvasXI+ssx698FxxXGgiYMpwhaEvmU7MZgFYsXzcgIDbsdjzW0x8QetNlbqi/xZ0x8r3N/7+N38BynLDtxzYwslKW+bzIbz3pBiWhC0OUYsUOYwz+YqkYW6GhDe36hXdwBywxdmBwbEgTyqEDaB9B6pdOmHQ2+kovHIU9otEtgs1L8R88hJVjw3vn5Ajfx9zSaPgRNWDkrZTi3w5xo543huNXz/vvg7ZjU77OacH7pE8KZnZWDsG095MCtUE+oAc4ft0NlTQWgZEetjDhpDTD3tUIdZsX4jUFOOSfMgVuPfmz0g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a9434d-ac69-41e2-5c49-08de8645e885
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 05:59:54.5069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Og0Z5NpbCh0i6WTKSdqWfPHT8TKZNAhuzFVEZ6DOmEnAs9dPMUqDupLQPBxS/qEvzM8B52kpGdD9QNpeB66uwStdw4ard2LA1r+wz49AcqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6176
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
> From: Goyal, Nakshtra <nakshtra.goyal@intel.com>
> Sent: 19 March 2026 11:51 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_pat: Add negetive test to validate =
pat
> index
>=20
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
>=20
> Adding negetive test to validate pat index restrictions, extending tests =
in
Nit:Rename Negetive to negative
> userptr_coh_none and prime_export for index 18 and adding new svm test to
> validate for diff indexes , index 19 will pass in all cases , 18 will fai=
l with
> EINVAL
What about pat index 2way, have you tested that for all three cases?
>=20
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>  tests/intel/xe_pat.c | 74
> ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>=20
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c index
> e91b037a5..306796307 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -34,6 +34,11 @@
>  #define XE_COH_NONE          1
>  #define XE_COH_AT_LEAST_1WAY 2
>=20
> +/*
> + * PAT index 18: XA (eXclusive Access) + UC (Uncached).
> + */
> +#define XE_PAT_IDX_XA_UC     18
> +
>  static bool do_slow_check;
>  static char bus_addr[NAME_MAX];
>  static struct pci_device *pci_dev;
> @@ -82,6 +87,10 @@ static void userptr_coh_none(int fd)
>  				   size,
> DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
>  				   intel_get_pat_idx_wt(fd), 0),
>  		      -EINVAL);
> +	igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data),
> 0x40000,
> +				   size,
> DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
> +				   XE_PAT_IDX_XA_UC, 0),
> +		      -EINVAL);
>=20
>  	munmap(data, size);
>  	xe_vm_destroy(fd, vm);
> @@ -755,6 +764,61 @@ static void pat_index_dw(struct xe_pat_param *p)
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> +static bool is_l2_flush_optimized(int fd) {
> +	uint16_t dev_id =3D intel_get_drm_devid(fd);
> +
> +	return intel_graphics_ver(dev_id) >=3D IP_VER(35, 0) &&
> +!xe_has_vram(fd); }
> +
> +/**
> + * SUBTEST: l2-flush-opt-svm-pat-restrict
> + * Test category: negative test
> + * Description: Validate that on L2 flush optimized platforms, SVM
> + *		(CPU_ADDR_MIRROR) mappings only accept pat_index 19
> + *		(XA+2WAY) and reject all other pat indices with -EINVAL.
> + */
> +static void l2_flush_opt_svm_pat_restrict(int fd) {
> +	struct drm_xe_query_config *config =3D xe_config(fd);
> +	uint32_t vm;
> +	void *buffer;
> +	size_t alloc_size =3D xe_get_default_alignment(fd);
> +	struct xe_device *xe_dev =3D xe_device_get(fd);
> +	uint64_t svm_size;
> +	size_t size =3D xe_get_default_alignment(fd);
> +
> +	svm_size =3D 1ull << xe_dev->va_bits;
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	xe_vm_bind_lr_sync(fd, vm, 0, 0, 0, svm_size,
> +			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
> +	buffer =3D aligned_alloc(alloc_size, SZ_2M);
> +
> +	igt_require(config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
> +
> DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR);
> +
I see for 19, what about 2 way pat index?
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer),
> size,
> +					0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +					intel_get_pat_idx_wb(fd), 0, 0), 0);
> +
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer),
> size,
> +					0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +					intel_get_pat_idx_uc(fd), 0, 0), -
> EINVAL);
> +
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer),
> size,
> +					0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +					intel_get_pat_idx_wt(fd), 0, 0), -
> EINVAL);
> +
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer),
> size,
> +					0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +					XE_PAT_IDX_XA_UC, 0, 0), -EINVAL);
> +
> +	free(buffer);
> +	xe_vm_unbind_lr_sync(fd, vm, 0, 0, svm_size);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  /**
>   * SUBTEST: prime-self-import-coh
>   * Test category: functionality test
> @@ -890,6 +954,11 @@ static void prime_external_import_coh(void)
>  		      0);
>  	xe_vm_unbind_sync(fd2, vm, 0, 0x40000, size);
>=20
> +	igt_assert_eq(__xe_vm_bind(fd2, vm, 0, handle_import, 0, 0x40000,
> +				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL,
> 0, 0,
> +				   XE_PAT_IDX_XA_UC, 0),
> +		      -EINVAL);
> +
>  	xe_vm_destroy(fd2, vm);
>=20
>  	/*
> @@ -1771,6 +1840,11 @@ int igt_main_args("V", NULL, help_str, opt_handler=
,
> NULL)
>  		}
>  	}
>=20
> +	igt_subtest("l2-flush-opt-svm-pat-restrict") {
> +		igt_require(is_l2_flush_optimized(fd));
Instead of function, you can directly validate it here like other tests.
> +		l2_flush_opt_svm_pat_restrict(fd);
> +	}
> +
>  	igt_fixture()
>  		drm_close_driver(fd);
>  }
> --
> 2.34.1

