Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D775606A33B
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 19:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1+6TJUYz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D145B10E035;
	Fri, 20 Nov 2026 19:47:26 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010061.outbound.protection.outlook.com [52.101.201.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4FE10E070
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 19:46:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grzb9OlnKWXsXvZ1zPTGcr569vu++lSiHb6AzbncQRHwHb//2WLllJRYImQ795fpRIAFhppP1QB+NMD1TOcZTEcWCTK3GeG5eILrnGblrM48CNiL140jRX3Jmsm/18t3J9LMSxoSK0boF7Xf4KW/wn9lLK+pLiXecM7ydj0eZ0iEXNAeNqhAKkgB6Q5bqFH8Cl+l1B9BotdjKLDWCP9+tDSDRbvfN+iyT6GK4od2r2RGC1+DYEV6D6U5xKhsSwjrzaXVXqinK03JJIVV3kqvPhwrkkQWHKmgEsrC4igKDE3Cl25svXYVZDzlFKEuZ7GRCHLlomfmt23lZmpXZZnAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KchocSany/eFTnFV4Iu3MDyesiZwTC3FF/0r8AGcizQ=;
 b=RN8N8g4KzFDi/92Dr/wyJ3FradmdFQMj3IJsryWYDLPWZIW8vgp3No2hPYTjPaEvHMhxKxdKuIDycontJYH6l0H0hVx8BHc0KQQmQjUEkSIq9OKDU5KEVEuVUrId+e++RzVj2UwcWOYFU3sSgFQE/KAufKMW6PoL6v6BWKW1pf5/3mbeC0aq8q5RNpBpZO7eP0cPXuhuZxfjTJd6pOY/93qatXmVTK+2ejsfURfQ1ZTNGE1H6KxIqsKQHaV7MrT2w+WpKybKXFpaB65XuOdcztx6DoeLP1iB9JwHIkPUBq8HZMrWbwg8gWWDbsm16MIzYllW+j0YSmtwMbrzn00P1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KchocSany/eFTnFV4Iu3MDyesiZwTC3FF/0r8AGcizQ=;
 b=1+6TJUYz/sC14GPFM6kSHkwXE15jGDjfH8gczJL/A0Ov1IeTUvtdpORxX956j7G0cCSSifb2LMcwtLakaRiQfFD+FX2n6laGSPKS4137roN0DX54eGLXkQLA7fvEq9Z2r9IuyAnExAU6iHToteH3eZSR4Sqd5EIl3a99vk4eKZw=
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 (2603:10b6:610:2ff::7) by SA3PR12MB7783.namprd12.prod.outlook.com
 (2603:10b6:806:314::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 19:46:20 +0000
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74]) by CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74%6]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 19:46:20 +0000
From: "Francis, David" <David.Francis@amd.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Prosyak,
 Vitaly" <Vitaly.Prosyak@amd.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Simona Vetter <simona@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v4] tests/intel: Add edge case and race condition tests
 for GEM_CHANGE_HANDLE
Thread-Topic: [PATCH v4] tests/intel: Add edge case and race condition tests
 for GEM_CHANGE_HANDLE
Thread-Index: AQHdcSi/CygxM0nP6kyg2bHeno59hLcqdViAgAnMydSAAyX+AIAABNwY
Date: Fri, 20 Nov 2026 19:46:20 +0000
Message-ID: <CHAPR12MB9992474795BD2A857C7FC847D0EF782@CHAPR12MB999247.namprd12.prod.outlook.com>
References: <20261110153230.583745-1-David.Francis@amd.com>
 <6a89a83a-8290-4c59-855a-f798f8350570@igalia.com>
 <CHAPR12MB9992477A972F6389F886D55EAEEF7A2@CHAPR12MB999247.namprd12.prod.outlook.com>
 <bigey4diakr4ljuzegyc6tsnho42cuzpt5jnfflqeihv5nw7hv@iqzf3ljkfrrq>
