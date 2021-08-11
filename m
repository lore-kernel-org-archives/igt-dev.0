Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491506E106
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Aug 2021 18:12:25 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4GlHwR2RWGz4x3Y2
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Aug 2021 18:12:23 +0000 (UTC)
Date: Wed, 11 Aug 2021 18:12:17 +0000
From: Simon Ser <contact@emersion.fr>
Message-ID: <a9_F7T35e05gu3y6tyv9fpwmjYLweZYbqlgiscp9GtZpXGZXL68-q_34K0C77recaCUpHfnS67aTjB8oemTAlcIE3u5SQ56aFqf7wfq8jqA=@emersion.fr>
In-Reply-To: <20210811180217.91142-1-lucas.demarchi@intel.com>
References: <20210811180217.91142-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_edid: fix edid field name
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, kunal1.joshi@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>

Can you also send a patch to fix the kernel? struct edid comes from
include/drm/drm_edid.h.
