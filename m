Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 3 Mar 2022 05:52:57 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Message-ID: <YiCeCeNobS2FCiQB@intel.com>
References: <20220303090507.grenwdro7u4fzmoe@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303090507.grenwdro7u4fzmoe@houat>
Subject: Re: [igt-dev] Mandatory Test Suite for KMS Drivers?
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 03, 2022 at 10:05:07AM +0100, Maxime Ripard wrote:
> Hi,
> 
> Back at XDC we floated the idea of creating a test suite for IGT that we
> expect any KMS driver to pass, similar to what v4l2-compliance and
> cec-compliance provide for v4l2 and CEC respectively.
> 
> I was looking at the list of tests, and it's fairly massive, so it's not
> clear to me what tests we could start this suite with. I can only assume
> all the KMS (but the chamelium ones) and fbdev related ones would be a
> good start?
> 
> What do you think?

I believe we should start with the group of the tests that we know that
are reliably passing today on most of the platforms and then increase
the list as the tests and drivers become more reliable.

For instance, many of these would be candidate to be filtered out for now
https://intel-gfx-ci.01.org/tree/drm-next/index.html?testfilter=kms

compared to the whole view of kms tests:
https://intel-gfx-ci.01.org/tree/drm-next/shards-all.html?testfilter=kms

Thanks,
Rodrigo.

> Maxime

