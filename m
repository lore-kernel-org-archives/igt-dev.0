Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAD06EC73
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2020 12:14:34 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201103104813.18236-3-tzimmermann@suse.de>
References: <20201103104813.18236-1-tzimmermann@suse.de>
 <20201103104813.18236-3-tzimmermann@suse.de>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 03 Nov 2020 12:14:30 +0000
Message-ID: <160440567067.21466.10243802700156363634@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH 2/2] tests/fbdev: Add tests for read/write ops
 on framebuffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, igt-dev@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Thomas Zimmermann (2020-11-03 10:48:13)
> Read and write tests check the read and written buffer against the
> content of the mapped framebuffer. Fbdev has some specific behavior
> when reading/writing near the EOF, which the eof test checks.

Subtests are run independently. If you need something across multiple
tests, put it into a fixture (ideally within a subtest group), or
instantiate it per subtest (more common approach with each subtest being
its own routine).
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