In-Reply-To: <bigey4diakr4ljuzegyc6tsnho42cuzpt5jnfflqeihv5nw7hv@iqzf3ljkfrrq>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-11-20T19:46:19.852Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHAPR12MB999247:EE_|SA3PR12MB7783:EE_
x-ms-office365-filtering-correlation-id: bd325840-7201-40c5-da18-08df473ef323
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|38070700021|6133799003|261009223027099003|261009221227099003|22082099003|18002099003|261021135927099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261022113327099003|261022075727099003|261028144727099003|4143699003|56012099006|261102130727099003|261102123227099003|10067099003|11063799006;
x-microsoft-antispam-message-info: p5Ycku33kkvTGNmx/mLhAySJbtrExLVfal47YOEyBkXIEMtOff/nwydrwwNl+0tZFPiGw+jhEaf5wg0qk90QP6bWVTg76l1/xD0IndJvrtnPbwidGbvWvAiIR1djT5/23Y/NemlvAHjgPJz2TOmBofAGWQggw42X25z/QaZRnLD3BgiolHdknJjIwiNkVJHncOUu8jF4fwlJT/tfOfiUVxQvph0rGKCz35i9YX8Y8Fh/C1mw5jrM866PyToR3E/6HjizrFkjYk3adJInjcciMjfzRDkBbB9O4mf91hLjnZNRR6FfYehv/BP0mmJJ+f8Ts6vb+sGWHA2iBCajv4eyEW5P5FbJinorodAp/RWeqE+fhgiWsifvjgn3DAU3Z0dWGBMN0S8cqoQn90xR2ut+WHVQU0jjOjF3vZLTKv9j0DNjZfGA0cUiGppuhxC+DJ5A3fSq781GkAXBPbJ3V2EwXY3fQRFfPpOUbdKIgYogwtYqct/c0uZribrnIdQC0SR9+puHksts0UYaLXu6q/F+uYpSNksb/xdgqGY0eRLMsRKqNmU28C0fJQbFFTiGLEH/QJRdRHHhI4AxVHQtf2XVoPxdukuxc3FQwB0+KP3cDoU/wTu7NkvlxPuWDLSwXzRAZK9HTTvWV/j/OAyRezdbwB7LMY+rZ4K+d5LtpDkdzNBFI5qKg7b2LcC+YInj0is3uj367luoZKOaGNUd9pRC6CGloKZ5ht4Eu7vslkRtubk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CHAPR12MB999247.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(6133799003)(261009223027099003)(261009221227099003)(22082099003)(18002099003)(261021135927099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022113327099003)(261022075727099003)(261028144727099003)(4143699003)(56012099006)(261102130727099003)(261102123227099003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5O2KenPtiPaTzbJ1AAKAWa7q01B5IFpjOYsUcmYa8RRK+JSflJ3UakaneeMU?=
 =?us-ascii?Q?+2n3/YY3D7UinWQUfuuxUnPLTJ01/Sz2Wv96nK0xUcgYPRl4uN3m8cioBv/r?=
 =?us-ascii?Q?WVFkugsX/QrB3gcb4VrsomcvKmENYwpQCOGAvD0S4PvEf3Z/mS/vJN/HDrG8?=
 =?us-ascii?Q?8wGazpAly7ETJNzNWAz3M3FhLJyfXSARxGzQLKqzEsvSowJTecD+q1DNsjvu?=
 =?us-ascii?Q?j4r67AXre4SW/74XFV+EO7iyJ8GdxuPul8/RGFzOsMMIfId6fTJjHX3rNESt?=
 =?us-ascii?Q?DjMJn+7DTs5Dt1YmRgfHfl/as35A7VNRQ7RmdzHnnUXPCwCktaWnfXdVMzbh?=
 =?us-ascii?Q?k5uSaauc6DQRN+6KJHIFjr/oF1/hJV8Lzdk8V5SNscZK99l5dqBLFAMdLvWb?=
 =?us-ascii?Q?ZJhJqblBF0OStrtcRaERDfvZ8xYgrzI2I/3RzIsatoUzJiV2J3yC/vO9XOie?=
 =?us-ascii?Q?eCkPHOE9PglLVldycOZGZ2aKlLGjlB/I5qYtqOHtIBCvdxMUQ0dd6h8FmY2Q?=
 =?us-ascii?Q?CHVGICGox9J9gpEUqP+rhMjvui2mPSjuyXwhdKa3gJP17z+hsPDSeqJ76OVe?=
 =?us-ascii?Q?qARqwSc2x0L76cvJrwHmPv8r19eHRtNvKdYdQMAX8sc6Lnj74VT5zSiBh8JE?=
 =?us-ascii?Q?peDILvfdVYoFrytF50DSBpGqGjoH0u+htPZRQslU4CmSHczjCwGIiL0WLg9V?=
 =?us-ascii?Q?8pSPp0WFmFRW5tRSYmTYlztyZvy8WVOljcoN4Kr6auCyQC1ZqZupowZz+qzn?=
 =?us-ascii?Q?x1zfriFsHbH/4W6zG4g5PAuFNLaQT2vOq3XJXBbnlYi8fLCROz1AuGUBhfoc?=
 =?us-ascii?Q?CMdcDerpGQDO8KrZvoQz4kMbdmPBxfBuqwfcN5nxaMRG83bMUiMo2ahcNRo9?=
 =?us-ascii?Q?Nf5400EH+qJOHxGxE3kBPJdhX8jLZqMQUcskW8VWsqDOiJAgapiEvayZsHm7?=
 =?us-ascii?Q?8mHXDb9Ndj1NwRQAw2YPaoabRg0vSVOffMvHanBBV/Tf9SL//a2mJDmtUIRn?=
 =?us-ascii?Q?L2EkVrvc/OmHqXiURNIH2O7bfJ+841F/kqMGRfYxNvqdQDxY94+OIYziBHEK?=
 =?us-ascii?Q?5mQU/wYQvqJGQF0/Wdl1INhpFHlgoiZ8ND7DGFU5Ym2PleWEyebrcSuWA7bd?=
 =?us-ascii?Q?Dm+Fed7NGRgD47XZe/oVgDxN1n2dnD97WEUSlkQ2ophlv+vuOT2FgBjv/XoG?=
 =?us-ascii?Q?D5MSLIKzL1M9ZL+0/PV1tutErW9FdomDdDWKc1g/HpGzVQZjOEPEFJeB/hMF?=
 =?us-ascii?Q?N5zv/tOgQalj8jfdOmEgybsARAyn3R+O/LeQXs2bwsFxMDnTXzr1GTKLRQlO?=
 =?us-ascii?Q?81ZTcq5UmO67eVBGO/VsCrLN9AAe82oGkKPJo7CVQSf/YvnStsjMp/JvFVwl?=
 =?us-ascii?Q?mhnM/6QfqYBaKgaHzC88WyeKV25+5LD3a5KKh8xG88iNZpsnAkhz1gv62Kcl?=
 =?us-ascii?Q?1mHhb2dwLNucBi8u/IZi+QZ300p9RlI/uS5TP202x1UgcRia0BlDNVrBou50?=
 =?us-ascii?Q?mBfb9svDDzKn3FLTv0fFf3Oa/gBJ7Flnj61/LphXaqfglFxELvKgVwobbDdU?=
 =?us-ascii?Q?VUhCJk3djDDI3UB+NA/RuLsYHZrTNPP3eAN+TzxXHoI/JUxIQrLKcHnEOpul?=
 =?us-ascii?Q?NtdWpcsbuWwqVJgyZPEt8Nj8ppalhSKVuf7igZlHpiyL2eldzkrnupYPyfy+?=
 =?us-ascii?Q?fcpSQi2vWzG08kBJYBxP6SFOPdcMPv2gVPX2ThOP4acH6R2b?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHAPR12MB999247.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd325840-7201-40c5-da18-08df473ef323
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 19:46:20.2239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HNwNkXFSRIlkEQMmo0hAobv0LroChd1x3ozXJNu1wB6MPQV0JmN2BnjkQis803KW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7783
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks for the find.

I believe that's <fcntl.h>, can easily add that

Are there any other includes it needs to compile? I don't have an arm64 con=
tainer on hand

Thanks
David Francis

________________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Sent: Friday, November 20, 2026 2:27 PM
To: Francis, David
Cc: Tvrtko Ursulin; igt-dev@lists.freedesktop.org; Prosyak, Vitaly; Sebasti=
an Brzezinka; Koenig, Christian; Simona Vetter; Deucher, Alexander
Subject: Re: [PATCH v4] tests/intel: Add edge case and race condition tests=
 for GEM_CHANGE_HANDLE

Hi Francis,,
On 2026-11-18 at 19:25:38 +0000, Francis, David wrote:
> It's been about a week since this was reviewed.
>
> Tvrtko has also reviewed the kernel change.
>
> Is there anything left to do before this is merged? With the current vers=
ion, tests are skipped if the ioctl is still disabled in the kernel.

Please check compilation on arm64 container and restore some
includes, as now it fails:

864/1845] Compiling C object tests/gem_change_handle.p/intel_gem_change_han=
dle.c.o
FAILED: tests/gem_change_handle.p/intel_gem_change_handle.c.o
/usr/bin/aarch64-linux-gnu-gcc -Itests/gem_change_handle.p -Itests -I../tes=
ts -I../include -I../include/drm-uapi -I../include/drm-uapi-experimental -I=
../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I.. -I../=
lib/vendor -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/aarch64-=
linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2=
 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/aarch64-linux=
