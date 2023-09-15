Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 15 Sep 2023 14:28:49 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20230915142849.5c620a00@maurocar-mobl2>
In-Reply-To: <20230908123233.137134-32-janusz.krzysztofik@linux.intel.com>
References: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
 <20230908123233.137134-32-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2 13/17] lib/ktap:
 Reimplement KTAP parser
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Isabella Basso <isabbasso@riseup.net>, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri,  8 Sep 2023 14:32:47 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

Forgot to mention on my past review:

> +				       &n, &len) == 1 && len == strlen(buf))) {
> +		/*
> +		 * TODO: drop the following workaround as soon as
> +		 * kernel side issue of missing lines with top level
> +		 * KTAP version and test suite plan is fixed.
> +		 */

Please add a link to lore with the thread discussing the issue upstream,
as it can be helpful while this workaround is here.

Also, I would place the workaround on a separate patch, to make
easier to revert it when upstream fixes it.
