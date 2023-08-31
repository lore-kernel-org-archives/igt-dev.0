Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443F610E073
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 12:30:45 +0000 (UTC)
Date: Thu, 31 Aug 2023 14:30:40 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20230831143040.11f82c2b@maurocar-mobl2>
In-Reply-To: <20230831113936.4075130-1-katarzyna.dec@intel.com>
References: <20230831113936.4075130-1-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] IGT XE documentation cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Gandi Ramadevi <ramadevi.gandi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 31 Aug 2023 11:39:34 +0000
Katarzyna Dec <katarzyna.dec@intel.com> wrote:

> Let's add missing documentation fileds that are causing warnings.
> Some tests documentation needed changes to have more accurate naming.
> Let's mark Negative and Stress tests.
> Adding missing 'Run type' and 'Test category' for remaining test.

Kasia,

Besides the changes, could you please also change the
sub-category field and/or Functionalities for xe_mmap.c?

Right now, both are using "mmap" bucket. This is valid for
the documentation itself, but it causes confusion when analyzing
the results later on, as there will be two buckets with the same
name but different meanings.

Perhaps we could use Sub-category == "VMA".

What do you think?

Another issue I noticed in this series is that we have "Blitter"
with the first letter in uppercase. Perhaps there are more cases like
that. Please let's use lowercase on such buckets, as this is less
prone to errors (IMO).

Regards,
Mauro