-gnu -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -fdiagnostics-co=
lor=3Dalways -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgn=
u11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-func=
tion-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=
=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissi=
ng-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -W=
pointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialize=
d -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initi=
alizers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-compare =
-Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress=
 -Werror=3Darray-bounds -Werror=3Ddangling-pointer -Werror=3Dimplicit -Werr=
or=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werr=
or=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-i=
nt-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs =
-Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFIL=
E64_SOURCE=3D1 -pthread -MD -MQ tests/gem_change_handle.p/intel_gem_change_=
handle.c.o -MF tests/gem_change_handle.p/intel_gem_change_handle.c.o.d -o t=
ests/gem_change_handle.p/intel_gem_change_handle.c.o -c ../tests/intel/gem_=
change_handle.c
In file included from /usr/include/xf86drm.h:40,
                 from ../lib/drmtest.h:37,
                 from ../lib/igt.h:27,
                 from ../tests/intel/gem_change_handle.c:24:
../tests/intel/gem_change_handle.c: In function 'export_import_thread':
../tests/intel/gem_change_handle.c:491:44: error: 'O_CLOEXEC' undeclared (f=
irst use in this function); did you mean 'MFD_CLOEXEC'?
  491 |                         prime_args.flags =3D DRM_CLOEXEC | DRM_RDWR=
;
      |                                            ^~~~~~~~~~~
../tests/intel/gem_change_handle.c:491:44: note: each undeclared identifier=
 is reported only once for each function it appears in
../tests/intel/gem_change_handle.c:491:58: error: 'O_RDWR' undeclared (firs=
t use in this function)
  491 |                         prime_args.flags =3D DRM_CLOEXEC | DRM_RDWR=
;
      |                                                          ^~~~~~~~
ninja: build stopped: subcommand failed.


Regards,
Kamil

