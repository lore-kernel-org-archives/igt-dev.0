Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83866E193
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 09:34:25 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4HNFsq6Zqpz4x4jS
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 09:34:23 +0000 (UTC)
Date: Mon, 04 Oct 2021 09:34:18 +0000
From: Simon Ser <contact@emersion.fr>
Message-ID: <hLg9fLkq8x4hy7DqsQM-GFlKgXYsJJ97Jug9rX1JwxIsVUoRFiZM4CeAG8rpwpMxrXjgaqzXl8G2H3z3id9dMw4XGLExOW19G7OitDw2_J4=@emersion.fr>
In-Reply-To: <YVrKRXeGi2V37xCP@platvala-desk.ger.corp.intel.com>
References: <20210903123027.1433-1-contact@emersion.fr>
 <YVrKRXeGi2V37xCP@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [RFC i-g-t] tests/kms_lease: add empty lease test
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Monday, October 4th, 2021 at 11:29, Petri Latvala <petri.latvala@intel.c=
om> wrote:

> When is the kernel change going to hit drm-tip? We're going to need a
> bug report and cibuglog filter for this failing without it if this is
> merged before kernel. (Which is ok, with the bug filing done)

Thanks for the review!

Sorry, I got a bit eager and forgot about IGT. I've already merged that
patch to drm-misc-next, so it should be in drm-tip already.
