Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CE5FCD0BA
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 06:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED7C10E042;
	Wed, 18 Mar 2026 06:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExrOyYlg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4613A10E042
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 06:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773814593; x=1805350593;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nd9C6OSeEQTanSGHp462ziVZBZyUnyegc66Dw/fhm90=;
 b=ExrOyYlgrjqIVn7mXXMAtoQXhund4xGvRh4w0EAPJWBuhZRmXX8HEHN4
 mKbJuP+U1wRyb9PKc36Ap5Yirgj5I9pMh8yAAN4b1s4Xc7pcDXGcr9kdp
 1kkncBxiKUXT8dap3BJf+KKlEvQXVQM3MdTDYZ/nw1bFCahoJsI7QH8D8
 vRsMhOm772i5aDh+pi7hwkNkt49Yn/PXG8legaUIzJakaI0vpTkFY7gKy
 +EWDzHbpzr71t+Zef7aY7aLIbot74TVap7nZOIhaepfKcEzJ7iZ03uDLJ
 9lEnfA5piak8eLjzDYhpLj3rJANsxG1/HK9qtH7cYEZz6iPFu7bKbSSBL w==;
X-CSE-ConnectionGUID: pUxPCglfRxagMA1BaW+dbQ==
X-CSE-MsgGUID: B1WBq+75T8CHd3U6x6/jBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74982310"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74982310"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 23:16:32 -0700
X-CSE-ConnectionGUID: 6n2vKZ+IS12TtGLkQjWVKQ==
X-CSE-MsgGUID: cDxnbC4dRJGUKa3EHGwK4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="221736711"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 23:16:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 23:16:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 23:16:31 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 23:16:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXyXfr46QHFW80TC7mae+MmN37US/WbBZnAXfMJGd2U6c3paYyPW5yJHjjd997B6iWjfO5Qjuzz3si7o8GioibYo2ycY1p1bmwLKeb03mMb2iZqDi6GhZyLgeca//NESRDxYJpec9ktHF9Tl/U3M7z7Y9YDTX0/Hwk4JsFbPgmC0fZRH5TdVS8Wu1D1TTk42rIvZ61bcY3ScS+JQeoY9CCdw4N19t8qV1au5NXdmlH8axV7hX9Poj1Bf5L7mD/XjuoPTr51oK/F59JVO954WB4Pg+GDfk+FJyDobiK7b78ZfeDCOe3pWEfggaQIKiEuaSw7+dKwskCcTRc+8iR3dYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXrkQAdPZhToG6zV8pIPkDRRDFcJjlb4iletKXvxA9U=;
 b=ey6FqpAj5i59f0oEYO3jBPcsO7gcY6oGZz80vytpa1IK5k64dYwIpqT3PqoC/7AaILq/OQH+IdkSDfga2dbayXhfreY+9u24VTo/nxvTdoAIBwMqOgfKwpnxfLo84UhSrZtpo+SxrP97efEiauh1O+xf+rQfYg0czP+D+RZA6QA+2Mt7Z3pac4x0Jdne+KjWeHdxqLiLx0FaN92unAdZ0z02ITUdeBb/7hyMDHNDQ43beo6JsVK5V97vLXvc/28AZ7tHbMSJZGUEOCcdBUJfkrgji5RlsMB1dDCOcnPGV6LHVpCcHkJDb7q1IpC6/k3KgnXc7r8VevIGlRJmWzyKqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW4PR11MB5892.namprd11.prod.outlook.com (2603:10b6:303:16a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Wed, 18 Mar
 2026 06:16:26 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 06:16:26 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_dirtyfb: Pass output to PSR helpers
Thread-Topic: [PATCH i-g-t] tests/intel/kms_dirtyfb: Pass output to PSR helpers
Thread-Index: AQHctoU8uhdmBw5HiES9S5Z18NAh/7Wzv/+AgAAPt2A=
Date: Wed, 18 Mar 2026 06:16:26 +0000
Message-ID: <DM4PR11MB6312A299ABD661946943B337904EA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260318031205.70655-1-jeevan.b@intel.com>
 <PH7PR11MB6053731DD661F60E71105563E74EA@PH7PR11MB6053.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6053731DD661F60E71105563E74EA@PH7PR11MB6053.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW4PR11MB5892:EE_
x-ms-office365-filtering-correlation-id: f3ff12d4-7a16-4bd2-1484-08de84b5e30b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: mJXnI0kRLszPdcK6o5TIUvkENjjPvvH+TOjwzja3HPb87rk7r6Sm5bDhJrF/zcxd7ph/wrzf5wEQo7oOnF0bB9YeCIW9WvQzwXYdAcVsoqGpYwtXEgF/ELj5L6lXAieUCysEMe+6/ye5HSRbsL8OlbreSGr2y+feA++SfctyWoKY6R9Ft046MLQb+8LwukdBNziUpqsjXrC+LVb1lp4ga9klsvZdZZAt+/tAn4sSv/rY8v0dDIk0+G0Wr8Kosx/RoYzTEP7QaijgzRnYOMSnuYBYTWRzonRai7c+1EWHDtXalxwqh/86uQmovuI7LFMt6wrBhh5goqQmO4iTeYph2y9aqJ62a60Yk+1DCr/l4hI7K2WFtx/QJ5lFos4Y5uZ6o0aL4feebyBUHhrTzn7IRXPoT8aA7YRlYvGdCYGjln6ujDay+fha8Xt0lquj8CieNAYxM7kVn0qZZVzdJ+ASCqbhtMl8tBRzln0krDB8sBhSXgnh3AffV3PePV1erzZWJVtI4w2V3uk0QV/JNO3XoExtLv2cBIbvL1h0E7z8fFMSRVd4F4yVKQYz7bp4pyQym1yoKv/5pPq5ymirWgmxZC1MAn9NFBO88NxRhDZamY3utszXaCzts0S0kefKIlTzUkyw+6G1ZSBpQuIjtPrSMuF8Urt8ukoWexZOVCWyIZjK/qM78VnZWUfEi6uciaj/nptgBV4fv0u7frdipjN8X+cAA5SwDyuIDU+Da903+E133+r3OBrG8Sfx5byAaW2jbWLQkRPj9Jxj0drCnAAO9BLub8cnGEJIOVz5h+n0NRw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(22082099003)(18002099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ya6uVWrAdKJRjk2bWuhUlc/bzoTYK/nWNJ/MU+cg82QVxPglrJOyRULeP/XD?=
 =?us-ascii?Q?cuPcGeiqxytkqpn1ig9hSsYHxLbY7vcwyje4R8kIGc1JGkkrAZLG7RFXQ7+9?=
 =?us-ascii?Q?fSuKIldmUjw0u0kOozVGy7tI4BVHidGpg+RUXQ1CBi3RDiBxzMvbY5UUP+nZ?=
 =?us-ascii?Q?BcAxM0IbMrwp+W8oWV+45FfOO99CoPjlD+j3FAspFb/qHV3rDUYwqHtjdjKZ?=
 =?us-ascii?Q?yv6Gvj6Gh8swgeiBp8hxmqhNWOtfkQ++nojhZ+AYwFITq66rCo3iq6XdSeau?=
 =?us-ascii?Q?FIyAUQsAnfINSU52u8xoOx/l1P5zFU3wgM0CTdiCeH8MgeXkzM1jGL7swsJZ?=
 =?us-ascii?Q?7jUZAQfA7c9u+OheJemtpzRjdcCgd1gRH0ofTABziv0hmXXX44UziehnREip?=
 =?us-ascii?Q?gQSADS9mIQ44St30MTqHlyThbPWYQyBjnCl9lYo2jgu5XDVy9nNldQqsepEw?=
 =?us-ascii?Q?1aIBf72QfwEMd3948IJMYVTwN5yjP0O8yDj0qdWt4CTfPuzwufrfWbNnL1xF?=
 =?us-ascii?Q?uCX672WIA/14fNIaN+L2q1hqkBFfJ9WfHtHLk4z9EKhaLqNuqdL9wUbNWKmH?=
 =?us-ascii?Q?pGMETTeG2Zyq8Kk8WLgDF38k9oOG3U+RnPdzygjgizNXhQt/jQH1KS3xoqiT?=
 =?us-ascii?Q?EnJL2oSq+9KK7pJAzEbZg1KU1DSLuB4kXWeHpUzIkO1DdsN5kWiAgSAQcaoh?=
 =?us-ascii?Q?IvWHso42iWAL0vjfvU7ILrEGppZHytuk6X6isvnjhCtdFEt20xS8Wa8lDOQ7?=
 =?us-ascii?Q?ZBW7km91/6GQmU4Szh+KndjJBeImnSj+Vx0otgI8qdoe8g7HSLCncM3pmp4S?=
 =?us-ascii?Q?ZfE1rIgU4zFSxvYLQRFURqPz0+C1RU4t2w8DYEsfBkUjEARDGqSBp2IuC8gV?=
 =?us-ascii?Q?q0lrz+A4qy5M/XlrdAE1QWRL6MieOYqTdLB+94UNtDY4PlOdNCbcQP0pi2uH?=
 =?us-ascii?Q?TgRg48lunrh1pd5+sADKeHkRB7AprOpV3f1Zw5LwWmGXrN4P206TIGahZMp2?=
 =?us-ascii?Q?AouRXZWQs1WBPM+htUywajPKgPk8zb4Cwy3DnkH0SVywgWVMPo3mUNKY5VrX?=
 =?us-ascii?Q?meos/vRdgph4PtaQ4oNJwXAYWd+YqSNXyux20v1+T4vdUb5pN+iI3psYk4G0?=
 =?us-ascii?Q?nXpnNDcUIA59AQrgtKx7oaGL35KDYCX9ynXYgx0oj6Uc4zW0UM5aOpqSWMVN?=
 =?us-ascii?Q?QaRL/Byc5s4TWOCtcDCZpNvzsA6CcHarglq7gYzz8orMrZnH6CussMxmeaMj?=
 =?us-ascii?Q?95n46fa1Cy3if8hEVjkHAWwBOxWwADwqseMrCosj+3vmxgOhaXQq4hGP5q7C?=
 =?us-ascii?Q?WV1KzrU7+OccZx9A84sB1Yu5CB1wEHF5r5WYxKLpeceeQYfT9Ji7N511n+Or?=
 =?us-ascii?Q?zlKkSr7laZQN+LWZrN8YRS+krpCjz+NmGYNOlCRpko0w/te2/xJgxn25+gOI?=
 =?us-ascii?Q?kCZRSVZe7UIUOzppkpOMyDNI0sgOyRARh0PEneBM92zv9xG3pu4khJSWnWRv?=
 =?us-ascii?Q?N4D33q7b/H+ImiFjF51/dVih/lSurmZDye3oB8e97IpXowtaGr7xixgEt6fT?=
 =?us-ascii?Q?W5Fotfr6FUAiVQ3aPvdA3BUCgXU1oS0YXQkwqgnGWsokFKpcNR4NncE5Y0oo?=
 =?us-ascii?Q?Lv2M2jFHJlwAE6POVBcoI1RTlizHqGECSZruYjH1Cd+RU7wFXJp25f/EKRsW?=
 =?us-ascii?Q?XMpAf+xBN+GYdx8Ir0/nO3JNemW0jJy6/+YRtH75rxoyCkZe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Id1kUXe9BbNxNqzSZvE23QmX5yn0+Fr8zmBxI2DO23E6PR1q0dsSI33AbMBYUFvr4qYDuPksOnLYskjH+266nzRs3dgAcpRcW4rY2Z3ejkMTtYuIyUzN4ndZqUSYmzjdqjLH5Z390vnXBoJX7wPzrKJCaX5uUJatc2bqRVCfAQojMAa/nVfDIcw0dRm/8YX6JCskK5VfI12GXtRNzrE2YDINE8OFu3BzphI/RCmngfun+/HLEDHKsMxUy2hYoPWtOqWMjG1VWxzSgDcXAPAVTRYrpRC8FE+fpJNoMD6dy8pI2ReztxOXG55JlSnzfNOpUAjCxeC8tsD5cHCsKnT8lA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ff12d4-7a16-4bd2-1484-08de84b5e30b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 06:16:26.6128 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lozSER+0ZYDeupd4Xqq/o5aetkl5IpeKdM4OOyVck+zVPXyf8ejGxBRzwSGNIVFJSNchk+P7QGX24dgwL8S/SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5892
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
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: Wednesday, March 18, 2026 10:48 AM
> To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Hogander, Jouni <jouni.hogander@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: RE: [PATCH i-g-t] tests/intel/kms_dirtyfb: Pass output to PSR he=
lpers
>=20
> Hi Jeevan,
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Jeevan B
> > Sent: Wednesday, March 18, 2026 8:42 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Hogander, Jouni <jouni.hogander@intel.com>; B, Jeevan
> > <jeevan.b@intel.com>
> > Subject: [PATCH i-g-t] tests/intel/kms_dirtyfb: Pass output to PSR
> > helpers
> >
> > Replace NULL with data->output in PSR function calls and update the
> > log to include the output name when PSR is not supported.
> >
> > This change ensures correct behavior in dual eDP setups where PSR
> > support may differ between displays. Passing the specific output
> > instead of NULL allows PSR checks to be performed per connector,
> > ensuring each display is evaluated independently and accurately.
> >
> > v2: Replace NULL with data->output in all PSR helpers.
> > v3: Update commit message.
> >
> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > ---
> >  tests/intel/kms_dirtyfb.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> > index
> > b85e09346..b5de63350 100644
> > --- a/tests/intel/kms_dirtyfb.c
> > +++ b/tests/intel/kms_dirtyfb.c
> > @@ -120,8 +120,8 @@ static bool check_support(data_t *data)
> >  			return false;
> >  		}
> >  		if (!psr_sink_support(data->drm_fd, data->debugfs_fd,
> > -				      PSR_MODE_1, NULL)) {
> > -			igt_info("Output doesn't support PSR\n");
> > +				      PSR_MODE_1, data->output)) {
> > +			igt_info("Output %s doesn't support PSR\n",
> > +igt_output_name(data->output));
> >  			return false;
> >  		}
> >  		return true;
> > @@ -150,7 +150,7 @@ static void enable_feature(data_t *data)
> >  		intel_fbc_enable(&data->display);
> >  		break;
> >  	case FEATURE_PSR:
> > -		psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> > NULL);
> > +		psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> > data->output);
> >  		break;
> >  	case FEATURE_DRRS:
> >  		intel_drrs_enable(data->crtc);
> > @@ -173,7 +173,7 @@ static void check_feature_enabled(data_t *data)
> >  		break;
> >  	case FEATURE_PSR:
> >  		igt_require(!psr_disabled_check(data->debugfs_fd));
> > -		igt_assert_f(psr_wait_entry(data->debugfs_fd, PSR_MODE_1,
> > NULL),
> > +		igt_assert_f(psr_wait_entry(data->debugfs_fd, PSR_MODE_1,
> > +data->output),
> >  			     "PSR still disabled\n");
> >  		break;
> >  	case FEATURE_DRRS:
> > @@ -217,8 +217,8 @@ static void disable_features(data_t *data)  {
> >  	intel_fbc_disable(&data->display);
> >
> > -	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> > NULL))
> > -		psr_disable(data->drm_fd, data->debugfs_fd, NULL);
> > +	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> > data->output))
> > +		psr_disable(data->drm_fd, data->debugfs_fd, data->output);
>=20
> Passing data->output is clear for psr_sink_support() and psr_wait_entry()
> since those read output-specific PSR status.
> But for psr_enable()  and psr_disable(), impact is limited today since cu=
rrent
> control paths are still global.
Even though psr_enable() and psr_disable() are effectively global today,=20
passing data->output keeps the interface consistent with other PSR helpers
and future-proofs the code in case per-output control is introduced later.

Thanks=20
Jeevan B
>=20
> Regards,
> Pranay
> >
> >  	intel_drrs_disable(data->crtc);
> >  }
> > --
> > 2.43.0