>
> David Francis
>
> ________________________________________
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Sent: Thursday, November 12, 2026 8:43 AM
> To: Francis, David; igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly; Kamil Konieczny; Sebastian Brzezinka; Koenig, Christ=
ian; Simona Vetter; Deucher, Alexander
> Subject: Re: [PATCH v4] tests/intel: Add edge case and race condition tes=
ts for GEM_CHANGE_HANDLE
>
>
> On 10/11/2026 15:32, David Francis wrote:
> > From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >
> > Add a GPU-agnostic GEM_CHANGE_HANDLE tests. These test for basic
> > functionality, edge cases, and race conditions of this ioctl against
> > itself, gem close, gem create, and prime import and export.
> >
> > GEM_CHANGE_HANDLE is currently wired to drm_invalid_op in DRM core. Thi=
s IGT
> > coverage is a prerequisite for validating the eventual kernel-side ioct=
l
> > implementation and makes fixing its security bugs safer.
> >
> > v2: Small cleanups, including cutting some includes and no assert in th=
reads
> > v3: Skip if ioctl disabled
> > v4: hop around randomly on race tests
>
> Nice, v4 is much easier to follow. Thank you for iterating patiently!
>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Regards,
>
> Tvrtko
>
> >
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> > Cc: Christian Konig <christian.koenig@amd.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> > Signed-off-by: David Francis <David.Francis@amd.com>
> > ---
> >   include/drm-uapi/drm.h          |  23 +
> >   tests/intel/gem_change_handle.c | 728 +++++++++++++++++++++++++++++++=
+
> >   tests/meson.build               |   1 +
> >   3 files changed, 752 insertions(+)
> >   create mode 100644 tests/intel/gem_change_handle.c
> >
> > diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
> > index baa620e3f..cf131da24 100644
> > --- a/include/drm-uapi/drm.h
> > +++ b/include/drm-uapi/drm.h
> > @@ -619,6 +619,21 @@ struct drm_gem_open {
> >       __u64 size;
> >   };
> >
> > +/**
> > + * struct drm_gem_change_handle - Argument for &DRM_IOCTL_GEM_CHANGE_H=
ANDLE ioctl.
> > + * @handle: The handle of a gem object.
> > + * @new_handle: An available gem handle.
> > + *
> > + * This ioctl changes the handle of a GEM object to the specified one.
> > + * The new handle must be unused. On success the old handle is closed
> > + * and all further IOCTL should refer to the new handle only.
> > + * Calls to DRM_IOCTL_PRIME_FD_TO_HANDLE will return the new handle.
> > + */
> > +struct drm_gem_change_handle {
> > +     __u32 handle;
> > +     __u32 new_handle;
> > +};
> > +
> >   /**
> >    * DRM_CAP_DUMB_BUFFER
> >    *
> > @@ -1296,6 +1311,14 @@ extern "C" {
> >    */
> >   #define DRM_IOCTL_MODE_CLOSEFB              DRM_IOWR(0xD0, struct drm=
_mode_closefb)
> >
> > +/**
> > + * DRM_IOCTL_GEM_CHANGE_HANDLE - Move an object to a different handle
> > + *
> > + * Some applications (notably CRIU) need objects to have specific gem =
handles.
> > + * This ioctl changes the object at one gem handle to use a new gem ha=
ndle.
> > + */
> > +#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_c=
hange_handle)
> > +
> >   /*
> >    * Device specific ioctls should only be in their respective headers
> >    * The device specific ioctl range is from 0x40 to 0x9f.
> > diff --git a/tests/intel/gem_change_handle.c b/tests/intel/gem_change_h=
andle.c
> > new file mode 100644
> > index 000000000..1aef48d0a
> > --- /dev/null
> > +++ b/tests/intel/gem_change_handle.c
> > @@ -0,0 +1,728 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright 2026 Advanced Micro Devices, Inc.
> > + * Copyright 2026 Intel Corporation
> > + *
> > + * GPU-agnostic race condition tests for GEM_CHANGE_HANDLE ioctl
> > + *
> > + * NOTE: This test is located in tests/intel/ directory because:
> > + * 1. All gem_* tests are traditionally placed in tests/intel/ regardl=
ess
> > + *    of GPU vendor, following IGT convention for GEM-related tests
> > + * 2. The test uses i915/gem.h and i915/gem_create.h for GEM object cr=
eation
> > + *    on Intel platforms, though it works vendor-agnostically via DRM =
core
> > + * 3. Some subtest designs (noop-same-handle, invalid-*, edge-*, funct=
ional-*)
> > + *    were proposed by Simona Vetter (Intel), hence Intel copyright he=
ader
> > + *
> > + */
> > +
> > +#include <errno.h>
> > +#include <limits.h>
> > +#include <pthread.h>
> > +#include <sched.h>
> > +#include <string.h>
> > +
> > +#include "igt.h"
> > +#include "igt_device.h"
> > +#include "i915/gem.h"
> > +#include "i915/gem_create.h"
> > +
> > +#include "lib/amdgpu/amd_memory.h"
> > +#include "igt_amd.h"
> > +
> > +#define BO_SIZE (16 * 1024)
> > +#define RACE_DURATION_SEC 1
> > +
> > +//#define VERBOSE_LOGGING 0
> > +
> > +/**
> > + * TEST: gem change handle
> > + * Description: tests for drm ioctl GEM_CHANGE_HANDLE
> > + * Category: Core
> > + * Mega feature: General Core features
> > + * Sub-category: GEM handles
> > + * Functionality: gem change handle
> > + * Feature: gem
> > + * Run type: FULL
> > + *
> > + * SUBTEST: sanity
> > + * Description: Changing a handle to a new value works as intended
> > + *
> > + * SUBTEST: change_prime
> > + * Description: Changing a handle affects the result of prime import
> > + *
> > + * SUBTEST: new_handle_zero
> > + * Description: Changing a handle to 0 should fail
> > + *
> > + * SUBTEST: new_handle_exceeds_int_max
> > + * Description: Changing a handle to > INT_MAX should fail
> > + *
> > + * SUBTEST: new_handle_equals_old_handle
> > + * Description: Changing a handle to itself should fail
> > + *
> > + * SUBTEST: new_handle_taken
> > + * Description: Changing a handle to a value already in use should fai=
l
> > + *
> > + * SUBTEST: invalid_handle
> > + * Description: Changing a non-existent handle should fail
> > + *
> > + * SUBTEST: race_change_change
> > + * Description: Test for race conditions between two GEM_CHANGE_HANDLE
> > + *
> > + * SUBTEST: race_change_create_close
> > + * Description: Test for race conditions between GEM_CHANGE_HANDLE, GE=
M_CREATE, and GEM_CLOSE
> > + *
> > + * SUBTEST: race_change_export_import
> > + * Description: Test for race conditions between GEM_CHANGE_HANDLE, pr=
ime export, and prime import
> > + */
> > +
> > +IGT_TEST_DESCRIPTION("Edge case and race condition tests for GEM_CHANG=
E_HANDLE");
> > +
> > +/* Structs */
> > +
> > +/* Driver type detection */
> > +enum gpu_driver {
> > +     DRIVER_TYPE_UNKNOWN =3D 0,
> > +     DRIVER_TYPE_I915,
> > +     DRIVER_TYPE_AMDGPU,
> > +};
> > +
> > +/* GPU context structure */
> > +struct gpu_ctx {
> > +     int fd;
> > +     enum gpu_driver driver;
> > +};
> > +
> > +/* Helpers */
> > +
> > +static uint32_t gpu_create_bo(struct gpu_ctx *ctx, uint64_t size)
> > +{
> > +     uint32_t handle =3D 0;
> > +
> > +     switch (ctx->driver) {
> > +     case DRIVER_TYPE_I915: {
> > +             handle =3D gem_create(ctx->fd, size);
> > +             break;
> > +     }
> > +     case DRIVER_TYPE_AMDGPU:
> > +             handle =3D igt_amd_create_bo(ctx->fd, size);
> > +             break;
> > +     default:
> > +             igt_assert_f(0, "Unsupported driver\n");
> > +     }
> > +
> > +     igt_assert(handle !=3D 0);
> > +     return handle;
> > +}
> > +
> > +static int gem_close_bo(struct gpu_ctx *ctx, uint32_t handle)
> > +{
> > +     struct drm_gem_close close_args =3D { .handle =3D handle };
> > +
> > +     return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CLOSE, &close_args);
> > +}
> > +
> > +static int gem_change_handle(struct gpu_ctx *ctx, uint32_t old_handle,=
 uint32_t new_handle)
