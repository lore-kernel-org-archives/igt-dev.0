Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <160874363549.26584.6058668253250806056@emeril.freedesktop.org>
References: <20201223161152.289279-1-matthew.auld@intel.com>
 <160874363549.26584.6058668253250806056@emeril.freedesktop.org>
Subject: Re: [igt-dev] =?unknown-8bit?b?4pyT?= Fi.CI.BAT: success for i915/tests: shadow peek
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 23 Dec 2020 20:52:24 +0000
Message-ID: <160875674443.15843.13547844508851465628@build.alporthouse.com>
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
To: Matthew Auld <matthew.auld@intel.com>, Patchwork <patchwork@emeril.freedesktop.org>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Email went astray, so replying here instead.

Yes, putting the shadow into the ppGTT is a huge violation, and not
being able to prevent reads make it even worse. I'm really tempted to
make it igt_warn if we are able to read the shadow anyway.

The guess at the shadow location feels a little weak. It suggests that
we should always prefer a random location for the shadow, and the test
itself should try a few times in case it doesn't read back the batch on
the first guess.

And the test should try writing garbage into the shadow to make sure our
write protection holds.

The test can further demonstrate an ABI variation by overwriting the
batch mid-execution to prove that the execution is from the shadow
instead. (That occurs a few times in igt were we cannot use bcs due to
the cmdparser breaking the regular ABI.)
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
