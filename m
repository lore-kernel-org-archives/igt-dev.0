Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A94889D8D
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2020 15:10:31 +0000 (UTC)
Date: Mon, 20 Jul 2020 18:10:26 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200720151026.d7wrd65vlrval3cx@ahiler-desk1.fi.intel.com>
References: <cover.1594897760.git.melissa.srw@gmail.com>
 <e2e335dbf2189ea9ece3373364520eca8eb3349b.1594897760.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2e335dbf2189ea9ece3373364520eca8eb3349b.1594897760.git.melissa.srw@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/1] test/kms_cursor_crc: release old
 pipe_crc before create a new one
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
To: Melissa Wen <melissa.srw@gmail.com>
Cc: igt-dev@lists.freedesktop.org, kernel-usp@googlegroups.com, twoerner@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jul 16, 2020 at 08:25:21AM -0300, Melissa Wen wrote:
> When a subtest fails, it skips the cleanup, and its pipe_crc remains allocated.
> As a consequence, the following subtest also fails (timeout) when trying to
> create a new one. This patch releases any remaining pipe_crc to enable the
> creation of a new one for the next subtest.
> 
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>

Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

and merged, thanks!
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