> > +{
> > +     struct drm_gem_change_handle args =3D {
> > +             .handle =3D old_handle,
> > +             .new_handle =3D new_handle,
> > +     };
> > +     return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CHANGE_HANDLE, &args);
> > +}
> > +
> > +static enum gpu_driver detect_driver(int fd)
> > +{
> > +     /* Check AMDGPU first (primary target) */
> > +     if (is_amdgpu_device(fd))
> > +             return DRIVER_TYPE_AMDGPU;
> > +     if (is_i915_device(fd))
> > +             return DRIVER_TYPE_I915;
> > +     return DRIVER_TYPE_UNKNOWN;
> > +}
> > +
> > +static bool is_ioctl_disabled(struct gpu_ctx *ctx)
> > +{
> > +     uint32_t handle, new_h;
> > +     int ret;
> > +     bool result;
> > +
> > +     handle =3D gpu_create_bo(ctx, 4096);
> > +     new_h =3D handle + 1000;
> > +
> > +     ret =3D gem_change_handle(ctx, handle, new_h);
> > +     result =3D (ret !=3D 0 && errno =3D=3D EINVAL);
> > +
> > +     gem_close_bo(ctx, handle);
> > +     gem_close_bo(ctx, new_h);
> > +
> > +     return result;
> > +}
> > +
> > +#ifdef VERBOSE_LOGGING
> > +#define verbose_log(...) igt_info(__VA_ARGS__)
> > +#else
> > +#define verbose_log(...)
> > +#endif
> > +
> > +/* Sanity and Functionality tests */
> > +
> > +/**
> > + * test_sanity - verify rename actually works
> > + *
> > + * After a successful rename:
> > + * - GEM_CLOSE(old_handle) must FAIL (handle no longer exists)
> > + * - GEM_CLOSE(new_handle) must SUCCEED (object is there)
> > + */
> > +static void test_sanity(struct gpu_ctx *ctx)
> > +{
> > +     uint32_t handle, new_h;
> > +     int ret;
> > +
> > +     handle =3D gpu_create_bo(ctx, 4096);
> > +     new_h =3D handle + 1000;
> > +
> > +     /* Perform the rename */
> > +     ret =3D gem_change_handle(ctx, handle, new_h);
> > +     igt_assert_f(ret =3D=3D 0,
> > +                  "gem_change_handle(%u -> %u) failed: %s\n",
> > +                  handle, new_h, strerror(errno));
> > +
> > +     /* Old handle must be invalid now */
> > +     ret =3D gem_close_bo(ctx, handle);
> > +     igt_assert_f(ret < 0 && errno =3D=3D EINVAL,
> > +                  "GEM_CLOSE(old_handle=3D%u) should fail with EINVAL,=
 "
> > +                  "got ret=3D%d errno=3D%d (%s)\n",
> > +                  handle, ret, errno, strerror(errno));
> > +
> > +     /* New handle must be valid */
> > +     ret =3D gem_close_bo(ctx, new_h);
> > +     igt_assert_f(ret =3D=3D 0,
> > +                  "GEM_CLOSE(new_handle=3D%u) should succeed, "
> > +                  "got ret=3D%d errno=3D%d (%s)\n",
> > +                  new_h, ret, errno, strerror(errno));
> > +}
> > +
> > +/**
> > + * test_change_export - changing a handle affects prime import
> > + *
> > + * Importing a prime object that has had its handle changed since it w=
as
> > + * exported should get the new handle
> > + */
> > +static void test_change_export(struct gpu_ctx *ctx)
> > +{
> > +     int ret, handle1, handle2, dmabuf_fd, imported_handle;
> > +
> > +     /* Create a handle and export it */
> > +     handle1 =3D gpu_create_bo(ctx, 4096);
> > +     handle2 =3D handle1 + 1;
> > +     dmabuf_fd =3D prime_handle_to_fd(ctx->fd, handle1);
> > +
> > +     /* When you import, you get the same handle back */
> > +     imported_handle =3D prime_fd_to_handle(ctx->fd, dmabuf_fd);
> > +     igt_assert_eq(imported_handle, handle1);
> > +
> > +     /* Change the handle (should succeed) */
> > +     ret =3D gem_change_handle(ctx, handle1, handle2);
> > +     igt_assert_eq(ret, 0);
> > +
> > +     /* Import, should get the new handle */
> > +     imported_handle =3D prime_fd_to_handle(ctx->fd, dmabuf_fd);
> > +     igt_assert_eq(imported_handle, handle2);
> > +
> > +     /* Confirm gem object is at the new handle */
> > +     igt_assert_eq(gem_close_bo(ctx, handle2), 0);
> > +
> > +     ret =3D gem_close_bo(ctx, handle1);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, EINVAL);
> > +
> > +     close(dmabuf_fd);
> > +}
> > +
> > +/* Edge case and fail case tests */
> > +
> > +/**
> > + * test_new_handle_zero - new_handle =3D 0 should fail
> > + *
> > + * 0 is not a valid gem handle.
> > + */
> > +static void test_new_handle_zero(struct gpu_ctx *ctx)
> > +{
> > +     uint32_t handle;
> > +     int ret;
> > +
> > +     handle =3D gpu_create_bo(ctx, 4096);
> > +
> > +     /* new_handle =3D 0 must fail with -EINVAL */
> > +     ret =3D gem_change_handle(ctx, handle, 0);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, EINVAL);
> > +
> > +     /* Original handle should still be valid */
> > +     igt_assert_eq(gem_close_bo(ctx, handle), 0);
> > +}
> > +
> > +/**
> > + * test_new_handle_exceeds_int_max - new_handle > INT_MAX should fail
> > + *
> > + * The kernel enforces an idr_alloc() limitation: new_handle must be <=
=3D INT_MAX.
> > + */
> > +static void test_new_handle_exceeds_int_max(struct gpu_ctx *ctx)
> > +{
> > +     uint32_t handle;
> > +     int ret;
> > +
> > +     handle =3D gpu_create_bo(ctx, 4096);
> > +
> > +     /* new_handle > INT_MAX must fail with -EINVAL */
> > +     ret =3D gem_change_handle(ctx, handle, (uint32_t)INT_MAX + 1);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, EINVAL);
> > +
> > +     /* Also test 0xFFFFFFFF */
> > +     ret =3D gem_change_handle(ctx, handle, 0xFFFFFFFF);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, EINVAL);
> > +
> > +     /* Original handle should still be valid */
> > +     igt_assert_eq(gem_close_bo(ctx, handle), 0);
> > +}
> > +
> > +/**
> > + * test_new_handle_equals_old_handle - new_handle =3D old_handle shoul=
d fail
> > + *
> > + * The ioctl treats old_handle =3D new_handle as invalid input.
> > + */
> > +static void test_new_handle_equals_old_handle(struct gpu_ctx *ctx)
> > +{
> > +     uint32_t handle;
> > +     int ret;
> > +
> > +     handle =3D gpu_create_bo(ctx, 4096);
> > +
> > +     /* new_handle =3D old_handle must fail with -EINVAL */
> > +     ret =3D gem_change_handle(ctx, handle, handle);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, EINVAL);
> > +
> > +     /* same thing if handle doesn't exist */
> > +     ret =3D gem_change_handle(ctx, handle + 1, handle + 1);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, EINVAL);
> > +
> > +     /* Original handle should still be valid */
> > +     igt_assert_eq(gem_close_bo(ctx, handle), 0);
> > +}
> > +
> > +/**
> > + * test_new_handle_taken - new_handle being the handle of another gem =
object must fail
> > + *
> > + * Not allowed to change a handle to a handle that's already taken
> > + */
> > +static void test_new_handle_taken(struct gpu_ctx *ctx)
> > +{
> > +     uint32_t handle, handle_2;
> > +     int ret;
> > +
> > +     handle =3D gpu_create_bo(ctx, 4096);
> > +     handle_2 =3D gpu_create_bo(ctx, 4096);
> > +
> > +     /* new_handle is taken must fail with -EBUSY */
> > +     ret =3D gem_change_handle(ctx, handle, handle_2);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, EBUSY);
> > +
> > +     /* And the other way */
> > +     ret =3D gem_change_handle(ctx, handle_2, handle);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, EBUSY);
> > +
> > +     /* Original handles should still be valid */
> > +     igt_assert_eq(gem_close_bo(ctx, handle), 0);
> > +     igt_assert_eq(gem_close_bo(ctx, handle_2), 0);
> > +}
> > +
> > +/**
> > + * test_invalid_handle - non-existent handle should fail
> > + *
> > + * Using a handle that doesn't exist should return -ENOENT.
> > + */
> > +static void test_invalid_handle(struct gpu_ctx *ctx)
> > +{
> > +     int ret;
> > +
> > +     /* Use a handle that was never allocated */
> > +     ret =3D gem_change_handle(ctx, 0xDEAD, 0xBEEF);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, ENOENT);
> > +
> > +     /* Handle 0 is also invalid */
> > +     ret =3D gem_change_handle(ctx, 0, 100);
> > +     igt_assert(ret < 0);
> > +     igt_assert_eq(errno, ENOENT);
> > +}
> > +
> > +/* Race condition test structs and helpers */
> > +
> > +struct change_handle_thread_data {
> > +     struct gpu_ctx *ctx;
> > +     uint32_t handles[4];
> > +     bool running;
> > +     int unexpected_errno;
> > +     pthread_barrier_t barrier;
> > +};
> > +
> > +static void set_up_context(struct change_handle_thread_data *data, str=
uct gpu_ctx *ctx)
> > +{
> > +     data->handles[0] =3D gpu_create_bo(ctx, BO_SIZE);
> > +     igt_assert(data->handles[0] !=3D 0);
> > +     data->handles[1] =3D gpu_create_bo(ctx, BO_SIZE);
> > +     igt_assert(data->handles[1] !=3D 0);
> > +
> > +     data->ctx =3D ctx;
> > +     data->handles[2] =3D max(data->handles[0], data->handles[1]) + 0x=
10;
> > +     data->handles[3] =3D max(data->handles[0], data->handles[1]) + 0x=
20;
> > +     data->unexpected_errno =3D 0;
> > +     __atomic_store_n(&data->running, true, __ATOMIC_RELEASE);
> > +
> > +     pthread_barrier_init(&data->barrier, NULL, 2);
> > +}
> > +
> > +/* Race condition test threads */
> > +
> > +static void *change_handle_thread(void *arg)
> > +{
> > +     struct change_handle_thread_data *data =3D arg;
> > +     uint32_t *h =3D data->handles;
> > +     int ret, old, new;
> > +
> > +     pthread_barrier_wait(&data->barrier);
> > +
> > +     while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> > +             old =3D h[rand() % 4];
> > +             new =3D h[rand() % 4];
> > +             ret =3D gem_change_handle(data->ctx, old, new);
> > +             /*
> > +              * Expected errors:
> > +              * - ENOENT: old handle invalid
> > +              * - EBUSY: target handle occupied (collision detected du=
ring idr_alloc)
> > +              * - EINVAL: old and new handle are the same
> > +              */
> > +             if (ret !=3D 0 && errno !=3D ENOENT && errno !=3D EBUSY &=
& old !=3D new)
> > +                     data->unexpected_errno =3D errno;
> > +
> > +             sched_yield();
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +static void *close_recreate_thread(void *arg)
> > +{
> > +     struct change_handle_thread_data *data =3D arg;
> > +     uint32_t *h =3D data->handles;
> > +     int handle, ret, i =3D 0;
> > +
> > +     pthread_barrier_wait(&data->barrier);
> > +
> > +     while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> > +             /* Close a handle; keep trying until success */
> > +             while (true) {
> > +                     ret =3D gem_close_bo(data->ctx, h[i]);
> > +                     if (ret =3D=3D 0) {
> > +                             verbose_log("[CLOSE-TID:%lu] Closed handl=
e %u\n",
> > +                                         (unsigned long)pthread_self()=
, h[i]);
> > +                             break;
> > +                     }
> > +
> > +                     i  =3D (i + 1) % 4;
> > +
> > +                     if (!__atomic_load_n(&data->running, __ATOMIC_ACQ=
UIRE))
> > +                             return NULL;
> > +             }
> > +
> > +             /* Open a handle */
> > +             handle =3D gpu_create_bo(data->ctx, BO_SIZE);
> > +             verbose_log("[CLOSE-TID:%lu] Created new BO with handle %=
u\n",
> > +                         (unsigned long)tid, handle);
> > +
> > +             /* If the opened handle isn't one of the four ones being
> > +              * shuffled, change_handle it in. Keep trying until succe=
ss.
> > +              */
> > +             if (handle !=3D h[0] && handle !=3D h[1] && handle !=3D h=
[2] && handle !=3D h[3]) {
> > +                     while (true) {
> > +                             ret =3D gem_change_handle(data->ctx, hand=
le, h[i]);
> > +                             if (ret =3D=3D 0) {
> > +                                     verbose_log("[CLOSE-TID:%lu] Chan=
ge handle %u to %u\n",
> > +                                                 (unsigned long)pthrea=
d_self(), handle, h[i]);
> > +                                     break;
> > +                             }
> > +
> > +                             if (ret !=3D 0 && errno !=3D ENOENT && er=
rno !=3D EBUSY)
> > +                                     data->unexpected_errno =3D errno;
> > +
> > +                             i  =3D (i + 1) % 4;
> > +
> > +                             if (!__atomic_load_n(&data->running, __AT=
OMIC_ACQUIRE))
> > +                                     return NULL;
> > +                     }
> > +             }
> > +
> > +             sched_yield();
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +static void *export_import_thread(void *arg)
> > +{
> > +     struct change_handle_thread_data *data =3D arg;
> > +     struct drm_prime_handle prime_args;
> > +     uint32_t *h =3D data->handles;
> > +     int handle, i, ret, dmabuf_fd;
> > +
> > +     pthread_barrier_wait(&data->barrier);
> > +
> > +     while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> > +             /* Export a handle; keep trying until success */
> > +             i =3D 0;
> > +             while (true) {
> > +                     prime_args.handle =3D h[i];
> > +                     prime_args.flags =3D DRM_CLOEXEC | DRM_RDWR;
> > +                     ret =3D igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_=
HANDLE_TO_FD, &prime_args);
> > +                     if (ret =3D=3D 0) {
> > +                             verbose_log("[PRIME-TID:%lu] Exported han=
dle %u\n",
> > +                                         (unsigned long)pthread_self, =
h[i]);
> > +                             break;
> > +                     }
> > +
> > +                     i +=3D 1;
> > +                     if (i > 3)
> > +                             i =3D 0;
> > +
> > +                     if (!__atomic_load_n(&data->running, __ATOMIC_ACQ=
UIRE))
> > +                             return NULL;
> > +             }
> > +
> > +             dmabuf_fd =3D prime_args.fd;
> > +
> > +             /* Import the handle; it should be one of the four handle=
s in the shuffle */
> > +             prime_args.fd =3D dmabuf_fd;
> > +             prime_args.flags =3D 0;
> > +             ret =3D igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_FD_TO_HA=
NDLE, &prime_args);
> > +             if (ret !=3D 0)
> > +                     data->unexpected_errno =3D errno;
> > +
> > +             handle =3D prime_args.handle;
> > +             verbose_log("[PRIME-TID:%lu] Imported; got handle %u\n",
> > +                         (unsigned long)tid, handle);
> > +             if(handle !=3D h[0] && handle !=3D h[1] && handle !=3D h[=
2] && handle !=3D h[3])
> > +                     data->unexpected_errno =3D ERANGE;
> > +
> > +             close(dmabuf_fd);
> > +
> > +             sched_yield();
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +/* Race condition tests */
> > +
> > +/**
> > + * test_race_change_change - Test for race conditions of change_handle=
 against itself
> > + *
> > + * Start two threads, each of which constantly attempt changes between=
 four different handles
> > + * Try to catch race conditions such as changing same handle to two di=
fferent handles,
> > + * Changing two handles to the same handle, changing a handle to a han=
dle itself being changed,
> > + * etc.
> > + */
> > +static void test_race_change_change(struct gpu_ctx *ctx)
> > +{
> > +     pthread_t thread_change_1, thread_change_2;
> > +     struct change_handle_thread_data data =3D {0};
> > +     int num_handles, ret;
> > +
> > +     set_up_context(&data, ctx);
> > +
> > +     /* Start both threads simultaneously */
> > +     igt_assert_eq(pthread_create(&thread_change_1, NULL, change_handl=
e_thread, &data), 0);
> > +     igt_assert_eq(pthread_create(&thread_change_2, NULL, change_handl=
e_thread, &data), 0);
> > +
> > +     /* Let them race */
> > +     sleep(RACE_DURATION_SEC);
> > +
> > +     __atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> > +     pthread_join(thread_change_1, NULL);
> > +     pthread_join(thread_change_2, NULL);
> > +
> > +     pthread_barrier_destroy(&data.barrier);
> > +
> > +     igt_assert_eq(data.unexpected_errno, 0);
> > +
> > +     /* Exactly two gem objects should still exist */
> > +     num_handles =3D 0;
> > +     for (int i =3D 0; i < 4; i++) {
> > +             ret =3D gem_close_bo(ctx, data.handles[i]);
> > +
> > +             if (ret =3D=3D 0) {
> > +                     num_handles +=3D 1;
> > +             } else {
> > +                     igt_assert_eq(errno, EINVAL);
> > +             }
> > +     }
> > +     igt_assert_eq(num_handles, 2);
> > +}
> > +
> > +/**
> > + * test_race_change_create_close - Test for race conditions of change_=
handle against gem create / close
> > + *
> > + * Start two threads, one of which attempts to change between four han=
dles while the other alternates
> > + * closing a gem handle and creating new ones. Test for race condition=
s such as change a handle that's
> > + * being closed or change a handle to a value that's being created.
> > + */
> > +static void test_race_change_create_close(struct gpu_ctx *ctx)
> > +{
> > +     pthread_t thread_change, thread_create_close;
> > +     struct change_handle_thread_data data =3D {0};
> > +     int num_handles, ret;
> > +
> > +     set_up_context(&data, ctx);
> > +
> > +     /* Start both threads simultaneously */
> > +     igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_=
thread, &data), 0);
> > +     igt_assert_eq(pthread_create(&thread_create_close, NULL, close_re=
create_thread, &data), 0);
> > +
> > +     /* Let them race */
> > +     sleep(RACE_DURATION_SEC);
> > +
> > +     __atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> > +     pthread_join(thread_change, NULL);
> > +     pthread_join(thread_create_close, NULL);
> > +
> > +     pthread_barrier_destroy(&data.barrier);
> > +
> > +     igt_assert_eq(data.unexpected_errno, 0);
> > +
> > +     /* Depending on where create / close ended up, there can be 1 or =
2 handles open */
> > +     num_handles =3D 0;
> > +     for (int i =3D 0; i < 4; i++) {
> > +             ret =3D gem_close_bo(ctx, data.handles[i]);
> > +
> > +             if (ret =3D=3D 0) {
> > +                     num_handles +=3D 1;
> > +             } else {
> > +                     igt_assert_eq(errno, EINVAL);
> > +             }
> > +     }
> > +     igt_assert(num_handles >=3D 1 && num_handles <=3D 2);
> > +}
> > +
> > +/**
> > + * test_race_change_export_import - Test for race conditions of change=
_handle against prime export / import
> > + *
> > + * Start two threads, one of which attempts to change between four han=
dles while the other exports
> > + * handles, then imports them again. Check for race conditions such as=
 changing a handle while exporting
> > + * it or important a handle while changing it.
> > + */
> > +static void test_race_change_export_import(struct gpu_ctx *ctx)
> > +{
> > +     pthread_t thread_change, thread_export_import;
> > +     struct change_handle_thread_data data =3D {0};
> > +     int num_handles, ret;
> > +
> > +     set_up_context(&data, ctx);
> > +
> > +     /* Start both threads simultaneously */
> > +     igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_=
thread, &data), 0);
> > +     igt_assert_eq(pthread_create(&thread_export_import, NULL, export_=
import_thread, &data), 0);
> > +
> > +     /* Let them race */
> > +     sleep(RACE_DURATION_SEC);
> > +
> > +     __atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> > +     pthread_join(thread_change, NULL);
> > +     pthread_join(thread_export_import, NULL);
> > +
> > +     pthread_barrier_destroy(&data.barrier);
> > +
> > +     igt_assert_eq(data.unexpected_errno, 0);
> > +
> > +     /* Exporting a handle doesn't close it, so should still be exactl=
y 2 */
> > +     num_handles =3D 0;
> > +     for (int i =3D 0; i < 4; i++) {
> > +             ret =3D gem_close_bo(ctx, data.handles[i]);
> > +
> > +             if (ret =3D=3D 0) {
> > +                     num_handles +=3D 1;
> > +             } else {
> > +                     igt_assert_eq(errno, EINVAL);
> > +             }
> > +     }
> > +     igt_assert_eq(num_handles, 2);
> > +}
> > +
> > +int igt_main()
> > +{
> > +     struct gpu_ctx ctx =3D { .fd =3D -1 };
> > +
> > +     igt_fixture() {
> > +             ctx.fd =3D drm_open_driver_render(DRIVER_ANY);
> > +             igt_require(ctx.fd >=3D 0);
> > +
> > +             ctx.driver =3D detect_driver(ctx.fd);
> > +             igt_require_f(ctx.driver !=3D DRIVER_TYPE_UNKNOWN,
> > +                           "Unsupported GPU driver\n");
> > +
> > +             if (ctx.driver =3D=3D DRIVER_TYPE_I915)
> > +                     igt_require_gem(ctx.fd);
> > +
> > +             igt_require_f(!is_ioctl_disabled(&ctx),
> > +                           "GEM_CHANGE_HANDLE ioctl appears to be disa=
bled.\n");
> > +     }
> > +
> > +     igt_describe("Sanity Test: Change handle actually changes handle"=
);
> > +     igt_subtest("sanity")
> > +             test_sanity(&ctx);
> > +
> > +     igt_describe("Functionality Test: Change handle affects result of=
 prime import");
> > +     igt_subtest("change_prime")
> > +             test_change_export(&ctx);
> > +
> > +     igt_describe("Edge Case: New handle =3D 0 should fail");
> > +     igt_subtest("new_handle_zero")
> > +             test_new_handle_zero(&ctx);
> > +
> > +     igt_describe("Edge Case: New handle > INT_MAX should fail");
> > +     igt_subtest("new_handle_exceeds_int_max")
> > +             test_new_handle_exceeds_int_max(&ctx);
> > +
> > +     igt_describe("Edge Case: Changing a handle to itself should fail"=
);
> > +     igt_subtest("new_handle_equals_old_handle")
> > +             test_new_handle_equals_old_handle(&ctx);
> > +
> > +     igt_describe("Edge Case: Change a handle to a value which is take=
n should fail");
> > +     igt_subtest("new_handle_taken")
> > +             test_new_handle_taken(&ctx);
> > +
> > +     igt_describe("Edge Case: Changing a non-existent handle should fa=
il");
> > +     igt_subtest("invalid_handle")
> > +             test_invalid_handle(&ctx);
> > +
> > +     igt_describe("Race: Changing handle vs. Changing handle");
> > +     igt_subtest("race_change_change")
> > +             test_race_change_change(&ctx);
> > +
> > +     igt_describe("Race: Changing handle vs. Create / Close");
> > +     igt_subtest("race_change_create_close")
> > +             test_race_change_create_close(&ctx);
> > +
> > +     igt_describe("Race: Changing handle vs. Export / Import");
> > +     igt_subtest("race_change_export_import")
> > +             test_race_change_export_import(&ctx);
> > +
> > +     igt_fixture() {
> > +             drm_close_driver(ctx.fd);
> > +     }
> > +
> > +}
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 519a9e727..567878df6 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -105,6 +105,7 @@ intel_i915_progs =3D [
> >       'gem_blits',
> >       'gem_busy',
> >       'gem_caching',
> > +     'gem_change_handle',
> >       'gem_create',
> >       'gem_ccs',
> >       'gem_close',
>
